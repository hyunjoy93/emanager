package com.framework.icd.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
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
public class IcdController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 인시던트관리 > 인시던트 상황 관리
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/icd/subIncidentState")
	public ModelAndView subIncidentState(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "icd/subIncidentState");
		
		// 서버시간 설정
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		mav.addObject("serverTime", formatedNow);
		
		return mav; 
	}
	
	/**
	 * 인시던트관리 > 인시던트 이력 조회
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/icd/subIncidentHistory")
	public ModelAndView subIncidentHistory(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "icd/subIncidentHistory");
		
		return mav;
	}

	/**
	 * 인시던트관리 > 장애복구View(팝업)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/icd/subIncidentHistoryPop")
	public ModelAndView subIncidentRestorePop(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "icd/subIncidentHistoryPop");
		
		return mav;
	}
	
}
