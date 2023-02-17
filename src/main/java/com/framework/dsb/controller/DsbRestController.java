package com.framework.dsb.controller;

import java.util.HashMap;
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
import com.framework.dsb.service.DsbService;

@RestController
public class DsbRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DsbService dsbService; 

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", dsbService.selectDsbList(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
		
	}
	
	/**
	 * 점검/인시던트 현황 건수
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/getCnt", method=RequestMethod.POST)
	public Map<String, Object> getCnt(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 점검 인시던트 현황
			Map<String, Object> cntMap = new HashMap<>();
			cntMap.put("evtCnt", dsbService.selectEvtCnt());
			cntMap.put("icdCnt", dsbService.selectIcdCnt());
			cntMap.put("errCnt", dsbService.selectErrCnt());
			cntMap.put("TotIcdCnt", dsbService.selectTotIcdCnt());
			super.setInfo(map, request, "cntMap", cntMap);
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
		
	}
			
	/**
	 * 이벤트/인시던트 차트
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/chart", method=RequestMethod.POST)
	public Map<String, Object> chart(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 이벤트/인시던트 차트 데이터조회
			super.setList(map, request, "chartData", dsbService.getChartData(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트 리스트
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/getIcdList", method=RequestMethod.POST)
	public Map<String, Object> getIcdList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//인시던트 목록
			super.setList(map, request, "IcdList", dsbService.selectIcdList());
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 서버현황
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/serverStat", method=RequestMethod.POST)
	public Map<String, Object> serverStat(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			Map<String, Object> cntMap = new HashMap<>();
			cntMap.put("TotEvtCnt", dsbService.selectEvtCnt());
			cntMap.put("TotIcdCnt", dsbService.selectTotIcdCnt());
			super.setInfo(map, request, "TotcntMap", cntMap);
			
			//서버현황
			super.setList(map, request, "ServerStat", dsbService.selectServerStat());
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 공지사항 리스트
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/getNoticeList", method=RequestMethod.POST)
	public Map<String, Object> getNoticeList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항
			super.setList(map, request, "NoticeList", dsbService.selectNotice());
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 작업현황
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/getExpList", method=RequestMethod.POST)
	public Map<String, Object> getExpList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항
			super.setList(map, request, "ExpList", dsbService.selectExpList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 공지사항 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/noticeDetail", method=RequestMethod.POST)
	public Map<String, Object> noticeDetail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			int idx = Integer.parseInt(String.valueOf(map.get("idx")));

			//공지사항
			super.setInfo(map, request, "noticeDetail", dsbService.selectNoticeDetail(idx));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 공지사항 리스트 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/popnoticeList", method=RequestMethod.POST)
	public Map<String, Object> popnoticeList(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);

			//공지사항
			super.setList(map, request, "noticeList", dsbService.selectPopNotice());
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
	
	/**
	 * 수집서버상태
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/dsb/getAgentStat", method=RequestMethod.POST)
	public Map<String, Object> getAgentStat(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			//수집서버상태			
			int agentCnt = dsbService.getAgentStat();

			if(agentCnt > 0) {
				map.put("agentStat", "error");
			}
			else {
				map.put("agentStat", "normal");
			}
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;	
	}
		
}
