package com.framework.mkt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MktService {

	public List<Map<String, Object>> selectMktList(Map<String, Object> map) throws Exception;
	public HashMap<String, Object> detail(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> icdProcList(Map<String, Object > map) throws Exception;
	
}
