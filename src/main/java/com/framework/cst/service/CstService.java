package com.framework.cst.service;

import java.util.List;
import java.util.Map;

public interface CstService {
	
	public List<Map<String, Object>> selectCstList(Map<String, Object> map) throws Exception;
	
}
