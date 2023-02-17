package com.framework.icd.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.icd.service.IcdService;
import com.framework.utl.StringUtil;

@RestController
public class IcdRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IcdService icdService; 

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", icdService.selectIcdList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트 상황관리 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/detail", method=RequestMethod.POST)
	public Map<String, Object> detail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setList(map, request, "popEvtList", icdService.popEvtList(map)); // 인시던트 상세보기 팝업 내 이벤트 제목 리스트 조회 select-box
			super.setInfo(map, request, "detail", icdService.detail(map)); // 인시던트 상세보기 팝업
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트 상황관리 팝업 인시던트 조치내역
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/proclist", method=RequestMethod.POST)
	public Map<String, Object> proclist(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setList(map, request, "icdProcList", icdService.icdProcList(map)); // 인시던트 처리현황 리스트 조회
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 신규알람건수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/newAlarmCount", method=RequestMethod.POST)
	public Map<String, Object> newAlarmCount(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 건수
			super.setInfo(map, request, "info", icdService.selectNewAlarmCount(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트 상황관리 팝업 저장
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/save", method=RequestMethod.POST)
	public Map<String, Object> save(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {	
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, icdService.icdInfoUpdate(map));
			
		} catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		return map;
	}
	
	/**
	 * 인시던트 상황관리 팝업 조치완료
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/end", method=RequestMethod.POST)
	public Map<String, Object> end(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, icdService.icdStatusEnd(map));
			
		} catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		return map;
	}
	
	/**
	 * 인시던트 상황관리 조치내역 추가
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/proc", method=RequestMethod.POST)
	public Map<String, Object> proc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
				
		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, icdService.insertIcdProc(map));
			
		} catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		return map;
	}
	
	/**
	 * 인시던트 상황관리 조치내역 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/icd/udpProc", method=RequestMethod.POST)
	public Map<String, Object> udpProc(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
				
		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, icdService.updateIcdProc(map));
			
		} catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
		return map;
	}
}
