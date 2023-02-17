package com.framework.cmm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MktMapper {

	public List<Map<String, Object>> selectMktList(Map<String, Object> map) throws Exception;
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> mktIcdProcList(Map<String, Object > map) throws Exception;

}
