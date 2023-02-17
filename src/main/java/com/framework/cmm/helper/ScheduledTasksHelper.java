package com.framework.cmm.helper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.framework.itsm.schedule.ItsmSchedule;

@Component
public class ScheduledTasksHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ItsmSchedule itsmSchedule;
	
	//@Scheduled(fixedRate = 7000)
	public void getScheduled() throws Exception {
		log.info("====================================== getScheduled ======================================");
		
		log.info("===================================== ITSM 스케줄링 시작 =====================================");
		try {
			itsmSchedule.test2();
			log.info("===================================== ITSM 스케줄링 정상 =====================================");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
