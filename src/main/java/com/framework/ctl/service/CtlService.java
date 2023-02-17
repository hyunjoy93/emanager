package com.framework.ctl.service;

import java.util.List;
import java.util.Map;

public interface CtlService {
	
	public List<Map<String, Object>> selectCtlList(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;
	public int insertUser(Map<String, Object> map) throws Exception;
	public int insertLdapUser(Map<String, Object> map) throws Exception;
	public int idCheck(Map<String, Object> map) throws Exception;
	public int updateUser(Map<String, Object> map) throws Exception;
	public int deleteUser(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSmsUserList(Map<String, Object> map) throws Exception;
	public int insertSmsUser(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectSmsList(Map<String, Object> map) throws Exception;
	public int smsUpdateUser(Map<String, Object> map) throws Exception;
	public int insertSmsRule(Map<String, Object> map) throws Exception;
	public int smsUpdate(Map<String, Object> map) throws Exception;
	public int smsDelete(Map<String, Object> map) throws Exception;
	public int smsUserDelete(Map<String, Object> map) throws Exception;
}
