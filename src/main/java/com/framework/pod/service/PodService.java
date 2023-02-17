package com.framework.pod.service;

import java.util.List;
import java.util.Map;

public interface PodService {

	public List<Map<String, Object>> selectPodList(Map<String, Object> map) throws Exception;
	
}
