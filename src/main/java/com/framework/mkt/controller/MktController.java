package com.framework.mkt.controller;

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
public class MktController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * M-Kate 장애View
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/mkt/mKate")
	public ModelAndView mKate(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "mkt/mKate");
		
		return mav;
	}

	/**
	 * M-Kate 장애View
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/mkt/mKateDetail")
	public ModelAndView mKateDetail(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "mkt/mKateDetail");
		
		return mav;
	}
	
}
