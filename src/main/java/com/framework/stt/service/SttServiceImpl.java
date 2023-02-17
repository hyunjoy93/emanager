package com.framework.stt.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.SttMapper;

@Service
public class SttServiceImpl implements SttService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SttMapper sttMapper;

	@Override
	public List<Map<String, Object>> selectInventoryList(Map<String, Object> map) throws Exception {
		return sttMapper.selectInventoryList(map);
	}
	
	@Override
	public int insertInventory(Map<String, Object> ivtList) throws Exception{
		return sttMapper.insertInventory(ivtList);
	}
	
	@Override
	public int deleteInventory(Map<String, Object> map) throws Exception{
		return sttMapper.deleteInventory(map);
	}
	
	@Override
	public int updateInventory(Map<String, Object> updateList) throws Exception{
		return sttMapper.updateInventory(updateList);
	}
	
}	
