package com.framework.evt.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.cmm.helper.WebControllerHelper;

@Controller
public class EvtController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 이벤트 > 이벤트 상황 관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/evt/subEventState")
	public ModelAndView subEventState(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "evt/subEventState");
		
		return mav;
	}

	/**
	 * 이벤트 > 이벤트 이력 조회
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/evt/subEventHistory")
	public ModelAndView subEventHistory(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "evt/subEventHistory");
		
		return mav;
	}
	
	/**
	 * 이벤트 > VOC 등록
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/evt/subEventVoc")
	public ModelAndView subEventVoc(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "evt/subEventVoc");
		
		return mav;
	}
	
}
