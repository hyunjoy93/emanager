package com.framework.evt.controller;

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
import com.framework.evt.service.EvtService;
import com.framework.utl.StringUtil;

@RestController
public class EvtRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EvtService evtService; 

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", evtService.selectEventList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/info", method=RequestMethod.POST)
	public Map<String, Object> info(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 상세
			super.setInfo(map, request, "info", evtService.selectEventInfo(map));
			
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
	@RequestMapping(value="/api/evt/newAlarmCount", method=RequestMethod.POST)
	public Map<String, Object> newAlarmCount(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 건수
			super.setInfo(map, request, "info", evtService.selectNewAlarmCount(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트1차인지
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateOnePerceive", method=RequestMethod.POST)
	public Map<String, Object> updateOnePerceive(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateOnePerceive(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 이벤트2차인지
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateTwoPerceive", method=RequestMethod.POST)
	public Map<String, Object> updateTwoPerceive(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
						
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateTwoPerceive(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트1차이관
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateOneTransfer", method=RequestMethod.POST)
	public Map<String, Object> updateOneTransfer(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
						
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateOneTransfer(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트2차이관
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateTwoTransfer", method=RequestMethod.POST)
	public Map<String, Object> updateTwoTransfer(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
						
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateTwoTransfer(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트생성
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/createIncident", method=RequestMethod.POST)
	public Map<String, Object> createIncident(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			String[] arrEventId = StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ",");
			map.put("arrEventId", arrEventId);
			
			// 생성
			super.setResCodeDbIud(map, request, evtService.createIncident(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트조치완료
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateEventEnd", method=RequestMethod.POST)
	public Map<String, Object> updateEventEnd(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateEventEnd(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트저장
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/updateEventSave", method=RequestMethod.POST)
	public Map<String, Object> updateEventSave(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
			
			// 수정
			super.setResCodeDbIud(map, request, evtService.updateEventSave(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 인시던트ID IN 이벤트ID
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/selectIcdIdInEvtId", method=RequestMethod.POST)
	public Map<String, Object> selectIcdIdInEvtId(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 인시던트ID
			super.setInfo(map, request, "info", evtService.selectIcdIdInEvtId(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 이벤트 일괄 종료처리
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/evt/endSelectedEventList", method=RequestMethod.POST)
	public Map<String, Object> endSelectedEventList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 이벤트ID
			map.put("arrEventId", StringUtil.split(StringUtil.isNullToString(map.get("eventId")), ","));
						
			// 수정
			super.setResCodeDbIud(map, request, evtService.endSelectedEventList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
}
