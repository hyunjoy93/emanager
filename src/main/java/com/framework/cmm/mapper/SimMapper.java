package com.framework.cmm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.framework.itsm.vo.ItsmEventReg;
import com.framework.itsm.vo.sendVo;

@Mapper
public interface SimMapper {

	int addItsmTamChange(Map<String, Object> itsmTam);
	int addItsmSecurityChange(Map<String, Object> itsmSecurity);
	int addItsmInfraChange(Map<String, Object> itsmInfra);
	int addItsmApChange(Map<String, Object> itsmAp);
	int addItsmRelease(Map<String, Object> itsmRelease);
	int addDbCommandDataEaiToCms();
	List<String> selectStdCd();
	List<ItsmEventReg> selectCommandFull(long max);
	long selectReportMaxSeq();
	int updateReportMaxSeq(long max);
	List<sendVo> selectSendUsers(long max);
}
