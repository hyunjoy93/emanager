package com.framework.stt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.stt.service.SttService;
import com.framework.utl.ExcelUtil;

@RestController
public class SttRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SttService sttService;

	/**
	 * 목록
	 * 
	 * @param Map<String,        Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value = "/api/stt/list", method = RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request,
			PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			// 목록
			super.setPagingList(map, request, pagingDto, "InventoryList", sttService.selectInventoryList(map));

		} catch (Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 엑셀업로드
	 * 
	 * @param Map<String,        Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value = "/api/stt/excelUpload", method = RequestMethod.POST)
	public Map<String, Object> excelUpload(@RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, MultipartFile file) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			if (file.isEmpty()) {
				map.put("insertResult", "failed");
				return map;
			}

			// 엑셀파일 확장자 체크
			String fileNm = file.getOriginalFilename();
			String sxn = fileNm.substring(fileNm.lastIndexOf('.') + 1);

			if (!(sxn.equals("xlsx") || sxn.equals("csv"))) {
				map.put("insertResult", "failed");
				map.put("errMsg", "파일형식 오류입니다.");
				return map;
			}

			// 엑셀 헤더 정보 구성
			String[] headerInfo = { "zone", "loc_nm", "datacenter_nm", "rack_location", "equip_position", "own_dept_nm",
					"center_nm", "equnr", "host_nm", "mgmt_ip", "ipmi_ip", "std_cd", "std_nm", "e_std_cd", "e_std_nm",
					"svc_usage", "platform", "platform_ver", "os", "os_ver", "usage", "hw_yn", "csw_yn", "os_yn" };
			
			List<Map<String, Object>> ivtList = new ArrayList<>();
			
			if(sxn.equals("xlsx")) {
				ivtList = ExcelUtil.getListData(file, headerInfo);
			}
			else if(sxn.equals("csv")) {
				ivtList = ExcelUtil.getCsvData(file, headerInfo);
			}
			
//			int mapCnt = 0;
//			// excel 데이터 가져오기
//			for (Map<String, Object> map2 : ivtList) {
//				for (Map.Entry<String, Object> entry : map2.entrySet()) {
//					String key = entry.getKey();
//					Object value = entry.getValue();
//
//					System.out.println("key: " + key + " | value: " + value);
//
//					if (key.equals("chkFlag") && map2.get("chkFlag").equals("fail")) {
//						map.put("insertResult", "failed");
//						map.put("errPos", map2.get("errPos"));
//						map.put("errMsg", map2.get("errMsg"));
//
//						return map;
//					}
//				}
//				mapCnt++;
//			}
//			System.out.println("mapCnt:: "+mapCnt);
//			System.out.println("ivtList.size:: "+ivtList.size());
			
			int insRes = 0;
			int cutSize = 1500;
			
			if(ivtList.size() > cutSize) {
				int size = ivtList.size() / cutSize;
			
				List<Map<String, Object>> ivtSubList = new ArrayList<>(); 
				
				for(var i=0;i<=size;i++) {
					if(ivtList.size() >= cutSize*(i+1)) {
						ivtSubList = ivtList.subList(cutSize*i, cutSize*(i+1));
					}
					else {
						ivtSubList = ivtList.subList(cutSize*i, ivtList.size());
					}

					map.put("ivtList", ivtSubList);

					// 가져온 데이터 insert
					insRes = sttService.insertInventory(map);
				}
			}
			else {
				map.put("ivtList", ivtList);

				// 가져온 데이터 insert
				insRes = sttService.insertInventory(map);
			}

			if (insRes > 0) {
				map.put("insertResult", "successed");
			} else {
				map.put("insertResult", "failed");
			}

		} catch (Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 인벤토리 저장 등록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/stt/save", method=RequestMethod.POST)
	public Map<String, Object> save(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		JSONArray jsonArr1 = new JSONArray(map.get("insertList").toString());
		JSONArray jsonArr2 = new JSONArray(map.get("updateList").toString());
		
		List<Map<String, Object>> insertList = new ArrayList<>();
		List<Map<String, Object>> updateList = new ArrayList<>();
		
		// 추가 데이터 insert
		for (int i = 0; i < jsonArr1.length(); i++) {
		    JSONObject jsonObj = jsonArr1.getJSONObject(i);
		    
		    Map<String, Object> tmpMap = jsonObj.toMap();
		    
		    //System.out.println(jsonObj);
		    
		    insertList.add(tmpMap);
		}
		
		map.put("ivtList", insertList);

		// 가져온 데이터 insert
		int insRes = sttService.insertInventory(map);
		
		if(jsonArr1.length()==0) {
			insRes = 1;
		}
		
		// 수정한 데이터 update
		for (int i = 0; i < jsonArr2.length(); i++) {
		    JSONObject jsonObj = jsonArr2.getJSONObject(i);
		    
		    Map<String, Object> tmpMap = jsonObj.toMap();
		    
		    //System.out.println(jsonObj);
		    
		    updateList.add(tmpMap);
		}
		
		map.put("updateList", updateList);

		// 가져온 데이터 insert
		int updRes = sttService.updateInventory(map);
		
		if(jsonArr2.length()==0) {
			updRes = 1;
		}
		
		if (insRes > 0  && updRes > 0) {
			map.put("saveResult", "successed");
		} else {
			map.put("saveResult", "failed");
		}
		
		return map;
	}
	
	/**
	 * 인벤토리 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/stt/delete", method=RequestMethod.POST)
	public Map<String, Object> delete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		super.setInit(map, request);
		
		int delRes = sttService.deleteInventory(map);
		
		if(delRes > 0) {
			map.put("deleteResult", "successed");
		} else {
			map.put("deleteResult", "failed");
		}
		return map;
	}

}
