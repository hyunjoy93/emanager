package com.framework.evt.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.EvtMapper;
import com.framework.cmm.mapper.IcdMapper;

@Service
public class EvtServiceImpl implements EvtService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EvtMapper evtMapper;

	@Autowired
	private IcdMapper icdMapper;
	
	@Override
	public List<Map<String, Object>> selectEventList(Map<String, Object> map) throws Exception {
		return evtMapper.selectEventList(map);
	}
	
	@Override
	public Map<String, Object> selectEventInfo(Map<String, Object> map) throws Exception {
		return evtMapper.selectEventInfo(map);
	}
	
	@Override
	public Map<String, Object> selectNewAlarmCount(Map<String, Object> map) throws Exception {
		return evtMapper.selectNewAlarmCount(map);
	}
	
	@Override
	public int updateOnePerceive(Map<String, Object> map) throws Exception {
		return evtMapper.updateOnePerceive(map);
	}
	
	@Override
	public int updateTwoPerceive(Map<String, Object> map) throws Exception {
		return evtMapper.updateTwoPerceive(map);
	}
	
	@Override
	public int updateOneTransfer(Map<String, Object> map) throws Exception {
		return evtMapper.updateOneTransfer(map);
	}
	
	@Override
	public int updateTwoTransfer(Map<String, Object> map) throws Exception {
		return evtMapper.updateTwoTransfer(map);
	}	
	public int createIncident(Map<String, Object> map) throws Exception {
		int updCnt = 0;
		int insCnt = icdMapper.insertIcd(map);
		if(0 < insCnt) {
			updCnt = evtMapper.updateEventIncidentId(map);
		}
		return (insCnt + updCnt);
	}
	
	@Override
	public int updateEventEnd(Map<String, Object> map) throws Exception {
		return evtMapper.updateEventEnd(map);
	}
	
	@Override
	public int updateEventSave(Map<String, Object> map) throws Exception {
		return evtMapper.updateEventSave(map);
	}
	
	@Override
	public Map<String, Object> selectIcdIdInEvtId(Map<String, Object> map) throws Exception {
		return icdMapper.selectIcdIdInEvtId(map);
	}

	@Override
	public int endSelectedEventList(Map<String, Object> map) throws Exception {
		return evtMapper.endSelectedEventList(map);
	}

}	
