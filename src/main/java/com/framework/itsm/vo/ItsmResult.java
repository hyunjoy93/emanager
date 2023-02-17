package com.framework.itsm.vo;

import java.util.List;

public class ItsmResult {
	
	private String resultStatus = "";
	private String resultCode = "";
	private String resultMsg = "";
	private String resultId = "";
	private String result = "";
	
	List<Object> resultList;

	public String getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public String getResultId() {
		return resultId;
	}

	public void setResultId(String resultId) {
		this.resultId = resultId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Object> getResultList() {
		return resultList;
	}

	public void setResultList(List<Object> resultList) {
		this.resultList = resultList;
	}
	
}
