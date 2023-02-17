package com.framework.icd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.IcdMapper;

@Service
public class IcdServiceImpl implements IcdService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IcdMapper icdMapper;

	@Override
	public List<Map<String, Object>> selectIcdList(Map<String, Object> map) throws Exception {
		return icdMapper.selectIcdList(map);
	}

	@Override
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception {
		return icdMapper.detail(map);
	}

	@Override
	public List<Map<String, Object>> popEvtList(Map<String, Object> map) throws Exception {
		return icdMapper.popEvtList(map);
	}

	@Override
	public Map<String, Object> selectNewAlarmCount(Map<String, Object> map) throws Exception {
		return icdMapper.selectNewAlarmCount(map);
	}

	@Override
	public List<Map<String, Object>> icdProcList(Map<String, Object> map) throws Exception {
		return icdMapper.icdProcList(map);
	}

	@Override
	public int icdInfoUpdate(Map<String, Object> map) throws Exception {
		return icdMapper.icdInfoUpdate(map);
	}

	@Override
	public int icdStatusEnd(Map<String, Object> map) throws Exception {
		return icdMapper.icdStatusEnd(map);
	}

	@Override
	public int insertIcdProc(Map<String, Object> map) throws Exception {
		return icdMapper.insertIcdProc(map);
	}

	@Override
	public int updateIcdProc(Map<String, Object> map) throws Exception {
		return icdMapper.updateIcdProc(map);
	}
	
}	
