package com.framework.stt.service;

import java.util.List;
import java.util.Map;

public interface SttService {
	
	public List<Map<String, Object>> selectInventoryList(Map<String, Object> map) throws Exception;
	public int insertInventory(Map<String, Object> ivtList) throws Exception;
	public int deleteInventory(Map<String, Object> map) throws Exception;
	public int updateInventory(Map<String, Object> updateList) throws Exception;
}
