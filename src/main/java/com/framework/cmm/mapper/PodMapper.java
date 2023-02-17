package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PodMapper {

	public List<Map<String, Object>> selectPodList(Map<String, Object> map) throws Exception;

}
