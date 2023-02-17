package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EvtMapper {

	public List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectEventInfo(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectNewAlarmCount(Map<String, Object> map) throws Exception;
	public int updateOnePerceive(Map<String, Object> map) throws Exception;
	public int updateTwoPerceive(Map<String, Object> map) throws Exception;
	public int updateOneTransfer(Map<String, Object> map) throws Exception;
	public int updateTwoTransfer(Map<String, Object> map) throws Exception;
	public int updateEventIncidentId(Map<String, Object> map) throws Exception;
	public int updateEventEnd(Map<String, Object> map) throws Exception;
	public int updateEventSave(Map<String, Object> map) throws Exception;
	public int endSelectedEventList(Map<String, Object> map) throws Exception;
}
