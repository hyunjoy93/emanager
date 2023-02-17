package com.framework.cmm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.framework.cmm.configuration.Constant;
import com.framework.utl.BizUtil;

@SuppressWarnings("deprecation")
public class LoggerInterceptor extends HandlerInterceptorAdapter{

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {				
		log.debug("====================================== preHandle ======================================");
		boolean isNext = true;
		
		String reqUrl = request.getRequestURI();
		log.debug("####### Request URI #######" + reqUrl + "#######");
		
		boolean isLogin = BizUtil.isLogin(request);
		request.setAttribute("isLogin", isLogin);
		
		request.setAttribute("successResCode", Constant.SUCCESS_RES_CODE);
		request.setAttribute("failResCode", Constant.FAIL_RES_CODE);
		request.setAttribute("noChangeDataResCode", Constant.NO_CHANGE_DATA_RES_CODE);
		request.setAttribute("successResMsg", Constant.SUCCESS_RES_MSG);
		request.setAttribute("failResMsg", Constant.FAIL_RES_MSG);
		request.setAttribute("noChangeDataResMsg", Constant.NO_CHANGE_DATA_RES_MSG);
		request.setAttribute("longLogoutMsg", Constant.LONG_LOGOUT_MSG);
		request.setAttribute("defaultDate", Constant.DEFAULT_DATE);
		
		log.debug("####### isLogin #######" + isLogin + "#######");
		
		return isNext;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		log.debug("====================================== postHandle ======================================");
	}
	
}

