package com.framework.pod.controller;

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
public class PodController extends WebControllerHelper {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/view/pod/ipc")
	public ModelAndView ipc(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/ipc");
		
		return mav;
	}
	
	@RequestMapping("/view/pod/epc")
	public ModelAndView epc(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/epc");
		
		return mav;
	}
	
	@RequestMapping("/view/pod/gcloud")
	public ModelAndView gcloud(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/gcloud");
		
		return mav;
	}
	
	@RequestMapping("/view/pod/infra")
	public ModelAndView infra(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/infra");
		
		return mav;
	}
	
	@RequestMapping("/view/pod/jogn")
	public ModelAndView jogn(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/jogn");
		
		return mav;
	}
	
	/**
	 * VM관리 > [CS] IPC-PROD > POD정보
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/pod/subPodVm")
	public ModelAndView subPodVm(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/subPodVm");
		
		return mav;
	}

	/**
	 * VM관리 > [CS] IPC-PROD > 고객정보(새창)
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/pod/subPodVmPop")
	public ModelAndView subPodVmPop(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/subPodVmPop");
		
		return mav;
	}
	
	/**
	 * VM관리 > [CS] IPC-PROD > 서비스요약
	 * 
	 * @return string
	 * @exception Exception
	 */
	@RequestMapping("/view/pod/subPodVmView")
	public ModelAndView subPodVmView(ModelAndView mav, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception{

		// 초기화
		super.setInit(mav, map, request);
		
		// 화면VIEW		
		super.setViewName(mav, map, "pod/subPodVmView");
		
		return mav;
	}
	
}
