package com.framework.ctl.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.cmm.configuration.Constant;
import com.framework.cmm.dto.PagingDto;
import com.framework.cmm.helper.WebControllerHelper;
import com.framework.ctl.service.CtlService;
import com.framework.utl.BizUtil;
import com.framework.utl.StringUtil;

@RestController
public class CtlRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CtlService ctlService; 

	@Value("${server.mode}")
	String serverMode;
	
	/**
	 * 사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", ctlService.selectCtlList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}

	/**
	 * 로그인
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/login", method=RequestMethod.POST)
	public Map<String, Object> login(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 패스워드
			String paramPassWord = StringUtil.isNullToString(map.get("loginPassword"), "");
			
			// 패스워드 SHA256 암호화
			map.put("loginPassword", BizUtil.encryptPassword(paramPassWord));
			
			// 사용자정보
			super.setInfo(map, request, "info", ctlService.selectUserInfo(map));
			
			// 로그인 처리
			if(Constant.SUCCESS_RES_CODE.equals(map.get("resCode"))) {
				request.getSession().setAttribute("loginInfo", map.get("info"));
			}

		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	
	/**
	 * 사용자관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/add", method=RequestMethod.POST)
	public Map<String, Object> insertUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 사용자관리 아이디 중복 체크
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/check", method=RequestMethod.POST)
	public Map<String, Object> idCheck(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		int result = ctlService.idCheck(map);
		
		if(result > 0) {
			map.put("idCheckResult", "disable");
		} else {
			map.put("idCheckResult", "able");
		}

		return map;
	}
	
	
	/**
	 * 사용자관리 사용자 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/update", method=RequestMethod.POST)
	public Map<String, Object> updateUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.updateUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 사용자관리 사용자 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/delete", method=RequestMethod.POST)
	public Map<String, Object> deleteUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.deleteUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	
	
	/**
	 * sms사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUserList", method=RequestMethod.POST)
	public Map<String, Object> smsUserList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "smsUserList", ctlService.selectSmsUserList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * sms사용자관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/insertSmsUser", method=RequestMethod.POST)
	public Map<String, Object> insertSmsUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertSmsUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * sms사용자관리 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsList", method=RequestMethod.POST)
	public Map<String, Object> smsList(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "smsList", ctlService.selectSmsList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
	/**
	 * 공지그룹 관리 사용자 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUpdateUser", method=RequestMethod.POST)
	public Map<String, Object> smsUpdateUser(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUpdateUser(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 공지그룹 관리 사용자 추가 팝업
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	
	@RequestMapping(value="/api/ctl/insertSmsRule", method=RequestMethod.POST)
	public Map<String, Object> insertSmsRule(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			// 초기화
			super.setInit(map, request);
			
			// 등록
			super.setResCodeDbIud(map, request, ctlService.insertSmsRule(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	

	/**
	 * 공지그룹 관리 발송규칙 수정
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUpdate", method=RequestMethod.POST)
	public Map<String, Object> smsUpdate(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUpdate(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * 공지그룹 관리 발송규칙 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsDelete", method=RequestMethod.POST)
	public Map<String, Object> smsDelete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsDelete(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	/**
	 * SMS 사용자관리 발송규칙 삭제
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/ctl/smsUserDelete", method=RequestMethod.POST)
	public Map<String, Object> smsUserDelete(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		try {
			
			// 초기화
			super.setInit(map, request);		
			// 등록
			super.setResCodeDbIud(map, request, ctlService.smsUserDelete(map));
			
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}
	 
		return map;
	}
	
	
}
