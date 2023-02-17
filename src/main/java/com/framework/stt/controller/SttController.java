package com.framework.stt.controller;

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
public class SttController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 인벤토리 및 통계 > 관제대상 및 연동상태
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/stt/subStatsLinkage")
	public ModelAndView subStatsLinkage(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "stt/subStatsLinkage");
		
		return mav;
	}

	/**
	 * 인벤토리 및 통계 > 이벤트 통계(발생/조치/처리)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/stt/subStatsEvent")
	public ModelAndView subStatsEvent(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "stt/subStatsEvent");
		
		return mav;
	}
	
	/**
	 * 인벤토리 및 통계 > 인시던트 통계(발생/조치/처리)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/stt/subStatsIncident")
	public ModelAndView subStatsIncident(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "stt/subStatsIncident");
		
		return mav;
	}
	
	/**
	 * 인벤토리 및 통계 > 자원 사용률 통계
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/stt/subStatsUserrate")
	public ModelAndView subStatsUserrate(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "stt/subStatsUserrate");
		
		return mav;
	}
	
	/**
	 * 인벤토리 및 통계 > 매뉴얼 인벤토리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/stt/subStatsInventory")
	public ModelAndView subStatsInventory(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "stt/subStatsInventory");
		
		return mav;
	}
	
}
