package com.framework.ctl.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.CtlMapper;
import com.framework.cmm.mapper2.EtcMapper;

@Service
public class CtlServiceImpl implements CtlService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CtlMapper ctlMapper;

	@Autowired
	private EtcMapper etcMapper;
	
	@Override
	public List<Map<String, Object>> selectCtlList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectCtlList(map);
	}
	
	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
		// etcMapper.selectUserInfo(map);
		return ctlMapper.selectUserInfo(map);
	}
	
	@Override
	public int insertUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertUser(map);
	}

	@Override
	public int insertLdapUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertLdapUser(map);
	}
	
	@Override
	public int idCheck(Map<String, Object> map) throws Exception {
		return ctlMapper.idCheck(map);
	}
	
	@Override
	public int updateUser(Map<String, Object> map) throws Exception {
		return ctlMapper.updateUser(map);
	}

	@Override
	public int deleteUser(Map<String, Object> map) throws Exception {
		return ctlMapper.deleteUser(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSmsUserList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectSmsUserList(map);
	}
	
	@Override
	public int insertSmsUser(Map<String, Object> map) throws Exception {
		return ctlMapper.insertSmsUser(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSmsList(Map<String, Object> map) throws Exception {
		return ctlMapper.selectSmsList(map);
	}
	
	@Override
	public int smsUpdateUser(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUpdateUser(map);
	}
	
	@Override
	public int insertSmsRule(Map<String, Object> map) throws Exception {
		return ctlMapper.insertSmsRule(map);
	}
	
	@Override
	public int smsUpdate(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUpdate(map);
	}

	@Override
	public int smsDelete(Map<String, Object> map) throws Exception {
		return ctlMapper.smsDelete(map);
	}
	
	@Override
	public int smsUserDelete(Map<String, Object> map) throws Exception {
		return ctlMapper.smsUserDelete(map);
	}
	
}	
