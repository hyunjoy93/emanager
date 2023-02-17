package com.framework.cst.controller;

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
public class CstController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 구성/성능관리 > 구성정보조회
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/cst/subManageConsist")
	public ModelAndView subManageConsist(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "cst/subManageConsist");
		
		return mav;
	}
	
	/**
	 * 구성/성능관리 > 성능정보조회
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/cst/subManagePerformance")
	public ModelAndView subManagePerformance(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "cst/subManagePerformance");
		
		return mav;
	}
	
}
