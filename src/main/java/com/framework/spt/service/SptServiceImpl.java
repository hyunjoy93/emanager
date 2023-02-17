package com.framework.spt.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.SptMapper;

@Service
public class SptServiceImpl implements SptService{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SptMapper sptMapper;

	@Override
	public List<Map<String, Object>> selectSptList(Map<String, Object> map) throws Exception {
		return sptMapper.selectSptList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectNotice(Map<String, Object> map) throws Exception {
		return sptMapper.selectNotice(map);
	}
	
	@Override
	public Map<String, Object> selectNoticeDetail(int idx) throws Exception {
		return sptMapper.selectNoticeDetail(idx);
	}
	
	@Override
	public List<Map<String, Object>> selectFaq(Map<String, Object> map) throws Exception {
		return sptMapper.selectFaq(map);
	}
	
	@Override
	public Map<String, Object> selectFaqDetail(int idx) throws Exception {
		return sptMapper.selectFaqDetail(idx);
	}
	
	@Override
	public int updateFaq(Map<String, Object> map) throws Exception{
		return sptMapper.updateFaq(map);
	}
	
	@Override
	public int deleteFaq(int bbsTxnId) throws Exception{
		return sptMapper.deleteFaq(bbsTxnId);
	}
	
	@Override
	public int insertFaq(Map<String, Object> map) throws Exception{
		return sptMapper.insertFaq(map);
	}
	
	@Override
	public int selectMaxIdx() throws Exception {
		return sptMapper.selectMaxIdx();
	}
	
	@Override
	public int insertNotice(Map<String, Object> map) throws Exception {
		return sptMapper.insertNotice(map);
	}
	
	@Override
	public int deleteNotice(int idx) throws Exception{
		return sptMapper.deleteNotice(idx);
	}
	
	@Override
	public int updateNotice(Map<String, Object> map) throws Exception{
		return sptMapper.updateNotice(map);
	}
	
	@Override
	public int insertVoc(Map<String, Object> map) throws Exception{
		return sptMapper.insertVoc(map);
	}
	
	@Override
	public List<Map<String, Object>> selectVocList(Map<String, Object> map) throws Exception{
		return sptMapper.selectVocList(map);
	}
	
	@Override
	public int updateViewCnt(int txnId) throws Exception{
		return sptMapper.updateViewCnt(txnId);
	}
	
	@Override
	public Map<String, Object> selectVocDetail(int txnId) throws Exception{
		return sptMapper.selectVocDetail(txnId);
	}
	
	@Override
	public int updateVoc(Map<String, Object> map) throws Exception{
		return sptMapper.updateVoc(map);
	}

	@Override
	public int deleteVoc(int txnId) throws Exception{
		return sptMapper.deleteVoc(txnId);
	}
	
	@Override
	public int updateAns(Map<String, Object> map) throws Exception{
		return sptMapper.updateAns(map);
	}
	
	@Override
	public Map<String, Object> selectAns(int pId) throws Exception{
		return sptMapper.selectAns(pId);
	}
	
	@Override
	public List<Map<String, Object>> selectReplList(int txnId) throws Exception{
		return sptMapper.selectReplList(txnId);
	}
	
	@Override
	public int deleteRepl(int replId) throws Exception{
		return sptMapper.deleteRepl(replId);
	}
	
	@Override
	public int insertRepl(Map<String, Object> map) throws Exception{
		return sptMapper.insertRepl(map);
	}
}	

