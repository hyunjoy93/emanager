package com.framework.pod.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.PodMapper;

@Service
public class PodServiceImpl implements PodService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PodMapper podMapper;

	@Override
	public List<Map<String, Object>> selectPodList(Map<String, Object> map) throws Exception {
		return podMapper.selectPodList(map);
	}
	
}	
