package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SttMapper {

	public List<Map<String, Object>> selectInventoryList(Map<String, Object> map) throws Exception;
	public int insertInventory(Map<String, Object> ivtList) throws Exception;
	public int deleteInventory(Map<String, Object> map) throws Exception;
	public int updateInventory(Map<String, Object> updateList) throws Exception;

}
