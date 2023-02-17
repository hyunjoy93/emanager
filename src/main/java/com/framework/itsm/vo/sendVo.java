package com.framework.itsm.vo;

public class sendVo {
	String userId;				// 사번
	String email;               // 이메일
	String emailYn;             // 이메일발송여부
	String mobile;              // 모바일
	String mobileYn;           // 모바일발송여부
	String eventtime;           // 명령어발생시간
	String command ;            // 명령어발생시간
	String hostname;            // host명
	String stdserviceid;       // 표준서비스코드
	String servicename;         // 표준서비스명
	String hosttype;            // 호스트 타입
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailYn() {
		return emailYn;
	}
	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMobileYn() {
		return mobileYn;
	}
	public void setMobileYn(String mobileYn) {
		this.mobileYn = mobileYn;
	}
	public String getEventtime() {
		return eventtime;
	}
	public void setEventtime(String eventtime) {
		this.eventtime = eventtime;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getStdserviceid() {
		return stdserviceid;
	}
	public void setStdserviceid(String stdserviceid) {
		this.stdserviceid = stdserviceid;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	public String getHosttype() {
		return hosttype;
	}
	public void setHosttype(String hosttype) {
		this.hosttype = hosttype;
	}
	
	
}
