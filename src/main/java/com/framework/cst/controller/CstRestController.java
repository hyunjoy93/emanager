package com.framework.cst.controller;

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
import com.framework.cst.service.CstService;

@RestController
public class CstRestController extends WebControllerHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CstService cstService; 

	/**
	 * 목록
	 * 
	 * @param Map<String, Object> map
	 * @param HttpServletRequest request
	 * @return json
	 * @exception Exception
	 */
	@RequestMapping(value="/api/cst/list", method=RequestMethod.POST)
	public Map<String, Object> list(@RequestParam Map<String, Object> map, HttpServletRequest request, PagingDto pagingDto) throws Exception {

		try {
			// 초기화
			super.setInit(map, request);
			
			// 목록 
			super.setPagingList(map, request, pagingDto, "list", cstService.selectCstList(map));
			
		}catch(Exception ex) {
			super.setResFail(map, request, ex);
		}

		return map;
	}
	
}
