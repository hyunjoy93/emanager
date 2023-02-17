package com.framework.itsm.schedule;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.itsm.etc.CallApi;
import com.framework.itsm.service.ScheduleItsmService;
import com.framework.itsm.vo.ItsmResult;

@SpringBootApplication
@EnableScheduling
public class ItsmSchedule {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ScheduleItsmService scheduleItsmService;
	
	@Autowired
	private CallApi callApi;
	
	@Value("${dev.property.url.itsmurl}")
	String itsmUrl;
	
	//오전 3시 ITSM INFRA, TAM 데이터 조회 및 적재
	@SuppressWarnings("unchecked")
	@Scheduled(cron="0 0 3 * * *")
	public void test2() {
		
		// 표준 서비스 코드 조회
		List<String> stdCdList = scheduleItsmService.selectStdCd();
		
		// 검색날짜 설정
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		String toDate = df.format(cal.getTime())+"000000";
		log.info(toDate);
		
		cal.add(Calendar.DATE, -7);
		String fromDate = df.format(cal.getTime())+"000000";
		log.info(fromDate);
		
		JSONObject req = new JSONObject();
		req.put("searchOpenStart",fromDate);
		req.put("searchOpenEnd",toDate);
		req.put("ifSystem","Luppiter");
		
		try {
			log.info("==========> findTamChange");
			for(int j = 0 ; j < stdCdList.size() ; j++) {
				req.put("searchAffectedItem",stdCdList.get(j));
				
				String rtnStr = callApi.post(req.toString(), itsmUrl+"/oper/rest/api/v1/client/findTamChange");
				ObjectMapper objMapper = new ObjectMapper();
				
				ItsmResult itsmResult = objMapper.readValue(rtnStr, ItsmResult.class);
				log.info(itsmResult.getResultCode());
				if(itsmResult.getResultCode().equals("200")) {
					List<Object> listItsmTam = itsmResult.getResultList();
					log.info(listItsmTam.toString());
					int nLen = 0;
					if(null != listItsmTam) {
						nLen = listItsmTam.size();
					}
					if(0 < nLen) {
						Map<String, Object> itsmTam = null;
						for(int i=0; i<nLen; i++) {
							itsmTam = ((Map<String, Object>) listItsmTam.get(i));
							scheduleItsmService.addItsmTamChange(itsmTam);
						}						
					}
					

				}
			}

			for(int j = 0 ; j < stdCdList.size() ; j++) {
				req.put("searchAffectedItem",stdCdList.get(j));

				String rtnStr = callApi.post(req.toString(), itsmUrl+"/oper/rest/api/v1/client/findInfraChange");
				ObjectMapper objMapper3 = new ObjectMapper();

				ItsmResult itsmResult3 = objMapper3.readValue(rtnStr, ItsmResult.class);
				System.out.println(itsmResult3.getResultCode());
				if(itsmResult3.getResultCode().equals("200")) {
					List<Object> listItsmInfra = itsmResult3.getResultList();
					log.info(listItsmInfra.toString());
					
					int nLen = 0;
					if(null != listItsmInfra) {
						nLen = listItsmInfra.size();
					}
					if(0 < nLen) {
						Map<String, Object> itsmInfra = null;
						for(int i=0; i<nLen; i++) {
							itsmInfra = ((Map<String, Object>) listItsmInfra.get(i));
							scheduleItsmService.addItsmInfraChange(itsmInfra);
						}						
					}

				}
			}

			/*System.out.println("==========> findApChange");
			for(int j = 0 ; j < stdCdList.size() ; j++) {
				req.put("searchAffectedItem",stdCdList.get(j));

				String rtnStr = callApi.post(req.toString(), itsmUrl+"/oper/rest/api/v1/client/findApChange");
				ObjectMapper objMapper4 = new ObjectMapper();

				ItsmResult itsmResult4 = objMapper4.readValue(rtnStr, ItsmResult.class);
				System.out.println(itsmResult4.getResultCode());
				if(itsmResult4.getResultCode().equals("200")) {
					List<Object> listItsmTam = itsmResult4.getResultList();
					for(int i = 0 ; i < listItsmTam.size() ; i++) {
						HashMap<?, ?> itsmTam = (HashMap<?, ?>)listItsmTam.get(i);
						scheduleItsmService.addItsmApChange(itsmTam);
					}
				}
			}


			System.out.println("==========> release");
			for(int j = 0 ; j < stdCdList.size() ; j++) {
				req.put("searchAffectedItem",stdCdList.get(j));

				String rtnStr = callApi.post(req.toString(), itsmUrl+"/oper/rest/api/v1/client/release");
				ObjectMapper objMapper5 = new ObjectMapper();

				ItsmResult itsmResult5 = objMapper5.readValue(rtnStr, ItsmResult.class);
				System.out.println(itsmResult5.getResultCode());
				if(itsmResult5.getResultCode().equals("200")) {
					List<Object> listItsmRelease = itsmResult5.getResultList();
					for(int i = 0 ; i < listItsmRelease.size() ; i++) {
						HashMap<?, ?> itsmRelease = (HashMap<?, ?>)listItsmRelease.get(i);
						scheduleItsmService.addItsmRelease(itsmRelease);
					}
				}
			}*/
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 6시
//	@Scheduled(cron="0 0 6 * * *")
//	public void dbAccessDataeaiToCms() {
//		scheduleItsmService.addDbCommandDataEaiToCms();
//	}

}


