package com.framework.mkt.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.mkt.service.MktService;

@RestController
public class MktRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MktService mktService; 

	/**
	 * 실시간 대응
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mkt/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", mktService.selectMktList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 장애 이력
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/api/mkt/history")
	public ModelAndView subIncidentHistory(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "mkt/history");
		
		return mav;
	}
	
	
	/**
	 * 장애이력 상세 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/mkt/detail", method=RequestMethod.POST)
	public Map<String, Object> detail(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 			
			super.setInfo(map, request, "detail", mktService.detail(map)); // 인시던트 상세내용
			super.setList(map, request, "icdProcList", mktService.icdProcList(map)); // 인시던트 조치내역 List
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
}
