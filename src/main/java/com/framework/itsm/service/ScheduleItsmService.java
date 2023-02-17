package com.framework.itsm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.cmm.mapper.SimMapper;
import com.framework.itsm.vo.ItsmEventReg;
import com.framework.itsm.vo.sendVo;

@Service
public class ScheduleItsmService {
	
	@Autowired
	SimMapper scheduleItsmMapper;

	/*****************************************************
	 * ITSM 작업내역
	 *****************************************************/
	public int addItsmTamChange(Map<String, Object> itsmTam) {
		return scheduleItsmMapper.addItsmTamChange(itsmTam);
	}

	public int addItsmSecurityChange(Map<String, Object> itsmSecurity) {
		return scheduleItsmMapper.addItsmSecurityChange(itsmSecurity);
	}

	public int addItsmInfraChange(Map<String, Object> itsmInfra) {
		return scheduleItsmMapper.addItsmInfraChange(itsmInfra);
	}

	public int addItsmApChange(Map<String, Object> itsmAp) {
		return scheduleItsmMapper.addItsmApChange(itsmAp);
	}

	public int addItsmRelease(Map<String, Object> itsmRelease) {
		return scheduleItsmMapper.addItsmRelease(itsmRelease);
	}


	/*****************************************************
	 * DB명령어 eai db -> cms db
	 *****************************************************/
	public int addDbCommandDataEaiToCms() {
		return scheduleItsmMapper.addDbCommandDataEaiToCms();
	}

	/*****************************************************
	 * 표준서비스코드 조회
	 *****************************************************/
	public List<String> selectStdCd(){
		return scheduleItsmMapper.selectStdCd();
	}

	/*****************************************************
	 * 금칙명령어 발생 조회
	 *****************************************************/
	public List<ItsmEventReg> selectCommandFull(long max){
		return scheduleItsmMapper.selectCommandFull(max);
	}

	/*****************************************************
	 * 레포트테이블 max seq 조회
	 *****************************************************/
	public long selectReportMaxSeq() {
		return scheduleItsmMapper.selectReportMaxSeq();
	}

	public int updateReportMaxSeq(long max) {
		return scheduleItsmMapper.updateReportMaxSeq(max);
	}

	/*****************************************************
	 * 금칙명령어 알림 대상자 조회
	 *****************************************************/
	public List<sendVo> selectSendUsers(long max){
		return scheduleItsmMapper.selectSendUsers(max);
	}


}
