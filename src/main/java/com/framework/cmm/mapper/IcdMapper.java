package com.framework.cmm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IcdMapper {

	public List<Map<String, Object>> selectIcdList(Map<String, Object> map) throws Exception;
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> popEvtList(Map<String, Object > map) throws Exception;
	public Map<String, Object> selectNewAlarmCount(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> icdProcList(Map<String, Object > map) throws Exception;
	public int icdInfoUpdate(Map<String, Object> map) throws Exception;
	public int icdStatusEnd(Map<String, Object> map) throws Exception;
	public int insertIcdProc(Map<String, Object> map) throws Exception;
	public int insertIcd(Map<String, Object> map) throws Exception;
	public int updateIcdProc(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectIcdIdInEvtId(Map<String, Object> map) throws Exception;
}
