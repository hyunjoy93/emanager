package com.framework.cst.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.CstMapper;

@Service
public class CstServiceImpl implements CstService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CstMapper cstMapper;

	@Override
	public List<Map<String, Object>> selectCstList(Map<String, Object> map) throws Exception {
		return cstMapper.selectCstList(map);
	}
	
}	
