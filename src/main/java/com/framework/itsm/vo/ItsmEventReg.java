package com.framework.itsm.vo;

public class ItsmEventReg {
	String company;			// 회사코드
	String collSysNm;		// 관제시스템명
	String evtDate;			// 발생일시 2022-10-05 20:30:00
	String hostName;		// 호스트명
	String evtMsg;			// 제목
	String evtInfo;			// 내용
	String evtId;			// 이벤트id
	String evtCode;			// 이벤트코드
	String severity;		// 심각도
	String ip;				// 시스템ip
	String evtClass;		// 이벤트분류
	String evtCodeName;		// 이벤트 코드명
	String solutionName;	// 관제솔루션명
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCollSysNm() {
		return collSysNm;
	}
	public void setCollSysNm(String collSysNm) {
		this.collSysNm = collSysNm;
	}
	public String getEvtDate() {
		return evtDate;
	}
	public void setEvtDate(String evtDate) {
		this.evtDate = evtDate;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getEvtMsg() {
		return evtMsg;
	}
	public void setEvtMsg(String evtMsg) {
		this.evtMsg = evtMsg;
	}
	public String getEvtInfo() {
		return evtInfo;
	}
	public void setEvtInfo(String evtInfo) {
		this.evtInfo = evtInfo;
	}
	public String getEvtId() {
		return evtId;
	}
	public void setEvtId(String evtId) {
		this.evtId = evtId;
	}
	public String getEvtCode() {
		return evtCode;
	}
	public void setEvtCode(String evtCode) {
		this.evtCode = evtCode;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getEvtClass() {
		return evtClass;
	}
	public void setEvtClass(String evtClass) {
		this.evtClass = evtClass;
	}
	public String getEvtCodeName() {
		return evtCodeName;
	}
	public void setEvtCodeName(String evtCodeName) {
		this.evtCodeName = evtCodeName;
	}
	public String getSolutionName() {
		return solutionName;
	}
	public void setSolutionName(String solutionName) {
		this.solutionName = solutionName;
	}

	
}
