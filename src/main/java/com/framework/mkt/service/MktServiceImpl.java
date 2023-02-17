package com.framework.mkt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.MktMapper;

@Service
public class MktServiceImpl implements MktService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MktMapper mktMapper;

	@Override
	public List<Map<String, Object>> selectMktList(Map<String, Object> map) throws Exception {
		return mktMapper.selectMktList(map);
	}
	
	@Override
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception {
		return mktMapper.detail(map);
	}

	@Override
	public List<Map<String, Object>> icdProcList(Map<String, Object> map) throws Exception {
		return mktMapper.mktIcdProcList(map);
	}

}	
