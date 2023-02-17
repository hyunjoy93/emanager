--작업현황
--cmon_event_exception

	 
CREATE TABLE IF NOT EXISTS cmon_event_exception(
	start_time timestamp without time zone
	 , end_time timestamp without time zone                                        
	 , type_nm character varying(30)                                               
	 , container_nm character varying(50)                                          
	 , datacenter_nm character varying(50)                                         
	 , stdnm character varying(50)                                                 
	 , estdnm character varying(50)                                                
	 , content character varying(200)                                              
	 , charge_depart character varying(50)                                         
	 , charge_person character varying(20)                                         
	 , phone character varying(50)                                                 
	 , regist_person character varying(20)                                         
	 , regist_time timestamp without time zone                                     
 );
 
DELETE FROM cmon_event_exception; 

	 
INSERT INTO cmon_event_exception (start_time,end_time,type_nm,container_nm,datacenter_nm,stdnm,estdnm,"content",charge_depart,charge_person,phone,regist_person,regist_time) VALUES
	 ('2022-11-10 00:00:00','2022-11-22 00:00:00','Storage','천안CDC','02층 [5실]','공통-cloud-IPC','공통-cloud-IPC','','인프라/Cloud운영혁신팀','e1','010-1234-1234','김지웅','2022-11-10 14:20:00'),
	 ('2022-11-15 15:20:00','2022-11-30 15:20:00','Server','목동1IDC','08층 [A실]','공통-cloud-IPC','공통-cloud-IPC','','인프라/Cloud운영혁신팀','e1','010-2345-1234','김준호','2022-11-16 13:20:00'),
	 ('2022-11-11 09:21:00','2022-11-30 15:20:00','Storage','천안CDC','02층 [5실]','공통-cloud-IPC','공통-cloud-IPC','','인프라/Cloud운영혁신팀','e1','010-2345-1234','김준호','2022-11-11 13:20:00');

	 
	 
	 

--인시던트
--cmon_incident_info

CREATE TABLE IF NOT EXISTS cmon_incident_info(
	incident_id character varying(20) NOT NULL                           
	 , event_id character varying(4500)                                                                         
	 , event_time timestamp without time zone                                                                   
	 , type_nm character varying(20)                                                                            
	 , container_nm character varying(50)                                                                       
	 , datacenter_nm character varying(50)                                                                      
	 , stdnm character varying(50)                                                                              
	 , estdnm character varying(50)                                                                             
	 , incident_level character varying(20)                                                                     
	 , incident_state character varying(20)                                                                     
	 , incident_contents character varying(500)                                                                 
	 , incident_start_time timestamp without time zone                                                          
	 , incident_end_time timestamp without time zone                                                            
	 , captain character varying(30)                                                                            
	 , incident_chief character varying(30)                                                                     
	 , restore_chief character varying(30)                                                                      
	 , restore_team character varying(30)                                                                       
	 , incident_service_impact character varying(10)                                                            
	 , incident_tech_voc character varying(10)                                                                  
	 , itsm_incident_id character varying(30)                                                                   
	 , incident_result_type character varying(30)                                                               
	 , incident_result_user character varying(20)                                                               
	 , CONSTRAINT cmon_incident_info_pk PRIMARY KEY (incident_id)                                               
 );                                                                                                         
 CREATE INDEX cmon_incident_info_idx1 ON cmon_incident_info USING btree (incident_state, incident_id);


DELETE FROM cmon_incident_info; 


INSERT INTO cmon_incident_info (incident_id,event_id,event_time,type_nm,container_nm,datacenter_nm,stdnm,estdnm,incident_level,incident_state,incident_contents,incident_start_time,incident_end_time,captain,incident_chief,restore_chief,restore_team,incident_service_impact,incident_tech_voc,itsm_incident_id,incident_result_type,incident_result_user) VALUES
	 ('I2022071500001','E2022071500003','2022-07-15 11:45:16','','','','','','이상징후','조치중','[HW1002] SNMP Agent Check 필요','2022-07-15 14:07:32',NULL,'','','','','','','','',''),
	 ('I2022071500002','E2022071500002','2022-07-15 11:00:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치완료','[HW6003] CPU 사용량 (90%이상, 현재 값 : 95)','2022-07-15 15:27:41','2022-07-15 20:20:54','','','','','있음','N','23456','','김준호'),
	 ('I2022071500004','E2022071500009','2022-07-15 21:27:46','Server','천안CDC','','EPC-ucloud-서버','EPC-ucloud-서버','이상징후','조치완료','[VS0014] Server Error 로그감지 : tap-err 발생','2022-07-15 21:35:33','2022-07-15 21:35:52','김지웅','김지웅','김지웅','운영개발팀','없음','N','123','','김지웅'),
	 ('I2022071500003','E2022071500007','2022-07-15 19:43:00','','','','','','이상징후','조치완료','[HW1002] SNMP Agent Check 필요','2022-07-15 20:19:26','2022-07-15 22:01:15','','','','','없음','N','123','','김지웅'),
	 ('I2022071700005','E2022071500010','2022-07-15 23:00:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치완료','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 83)','2022-07-17 22:20:45','2022-07-17 22:21:00','','','','','없음','Y','123','','김지웅'),
	 ('I2022071700006','E2022071700001','2022-07-17 00:38:24','','','','','','2등급','조치중','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 89)','2022-07-17 22:23:04',NULL,'','','','','','','','',''),
	 ('I2022071800007','E2022071800001','2022-07-18 01:23:10','Unknown','목동2IDC','','EPC-ucloud-NW','EPC-ucloud-NW','이상징후','조치완료','[HW100211] SNMP Agent Check 필요-KJW','2022-07-18 10:25:10','2022-07-18 10:25:40','','','','','없음','N','123','','김지웅'),
	 ('I2022071900010','E2022071800004','2022-07-18 19:51:33','Unknown','천안CDC','','KATE','','이상징후','조치중','[HW1301] Controller status (상태 값 : NonCritical)','2022-07-19 14:07:12',NULL,'','','','','','','','',''),
	 ('I2022071900009','E2022071800005','2022-07-18 22:10:31','','','','','','이상징후','조치완료','[HW1653] CPU Fan status (상태 값 : Failed)','2022-07-19 14:06:17','2022-07-19 14:24:20','','','','','없음','N','123','','김지웅'),
	 ('I2022072000012','E2022071900022','2022-07-14 17:31:54','','','','','','이상징후','조치중','[OS0013]{$TRIGGERPREFIX} NTP 동기화 체크','2022-07-20 19:10:55',NULL,'','','','','','','','','');
INSERT INTO cmon_incident_info (incident_id,event_id,event_time,type_nm,container_nm,datacenter_nm,stdnm,estdnm,incident_level,incident_state,incident_contents,incident_start_time,incident_end_time,captain,incident_chief,restore_chief,restore_team,incident_service_impact,incident_tech_voc,itsm_incident_id,incident_result_type,incident_result_user) VALUES
	 ('I2022082200017','E2022081100061,E2022081100004,E2022081100032','2022-07-20 19:01:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5353] [planb_image_1032] : Volume status (상태 값 : Offline)','2022-08-22 18:12:20',NULL,'','','','','','','','',''),
	 ('I2022072000011','E2022071900021','2022-07-14 17:22:25','','','','','','이상징후','조치중','[OS0009] {$TRIGGERPREFIX}/ 디스크 남은 용량 : 24.34 %','2022-07-20 13:16:02',NULL,'','','','','','','','',''),
	 ('I2022072600014','E2022071900007,E2022071900004','2022-06-30 16:57:11','','','','','','이상징후','조치완료','[OS0021]{$TRIGGERPREFIX} NFS마운트 상태체크','2022-07-26 23:00:08','2022-07-26 23:01:02','민범홍','김경진','민범홍','','없음','N','ㅅㄷㄴㅅ','','김경진'),
	 ('I2022092100018','E2022092100032,E2022092100027,E2022092100013','2022-08-26 07:07:50','Unknown','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','2022-09-21 16:33:21',NULL,'','','','','','','','',''),
	 ('I2022100700019','E2022100500027','2022-09-26 21:01:47','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5103] [coremgmt-node01] : Over Temperature 발생','2022-10-07 14:11:47',NULL,'','','','','','','','',''),
	 ('I2022072000013','E2022071900024','2022-07-19 22:49:12','Unknown','목동2IDC','','EPC-ucloud-NW','EPC-ucloud-NW','이상징후','조치중','[OS0021-1111] NFS마운트 상태체크','2022-07-20 20:08:42',NULL,'관제상황조장','상황반장','복구반장','복구팀','','','','',''),
	 ('I2022071800008','E2022071800002','2022-07-18 18:17:45','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치완료','[HW5302] [node2_aggr1] : Filesystem 사용량 (80%이상 ~ 90%미만, 현재 값 : 89 %)','2022-07-18 19:33:00','2022-08-08 14:32:26','','','','','없음','N','0','','김지웅'),
	 ('I2022080800015','E2022072800003','2022-07-28 18:12:42','','','','','','이상징후','조치중','TEST 이벤트 1','2022-08-08 18:03:14',NULL,'1','2','3','4','','','','',''),
	 ('I2022101200020','E2022100600002','2022-10-06 08:00:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 88)','2022-10-12 09:57:45',NULL,'','','','','','','','',''),
	 ('I2022101200021','E2022100500021,E2022100500004,E2022100500023,E2022100500026,E2022100500015,E2022100500003,E2022100500022,E2022100500034,E2022100500033,E2022100500028,E2022100500024,E2022100500006,E2022100500002','2022-09-26 21:01:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','2022-10-12 09:58:20',NULL,'','','','','','','','','');
INSERT INTO cmon_incident_info (incident_id,event_id,event_time,type_nm,container_nm,datacenter_nm,stdnm,estdnm,incident_level,incident_state,incident_contents,incident_start_time,incident_end_time,captain,incident_chief,restore_chief,restore_team,incident_service_impact,incident_tech_voc,itsm_incident_id,incident_result_type,incident_result_user) VALUES
	 ('I2022101200022','E2022100500029,E2022100500016,E2022100500011,E2022100500005,E2022100500019,E2022100500001,E2022100500030','2022-09-22 21:05:44','Unknown','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','2022-10-12 10:01:27',NULL,'','','','','','','','',''),
	 ('I2022110200023','E2022100500012,E2022100500032,E2022110100001','2022-11-01 09:30:44','','','','','','이상징후','조치중','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','2022-11-02 11:21:23',NULL,'','','','','','','','',''),
	 ('I2022081100016','E2022081100059','2022-08-08 18:03:13','','','','','','2등급','조치완료','[HW1653] CPU Fan status (상태 값 : Failed)','2022-08-11 18:28:13','2022-08-11 18:30:40','관제상황조장','상황반장','복구반장','복구팀','없음','N','0','','김지웅'),
	 ('I2022110300024','E2022100500014','2022-09-26 21:01:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5303] [/vol/ca_jpt_prd_zab_p01p02_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','2022-11-03 10:20:31',NULL,'','','','','','','','',''),
	 ('I2022110300025','E2022110200002,E2022110200005','2022-11-01 09:30:44','','','','','','이상징후','조치중','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','2022-11-03 10:35:26',NULL,'','','','','','','','',''),
	 ('I2022101200014','E2022101200403','2022-10-12 23:04:49','','','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[OS0114] OS_HANG : "hung_task_timeout_secs" 패턴 검사','2022-10-12 23:06:01',NULL,'','','','','','','','',''),
	 ('I2022110900026','E2022110100004,E2022102600003','2022-11-01 09:01:44','Unknown','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5103] [aidu-node1] : Over Temperature 발생','2022-11-09 10:20:43',NULL,'','','','','','','','',''),
	 ('I2022110900027','E2022100500010,E2022100500009','2022-09-26 21:01:43','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5303] [/vol/jpt20220811d05d06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','2022-11-09 15:26:30',NULL,'','','','','','','','',''),
	 ('I2022111500028','E2022100500025,E2022101200004,E2022101900001','2022-09-26 21:01:47','Storage','천안CDC','','공통-cloud-IPC','공통-cloud-IPC','이상징후','조치중','[HW5103] [coremgmt-node02] : Over Temperature 발생','2022-11-15 09:18:38',NULL,'','','','','','','','','');





	 

--이벤트
--cmon_event_info

CREATE TABLE IF NOT EXISTS cmon_event_info(
	event_id character varying(20) NOT NULL
	 , occu_time timestamp without time zone                                   
	 , target_ip character varying(20)                                         
	 , target_item character varying(200)                                      
	 , target_value character varying(20)                                      
	 , target_contents character varying(1000)                                 
	 , send_agent character varying(20)                                        
	 , create_time timestamp without time zone                                 
	 , event_level character varying(30)                                       
	 , last_occu_time timestamp without time zone                              
	 , event_occu_count integer                                                
	 , equ_barcode character varying(30)                                       
	 , device_ip character varying(30)                                         
	 , mgmt_ip character varying(30)                                           
	 , ipmi_ip character varying(30)                                           
	 , physical_address character varying(50)                                  
	 , hostname character varying(200)                                         
	 , equip_label character varying(50)                                       
	 , model character varying(50)                                             
	 , manuf_nm character varying(50)                                          
	 , container_nm character varying(30)                                      
	 , datacenter_nm character varying(30)                                     
	 , rack_location character varying(30)                                     
	 , equip_position character varying(30)                                    
	 , stdnm character varying(50)                                             
	 , estdnm character varying(50)                                            
	 , type_nm character varying(30)                                           
	 , own_dept_nm character varying(50)                                       
	 , warr_st_dt character varying(30)                                        
	 , hwoprusrcd character varying(30)                                        
	 , event_state character varying(30)                                       
	 , event_step1_user character varying(20)                                  
	 , event_step1_state character varying(20)                                 
	 , event_step1_start timestamp without time zone                           
	 , event_step1_end timestamp without time zone                             
	 , event_step1_contents text                                               
	 , event_step2_user character varying(20)                                  
	 , event_step2_state character varying(20)                                 
	 , event_step2_start timestamp without time zone                           
	 , event_step2_end timestamp without time zone                             
	 , event_step2_contents text                                               
	 , event_service_impact character varying(10)                              
	 , event_tech_voc character varying(10)                                    
	 , event_result_type character varying(20)                                 
	 , event_result_user character varying(20)                                 
	 , event_result_time timestamp without time zone                           
	 , incident_id character varying(20)                                       
	 , exception_flag integer                                                  
	 , zabbix_state character varying(20) DEFAULT ''::character varying        
	 , gubun character varying(10)                                             
	 , trigger_id bigint                                                       
	 , host_group_gubun character varying(10)                                  
 );

DELETE FROM cmon_event_info; 


INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022101500001','2022-10-15 02:00:44','10.0.8.128','','1','[HW6003] CPU 사용량 (90%이상, 현재 값 : 92)','10.2.14.54','2022-10-15 02:01:00','Fatal','2022-10-15 02:00:44',1,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','인지','e1','이관','2022-10-18 14:58:03','2022-10-18 14:58:12','','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',36569,''),
	 ('E2022110100002','2022-11-01 09:30:44','10.4.206.14','','1','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-01 15:21:00','Fatal','2022-11-02 21:51:10.004',754,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','조치완료','','',NULL,NULL,'','','',NULL,NULL,'','N','N','2','관리자','2022-11-02 21:52:02.799','',0,'지속','HW',39091,''),
	 ('E2022100500027','2022-09-26 21:01:47','10.0.8.128','','1','[HW5103] [coremgmt-node01] : Over Temperature 발생','10.2.14.54','2022-10-05 14:46:00','Critical','2022-10-26 17:38:10.007',23569,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-12 09:14:17','2022-10-19 16:02:26','','','',NULL,NULL,'','','','','',NULL,'I2022100700019',0,'해소','HW',36572,''),
	 ('E2022100500024','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','E1','이관','2022-10-26 10:42:35','2022-10-26 10:42:42','','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36730,''),
	 ('E2022100500015','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [node2_aggr1] : Filesystem 사용량 (90%이상, 현재 값 : 92 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36734,''),
	 ('E2022100500023','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/jupiter_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','E1','이관','2022-10-26 16:41:54','2022-10-26 16:42:02','이관함','E1','이관','2022-10-26 16:42:07','2022-10-26 16:42:16','인지 후 이관 처리','','','','',NULL,'I2022101200021',0,'해소','HW',36742,''),
	 ('E2022100500002','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p03p04_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36744,''),
	 ('E2022100500017','2022-08-08 18:03:13','10.2.14.55','','1','[HW1653] CPU Fan status (상태 값 : Failed)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-11-02 21:44:10.005',24325,'','10.2.14.55','','','','test_hp','','','','','','','','','','','','','','조치완료','E1','인지','2022-11-02 21:45:08','2022-11-02 21:45:08','','','',NULL,NULL,'','N','N','2','E1','2022-11-02 21:45:08','',0,'지속','HW',33223,''),
	 ('E2022100500035','2022-07-05 12:01:44','10.4.206.14','','1','[HW5103] [aidu-node1] : Over Temperature 발생','10.2.14.54','2022-10-05 20:02:00','Critical','2022-10-24 17:46:10.005',21799,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',32504,''),
	 ('E2022100500014','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p01p02_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022110300024',0,'해소','HW',36743,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022110100001','2022-11-01 09:30:44','10.4.206.15','','1','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-01 15:21:00','Fatal','2022-11-02 21:48:10.007',751,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','조치완료','','',NULL,NULL,'','','',NULL,NULL,'','N','N','2','관리자','2022-11-02 21:48:31.578','I2022110200023',0,'지속','HW',39089,''),
	 ('E2022100500030','2022-07-05 12:01:44','10.4.206.14','','1','[HW5303] [node1_aggr1] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-24 17:46:10.005',22115,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'해소','HW',32496,''),
	 ('E2022102600001','2022-10-26 00:00:45','10.4.206.14','','1','[HW5302] [/vol/vs0_root/.snapshot] : Filesystem I-node 사용량 (100%이상, 현재 값 : 11 %)','10.2.14.54','2022-10-26 00:01:00','Critical','2022-10-26 05:30:10.005',330,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','인지','E1','인지','2022-11-09 10:20:28',NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',38956,''),
	 ('E2022101200001','2022-10-12 00:34:49','10.4.17.187','','1','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 85)','10.2.14.54','2022-10-12 00:35:00','Critical','2022-11-16 15:14:10.005',17,'K918358400000005','10.4.17.187','','10.4.17.187 / 10.4.17.189','','VDI_5R1315_node1','','NET_STO-FAS8060','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1315','7','업무용VDI','업무용VDI','Unknown','인프라/Cloud운영혁신팀','N','82022988','인지','e1','조치중','2022-10-18 15:04:41','2022-10-18 15:05:17','','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',30477,''),
	 ('E2022111400003','2022-11-01 09:01:44','10.4.206.17','','1','[HW5103] [aidu-node1] : Over Temperature 발생','10.2.14.54','2022-11-14 13:33:00','Critical','2022-11-17 14:50:10.004',2601,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39113,''),
	 ('E2022110200004','2022-08-08 21:04:01','10.2.14.55','','1','[HW1002] SNMP Agent Check 필요','10.2.14.54','2022-11-02 21:52:00','Critical','2022-11-17 14:50:10.004',19374,'','','','','','test_hp','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',33214,''),
	 ('E2022100500026','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p07p08_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36747,''),
	 ('E2022100500018','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_a01a02_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-18 15:25:11','2022-10-18 15:25:16','','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',36749,''),
	 ('E2022100500028','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_a03a04_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36750,''),
	 ('E2022100600001','2022-10-06 02:00:43','10.0.8.128','','1','[HW6003] CPU 사용량 (90%이상, 현재 값 : 91)','10.2.14.54','2022-10-06 02:01:00','Fatal','2022-10-26 17:01:10.006',24,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-07 14:11:41','2022-10-12 09:16:00','','e1','인지 접수 및 조치','2022-10-12 09:16:14',NULL,'','','','','',NULL,'',0,'해소','HW',36568,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022101200002','2022-10-10 03:00:44','10.0.8.128','','1','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 86)','10.2.14.54','2022-10-10 03:01:00','Critical','2022-10-17 01:01:10.004',2,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','조치중','2022-10-18 15:10:22','2022-10-18 15:10:30','ㅁㅁㅁㅁ','e1','이관','2022-10-18 15:17:53','2022-10-18 15:17:58','ㅁㅁㅁㅁ','','','','',NULL,'',0,'해소','HW',36567,''),
	 ('E2022100600002','2022-10-06 08:00:43','10.0.8.128','','1','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 82)','10.2.14.54','2022-10-06 08:01:00','Critical','2022-10-26 05:01:10.006',31,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-07 09:17:21','2022-10-07 09:17:30','이관 테스트','e1','이관','2022-10-07 09:17:35','2022-10-07 09:17:44','','','','','',NULL,'I2022101200020',0,'해소','HW',36566,''),
	 ('E2022100500022','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-18 15:27:38','2022-10-18 15:27:49','이관 조치중 테스트','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36732,''),
	 ('E2022101200403','2022-10-12 23:04:49','10.4.203.76','','1','[OS0114] OS_HANG : "hung_task_timeout_secs" 패턴 검사','10.2.14.148','2022-10-12 23:05:00','Fatal','2022-10-12 23:19:10.007',15,'K912754600010796','10.4.203.76','','','AC162D7BDA80','cnode27-m.pod19.ktis.ipc.kt.com_','','','','','','','','공통-cloud-IPC','공통-cloud-IPC','','','','82107426','인지','민범홍','인지','2022-10-13 16:48:25',NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101300018',0,'해소','CSW',647614,''),
	 ('E2022100500001','2022-07-05 12:01:44','10.4.206.14','','1','[HW5103] [aidu-node2] : Over Temperature 발생','10.2.14.54','2022-10-05 14:46:00','Critical','2022-10-24 17:46:10.005',22115,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'해소','HW',32505,''),
	 ('E2022102600003','2022-10-26 16:37:50','10.4.206.14','','1','[HW5302] [/vol/vs0_root/.snapshot] : Filesystem I-node 사용량 (100%이상, 현재 값 : 7 %)','10.2.14.54','2022-10-26 16:38:00','Critical','2022-10-26 17:38:10.007',59,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022110900026',0,'해소','HW',38986,''),
	 ('E2022100500033','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_d01d02_vol] : Filesystem 사용량 (90%이상, 현재 값 : 98 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36745,''),
	 ('E2022101200003','2022-09-26 21:01:47','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p05p06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-12 17:12:00','Fatal','2022-10-19 13:45:10.01',9877,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치완료','e1','조치중','2022-10-18 15:18:19','2022-10-18 15:18:23','','','',NULL,NULL,'','N','N','4','e1','2022-10-19 13:45:54','',0,'해소','HW',36746,''),
	 ('E2022101200004','2022-09-26 21:01:47','10.0.8.128','','1','[HW5103] [coremgmt-node02] : Over Temperature 발생','10.2.14.54','2022-10-12 17:19:00','Critical','2022-10-26 17:38:10.007',18664,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','인지','e1','조치중','2022-10-18 15:21:02','2022-10-18 15:21:07','ㅁㅁㅁ','','',NULL,NULL,'','','','','',NULL,'I2022111500028',0,'해소','HW',36573,''),
	 ('E2022101900001','2022-09-26 21:01:47','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p05p06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-19 13:46:00','Fatal','2022-10-26 17:38:10.007',8796,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','이관','2022-10-19 14:28:35','2022-10-19 14:28:39','','','',NULL,NULL,'','','','','',NULL,'I2022111500028',0,'해소','HW',36746,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022110200001','2022-08-08 18:03:13','10.2.14.55','','1','[HW1653] CPU Fan status (상태 값 : Failed)','10.2.14.54','2022-11-02 21:45:00','Fatal','2022-11-17 14:50:10.004',19381,'','','','','','test_hp','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',33223,''),
	 ('E2022100500012','2022-08-08 21:04:02','10.2.14.55','','1','[HW1002] SNMP Agent Check 필요','10.2.14.54','2022-10-05 14:46:00','Critical','2022-11-17 14:50:10.004',43706,'','10.2.14.55','','','','test_dell','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022110200023',0,'지속','HW',32953,''),
	 ('E2022101200003','2022-09-26 21:01:47','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p05p06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-12 17:12:00','Fatal','2022-10-19 13:45:10.01',9877,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치완료','e1','조치중','2022-10-18 15:18:19','2022-10-18 15:18:23','','','',NULL,NULL,'','N','N','4','e1','2022-10-19 13:45:54','',0,'해소','HW',36746,''),
	 ('E2022100500031','2022-07-19 10:50:06','10.2.14.55','','1','[HW1203] Global Storage Status (상태 값 : Failed)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-11-02 21:51:10.004',24332,'','10.2.14.55','','','','test_dell','','','','','','','','','','','','','','조치완료','','',NULL,NULL,'','','',NULL,NULL,'','N','N','2','관리자','2022-11-02 21:52:02.799','',0,'지속','HW',32951,''),
	 ('E2022100500020','2022-09-26 21:01:47','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_p05p06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-09 00:44:10.004',4903,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치완료','e1','인지','2022-10-12 09:14:37','2022-10-12 16:59:32','','','',NULL,NULL,'','N','N','5','e1','2022-10-12 16:59:32','',0,'해소','HW',36746,''),
	 ('E2022100500013','2022-07-05 12:01:44','10.4.206.14','','1','[HW5103] [aidu-node1] : Over Temperature 발생','10.2.14.54','2022-10-05 14:46:00','Critical','2022-10-05 20:01:10.005',316,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','조치완료','김지웅','이관','2022-10-05 20:01:15','2022-10-05 20:01:21','테스트 인지','김지웅','이관','2022-10-05 20:01:24','2022-10-05 20:01:34','테스트 종료','N','N','8','김지웅','2022-10-05 20:01:38','',0,'해소','HW',32504,''),
	 ('E2022101200002','2022-10-10 03:00:44','10.0.8.128','','1','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 86)','10.2.14.54','2022-10-10 03:01:00','Critical','2022-10-17 01:01:10.004',2,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치중','e1','조치중','2022-10-18 15:10:22','2022-10-18 15:10:30','ㅁㅁㅁㅁ','e1','이관','2022-10-18 15:17:53','2022-10-18 15:17:58','ㅁㅁㅁㅁ','','','','',NULL,'',0,'해소','HW',36567,''),
	 ('E2022100500006','2022-09-26 21:01:43','10.0.8.128','','1','[HW5313] [/vol/test_vol] : Filesystem status (Filesystem 상태 확인 필요)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36595,''),
	 ('E2022100500019','2022-07-14 17:15:49','10.3.198.33','','1','[OS0009] {$TRIGGERPREFIX}/ 디스크 남은 용량 : 27.78 %','10.2.14.54','2022-10-05 14:46:00','Critical','2022-10-26 10:17:10.004',23220,'SVER9124239001236','10.3.198.33','','10.3.198.15','C80AA932C8C2','DMZ-XEN-11-cnode01_','Cnode 1 SATA 500GB * 2','QUA_SVR-S99','QUANTA COMPUTER','목동1IDC','08층 [A실]','8A-2308','23','공통-cloud-IPC','공통-cloud-IPC','Server','인프라/Cloud운영혁신팀','N','82022122','조치완료','E1','이관','2022-10-26 10:17:25','2022-10-26 10:17:33','이관처리함','E1','이관','2022-10-26 10:17:38','2022-10-26 10:17:46','2차 이관 처리함','N','N','1','E1','2022-10-26 10:17:56','I2022101200022',0,'해소','',32814,''),
	 ('E2022102500001','2022-10-24 20:30:44','10.4.206.14','','1','[HW5302] [/vol/vol0/.snapshot] : Filesystem I-node 사용량 (100%이상, 현재 값 : 13 %)','10.2.14.54','2022-10-25 10:29:00','Critical','2022-10-26 12:30:10.005',989,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','조치완료','E1','이관','2022-11-08 10:46:58','2022-11-08 10:47:31','테스트 장애 확인
인지자 조치 불가.
조치자에게 인계','E1','이관','2022-11-08 10:47:41','2022-11-08 10:48:36','NETAPP 기술팀으로 이관','Y','Y','3','E1','2022-11-08 10:48:51','',0,'해소','HW',38953,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022100500029','2022-09-22 21:05:44','10.4.206.14','','1','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-24 17:46:10.005',22115,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'해소','HW',32494,''),
	 ('E2022100500003','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [node1_aggr1] : Filesystem 사용량 (90%이상, 현재 값 : 99 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36735,''),
	 ('E2022100500034','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/KTNMS_MAIN_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23578,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36740,''),
	 ('E2022100500032','2022-08-08 21:04:01','10.2.14.55','','1','[HW1002] SNMP Agent Check 필요','10.2.14.54','2022-10-05 14:46:00','Critical','2022-11-02 21:51:10.004',24332,'','10.2.14.55','','','','test_hp','','','','','','','','','','','','','','조치완료','','',NULL,NULL,'','','',NULL,NULL,'','N','N','2','관리자','2022-11-02 21:52:02.799','I2022110200023',0,'지속','HW',33214,''),
	 ('E2022100500025','2022-09-26 21:01:47','10.0.8.128','','1','[HW5303] [/vol/ca_jpt_prd_zab_d03d04_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','인지','e1','조치중','2022-10-18 15:16:05','2022-10-18 15:16:09','','','',NULL,NULL,'','','','','',NULL,'I2022111500028',0,'해소','HW',36748,''),
	 ('E2022101200001','2022-10-12 00:34:49','10.4.17.187','','1','[HW6002] CPU 사용량 (80%이상 ~ 90%미만, 현재 값 : 85)','10.2.14.54','2022-10-12 00:35:00','Critical','2022-11-16 15:14:10.005',17,'K918358400000005','10.4.17.187','','10.4.17.187 / 10.4.17.189','','VDI_5R1315_node1','','NET_STO-FAS8060','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1315','7','업무용VDI','업무용VDI','Unknown','인프라/Cloud운영혁신팀','N','82022988','인지','e1','조치중','2022-10-18 15:04:41','2022-10-18 15:05:17','','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',30477,''),
	 ('E2022111700001','2022-11-17 04:26:44','10.4.206.15','','1','[HW5102] [aidu-node2] : NVRAM Battery status (Check 필요)','10.2.14.54','2022-11-17 04:27:00','Critical','2022-11-17 14:50:10.004',624,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39112,''),
	 ('E2022100500009','2022-09-26 17:05:35','10.9.157.139','','1','[HW4303] [ Power Supply #2] : status (상태 값 : Faulty)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-11-14 13:33:10.014',41106,'K912264000010034','CPU233146','','10.9.157.139','','0000_BROCADE_BR5300','샌Switch','BRD-BR5300','Brocade','천안CDC','02층 [5실]','5-1419','41','통합과금','통합과금','Switch','인프라/Cloud운영혁신팀','N','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022110900027',0,'해소','HW',36029,''),
	 ('E2022100500007','2022-07-05 12:01:44','10.4.206.14','','1','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-24 17:46:10.005',22115,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'해소','HW',32490,''),
	 ('E2022100500021','2022-09-26 21:01:43','10.0.8.128','','1','[HW5353] [test_vol] : Volume status (상태 값 : Offline)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36759,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022100500008','2022-09-26 21:01:47','10.0.8.128','','1','[HW5103] [coremgmt-node02] : Over Temperature 발생','10.2.14.54','2022-10-05 14:46:00','Critical','2022-10-12 17:12:10.009',4905,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','조치완료','e1','이관','2022-10-07 14:12:23','2022-10-12 09:14:53','','','',NULL,NULL,'','N','Y','4','e1','2022-10-12 17:16:30','',0,'해소','HW',36573,''),
	 ('E2022100500004','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/jpt20220811a01a02_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200021',0,'해소','HW',36752,''),
	 ('E2022100500010','2022-09-26 21:01:43','10.0.8.128','','1','[HW5303] [/vol/jpt20220811d05d06_vol] : Filesystem 사용량 (90%이상, 현재 값 : 97 %)','10.2.14.54','2022-10-05 14:46:00','Fatal','2022-10-26 17:38:10.007',23577,'K918035700000017','CPU355076','10.0.8.128','10.0.8.128','','0000_NETAPP_FAS3220_C-Mode','SNODE','NET_FAS3220','업체정보없음','천안CDC','02층 [5실]','5-0602','1','공통-cloud-IPC','공통-cloud-IPC','Storage','인프라/Cloud운영혁신팀','N','82022988','인지','E1','인지','2022-11-09 15:26:21',NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022110900027',0,'해소','HW',36753,''),
	 ('E2022110200002','2022-11-01 09:30:44','10.4.206.15','','1','[HW5303] [node1_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-02 21:49:00','Fatal','2022-11-17 14:50:10.004',19377,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','조치중','테스트','이관','2022-11-14 10:54:43','2022-11-14 10:55:06','','E1','이관','2022-11-14 10:55:50','2022-11-14 10:56:10','','','','','',NULL,'I2022110300025',0,'지속','HW',39089,''),
	 ('E2022100500011','2022-08-15 07:29:27','10.4.169.111','','1','[HW1002] SNMP Agent Check 필요','10.2.14.54','2022-10-05 14:46:00','Critical','2022-11-17 14:50:10.004',43706,'K917689300000270','10.4.169.111','','10.4.169.111','A0369F27BBF0','bdap-jupyterhub02-old','cnode09','DEL_SVR-POWEREDGE R620','Dell(델) (SECUREWORKS 인수)','천안CDC','02층 [4실]','4-0814','21','빅데이터분석플랫폼','빅데이터분석플랫폼','Server','인프라/Cloud운영혁신팀','N','91255561','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'지속','HW',25105,''),
	 ('E2022111700003','2022-11-17 04:31:44','10.4.206.17','','1','[HW5152] [aidu-node1] : Ha status (Check 필요)','10.2.14.54','2022-11-17 04:32:00','Critical','2022-11-17 14:50:10.004',619,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39122,''),
	 ('E2022100500005','2022-07-14 17:22:25','10.3.198.34','','1','[OS0009] {$TRIGGERPREFIX}/ 디스크 남은 용량 : 24.34 %','10.2.14.54','2022-10-05 14:46:00','Critical','2022-11-17 14:50:10.004',43706,'SVER9124239001235','10.3.198.34','','10.3.198.16','C80AA9F17E35','DMZ-XEN-11-cnode02_','Cnode 2 SATA 500GB * 2','QUA_SVR-S99','QUANTA COMPUTER','목동1IDC','08층 [A실]','8A-2308','24','공통-cloud-IPC','공통-cloud-IPC','Server','인프라/Cloud운영혁신팀','N','82022122','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'지속','',32822,''),
	 ('E2022110100004','2022-11-01 09:01:44','10.4.206.14','','1','[HW5103] [aidu-node1] : Over Temperature 발생','10.2.14.54','2022-11-01 15:21:00','Critical','2022-11-14 13:26:10.004',17527,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','조치완료','E1','인지','2022-11-09 10:20:28','2022-11-14 13:29:46','','','',NULL,NULL,'','N','N','3','E1','2022-11-14 13:29:46','I2022110900026',0,'지속','HW',39113,''),
	 ('E2022111700002','2022-11-17 04:31:44','10.4.206.17','','1','[HW5153] [aidu-node1] : Ha Interconnect status (상태 값 : Down)','10.2.14.54','2022-11-17 04:32:00','Fatal','2022-11-17 14:50:10.004',619,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39128,''),
	 ('E2022110200003','2022-07-19 10:50:06','10.2.14.55','','1','[HW1203] Global Storage Status (상태 값 : Failed)','10.2.14.54','2022-11-02 21:52:00','Fatal','2022-11-17 14:50:10.004',19374,'','','','','','test_dell','','','','','','','','','','','','','','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',32951,'');
INSERT INTO cmon_event_info (event_id,occu_time,target_ip,target_item,target_value,target_contents,send_agent,create_time,event_level,last_occu_time,event_occu_count,equ_barcode,device_ip,mgmt_ip,ipmi_ip,physical_address,hostname,equip_label,model,manuf_nm,container_nm,datacenter_nm,rack_location,equip_position,stdnm,estdnm,type_nm,own_dept_nm,warr_st_dt,hwoprusrcd,event_state,event_step1_user,event_step1_state,event_step1_start,event_step1_end,event_step1_contents,event_step2_user,event_step2_state,event_step2_start,event_step2_end,event_step2_contents,event_service_impact,event_tech_voc,event_result_type,event_result_user,event_result_time,incident_id,exception_flag,zabbix_state,gubun,trigger_id,host_group_gubun) VALUES
	 ('E2022110400001','2022-11-04 18:01:29','10.3.198.115','','1','[VM_XEN022]{$TRIGGERPREFIX} SSH 22번 포트 감시','10.2.14.54','2022-11-04 18:02:00','Fatal','2022-11-14 13:26:10.004',14125,'SVER9124021000522','10.3.198.115','','10.3.198.97','001B21A7CAA5','DMZ-XEN-12-cnode03_','Cnode03 SATA 500GB * 2','HPA_SVR-DL360 G7 (#2)','HP(휴렛팩커드)','목동1IDC','08층 [A실]','8A-2117','3','공통-cloud-IPC','공통-cloud-IPC','Server','인프라/Cloud운영혁신팀','N','82022122','조치완료','테스트','이관','2022-11-08 11:15:17','2022-11-14 10:55:26','인지 담당자 변경 테스트','','',NULL,NULL,'','N','N','5','E1','2022-11-14 13:29:28','',0,'지속','',29225,''),
	 ('E2022110200005','2022-11-01 09:30:44','10.4.206.14','','1','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-02 21:52:00','Fatal','2022-11-14 13:26:10.004',16773,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','조치완료','E1','이관','2022-11-08 11:15:23','2022-11-14 10:56:59','','','',NULL,NULL,'','N','N','3','E1','2022-11-14 13:29:34','I2022110300025',0,'지속','HW',39091,''),
	 ('E2022102600002','2022-07-14 17:15:49','10.3.198.33','','1','[OS0009] {$TRIGGERPREFIX}/ 디스크 남은 용량 : 27.78 %','10.2.14.54','2022-10-26 10:18:00','Critical','2022-11-17 14:50:10.004',20486,'SVER9124239001236','10.3.198.33','','10.3.198.15','C80AA932C8C2','DMZ-XEN-11-cnode01_','Cnode 1 SATA 500GB * 2','QUA_SVR-S99','QUANTA COMPUTER','목동1IDC','08층 [A실]','8A-2308','23','공통-cloud-IPC','공통-cloud-IPC','Server','인프라/Cloud운영혁신팀','N','82022122','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','',32814,''),
	 ('E2022110100003','2022-11-01 09:30:44','10.4.206.15','','1','[HW5303] [node1_aggr1] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-01 15:21:00','Fatal','2022-11-17 14:50:10.004',20128,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','조치중','E1','이관','2022-11-03 12:50:42','2022-11-03 12:50:52','','E1','이관','2022-11-03 12:51:41','2022-11-03 12:51:45','','','','','',NULL,'',0,'지속','HW',39093,''),
	 ('E2022110100005','2022-11-01 09:01:44','10.4.206.15','','1','[HW5103] [aidu-node2] : Over Temperature 발생','10.2.14.54','2022-11-01 15:21:00','Critical','2022-11-17 14:50:10.004',20128,'','','','','','0000_NETAPP_FAS8300_C-Mode','','','','','','','','','','','','','','조치중','E1','이관','2022-11-09 10:20:28','2022-11-14 10:57:41','','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39114,''),
	 ('E2022111400002','2022-11-01 09:30:44','10.4.206.17','','1','[HW5303] [node2_aggr0] : Filesystem 사용량 (90%이상, 현재 값 : 95 %)','10.2.14.54','2022-11-14 13:33:00','Fatal','2022-11-17 14:50:10.004',2601,'K919854900000001','CPU445935','','10.4.206.14','','0000_NETAPP_FAS8300_C-Mode','NET_FAS8300 - AI교육플랫폼','NET_FAS8300','NetApp (네트워크어플라이언스)','천안CDC','02층 [5실]','5-1417','2','공통-cloud-IPC','공통-cloud-IPC','Unknown','인프라/Cloud운영혁신팀','N','82022339','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'',0,'지속','HW',39091,''),
	 ('E2022100500016','2022-09-21 16:26:51','10.4.41.102','','1','[HW1002] SNMP Agent Check 필요','10.2.14.54','2022-10-05 14:46:00','Critical','2022-11-17 14:50:10.004',43706,'K917931000000014','10.4.41.13','','10.4.41.102','B8CA3A682A08','snode03-swift2.ktis-prod.ipc-ng2','snode02-swift2','DEL_PowerEdge R720','Dell(델) (SECUREWORKS 인수)','천안CDC','02층 [5실]','5-0805','7','빅데이터분석플랫폼','빅데이터분석플랫폼','Server','인프라/Cloud운영혁신팀','N','82022122','신규','','',NULL,NULL,'','','',NULL,NULL,'','','','','',NULL,'I2022101200022',0,'지속','HW',25210,''),
	 ('E2022111400001','2022-11-04 18:01:29','10.3.198.115','','1','[VM_XEN022]{$TRIGGERPREFIX} SSH 22번 포트 감시','10.2.14.54','2022-11-14 13:33:00','Fatal','2022-11-17 14:50:10.004',2601,'SVER9124021000522','10.3.198.115','','10.3.198.97','001B21A7CAA5','DMZ-XEN-12-cnode03_','Cnode03 SATA 500GB * 2','HPA_SVR-DL360 G7 (#2)','HP(휴렛팩커드)','목동1IDC','08층 [A실]','8A-2117','3','공통-cloud-IPC','공통-cloud-IPC','Server','인프라/Cloud운영혁신팀','N','82022122','조치중','E1','이관','2022-11-15 09:16:33','2022-11-15 09:16:45','','E1','인지 접수 및 조치','2022-11-15 09:17:35',NULL,'','','','','',NULL,'',0,'지속','',29225,'IPC');






--사용자 권한 설정
--sms_user_contact

 CREATE TABLE IF NOT EXISTS sms_user_contact(
	 zabbix_ip character varying(30)                
	 , user_id character varying(50)                
	 , user_name character varying(30)              
	 , user_depart character varying(50)            
	 , user_phone character varying(50)             
	 , user_mail character varying(50)              
);                                             
 CREATE INDEX sms_user_contact_idx1 ON sms_user_contact USING btree (user_id);


DELETE FROM sms_user_contact; 


INSERT INTO sms_user_contact (zabbix_ip,user_id,user_name,user_depart,user_phone,user_mail) VALUES
	 ('10.2.14.54','95656487','테스트','cloud운영개발팀1','010-2365-9874',''),
	 ('10.2.14.54','91318369','임재홍','E1','010111111111','');




--사용자정보
--cmon_user
	
	
CREATE TABLE IF NOT EXISTS cmon_user(
	user_id character varying(30) NOT NULL       
	 , user_password character varying(300)                                    
	 , user_group character varying(30)                                        
	 , user_name character varying(30)                                         
	 , user_depart character varying(50)                                       
	 , last_login character varying(10)                                        
	 , CONSTRAINT cmon_user_pk PRIMARY KEY (user_id)                           
 );                                                                        
	

DELETE FROM cmon_user; 
   


INSERT INTO cmon_user (user_id,user_password,user_group,user_name,user_depart,last_login) VALUES
	 ('82253233','','관리자','이경수','KT cloud',''),
	 ('82253235','','관리자','홍동진','KT cloud',''),
	 ('91219233','','관리자','윤여용','KT cloud',''),
	 ('91293313','','관리자','이시운','KT cloud',''),
	 ('91293314','','관리자','유경호','KT cloud',''),
	 ('82253890','hKdwzuzRUIRAfKFoz1aFmRGjaGdbHyuo1/+wr4VTKNY=','관리자','김지웅','KT cloud','2022-07-19'),
	 ('82253234','73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=','관리자','김준호','KT cloud','2022-07-19'),
	 ('monitor','hKdwzuzRUIRAfKFoz1aFmRGjaGdbHyuo1/+wr4VTKNY=','사용자','monitor','KT cloud','2022-07-19'),
	 ('82253221','pzlBYQ7ZpnGp8cWJenb57XXfurZSmC4Vwvl+IAZUN5s=','관리자','민범홍','KT cloud','2022-07-20'),
	 ('91110260','H+kPoqUXbYQYKuTM+uZodWXPcD2lQfzv1vzW8omY1Xc=','관리자','정진욱','KT cloud','2022-07-21');
INSERT INTO cmon_user (user_id,user_password,user_group,user_name,user_depart,last_login) VALUES
	 ('82253220','/jRRvzZwvKl1kF0O/L3GlX7xRR/QCIpzwfENkyXBbaQ=','관리자','김경진','KT cloud','2022-07-26'),
	 ('김지웅','FsyguyL+em/rKacfUYZnjOWg/UsIjIZZ8rMMNKetmkM=','관리자','김지웅','kt cloud Cloud운영개발팀','2022-08-08'),
	 ('test','wk3QDqyfVHlWVup7jkX3H9IKiZbp9IN+JE1E5H6hS5M=','관리자','e1','e1','2022-08-11'),
	 ('E1','MVMYpeQsjH+bM6PvQ+NcYMD+gYwcZYvEhvjebMvaFz8=','관리자','E1','E1','2022-10-24'),
	 ('12000126','sD3fPKLnFKZUjnSV4qA/XoJOqsmDfNfxWcZ7kPtLc0I=','관리자','김지웅','KT Cloud','2022-08-11'),
	 ('82260269','6uUphMLr98ymMgDL6LW5HyKYXgBrfR5weQMbr7RGrBY=','관리자','김소희','kt cloud Cloud운영개발팀','2022-11-02'),
	 ('test1','','운용관제자','e1테스트','e1',''),
	 ('e2','x4BS+wsT8oDUJBAnqmCubjTI8RfpLtIhqbg4BKhtn+E=','관리자','테스트','e1','2022-11-14');




	 
   

--sms전송 규칙
--sms_send_rule


CREATE TABLE IF NOT EXISTS sms_send_rule(
	idx integer                
	 , zabbix_ip character varying(30)                           
	 , host_group_name character varying(100)                    
	 , host_name character varying(100)                          
	 , host_ip character varying(50)                             
	 , event_level integer                                       
	 , user_id character varying(50)                             
	 , group_name character varying(50)                          
 );                                                          
 CREATE INDEX sms_send_rule_idx1 ON sms_send_rule USING btree (zabbix_ip);
 CREATE INDEX sms_send_rule_idx2 ON sms_send_rule USING btree (idx);


DELETE FROM sms_send_rule; 


INSERT INTO sms_send_rule (idx,zabbix_ip,host_group_name,host_name,host_ip,event_level,user_id,group_name) VALUES
	 (2,'10.2.14.54','1','2','4',4,'82253891','유저'),
	 (1,'10.2.14.54','','','',4,'91318369','');




--공지사항
--cmon_notice

CREATE TABLE IF NOT EXISTS cmon_notice(
	idx integer NOT NULL       
	 , regist_time timestamp without time zone                 
	 , regist_person character varying(30)                     
	 , title character varying(100)                            
	 , content character varying(1000)                         
	 , CONSTRAINT cmon_notice_pk PRIMARY KEY (idx)             
 );                                                        
 
 
DELETE FROM cmon_notice; 

 
INSERT INTO cmon_notice (idx,regist_time,regist_person,title,"content") VALUES
	 (1,'2022-08-04 15:47:59','김지웅','8월 4일 DEV 배포 완료','테스트오픈'),
	 (2,'2022-08-11 15:07:20','김지웅','8월 11일 배포 중','8월 11일 배포 중. 이벤트 발생시 가청, SMS 주소관리, 자빅스 이벤트 상태 연동하여 (해소, 유지처리)'),
	 (3,'2022-08-11 18:35:45','김지웅','8월 11일 DEV  배포 완료','8월 11일 DEV  배포 완료 띄어쓰기가 안됩니다');



	 
	 
--20221122 추가

--idc 리스트	 
--cmon_idc_list
	 
 CREATE TABLE IF NOT EXISTS cmon_idc_list(idc_name character varying(30) NOT NULL
 , CONSTRAINT cmon_idc_list_pk PRIMARY KEY (idc_name) );	 
 
 
 INSERT INTO cmon_idc_list (idc_name) VALUES
	 ('강남IDC'),
	 ('구목동센터'),
	 ('김해GDC'),
	 ('남청주DC'),
	 ('목동1IDC'),
	 ('목동2IDC'),
	 ('분당IDC'),
	 ('서부산Edge'),
	 ('여의도IDC'),
	 ('천안CDC'),
	 ('탄방센터'),
	 ('혜화Edge'),
	 ('기타');
 
	 

--차트데이터
--cmon_daily_chart
	 
 CREATE TABLE IF NOT EXISTS cmon_daily_chart(
	 chart_date timestamp without time zone
	 , event_count integer
	 , incident_count integer
 );
 CREATE INDEX cmon_daily_chart_idx1 ON public.cmon_daily_chart USING btree (chart_date);	
 
 
 INSERT INTO cmon_daily_chart (chart_date,event_count,incident_count) VALUES
	 ('2022-08-18 00:00:00',0,0),
	 ('2022-08-17 00:00:00',0,0),
	 ('2022-08-31 00:00:00',0,0),
	 ('2022-08-30 00:00:00',0,0),
	 ('2022-09-25 00:00:00',0,0),
	 ('2022-10-20 00:00:00',0,0),
	 ('2022-09-24 00:00:00',0,0),
	 ('2022-09-23 00:00:00',0,0),
	 ('2022-07-08 00:00:00',0,0),
	 ('2022-07-07 00:00:00',0,0),
	 ('2022-07-06 00:00:00',0,0),
	 ('2022-07-05 00:00:00',0,0),
	 ('2022-07-04 00:00:00',0,0),
	 ('2022-07-03 00:00:00',0,0),
	 ('2022-07-02 00:00:00',0,0),
	 ('2022-07-01 00:00:00',0,0),
	 ('2022-06-30 00:00:00',0,0),
	 ('2022-06-29 00:00:00',0,0),
	 ('2022-06-28 00:00:00',0,0),
	 ('2022-06-27 00:00:00',0,0),
	 ('2022-06-26 00:00:00',0,0),
	 ('2022-06-14 00:00:00',0,0),
	 ('2022-06-13 00:00:00',0,0),
	 ('2022-06-12 00:00:00',0,0),
	 ('2022-06-11 00:00:00',0,0),
	 ('2022-06-10 00:00:00',0,0),
	 ('2022-06-09 00:00:00',0,0),
	 ('2022-06-08 00:00:00',0,0),
	 ('2022-06-07 00:00:00',0,0),
	 ('2022-06-06 00:00:00',0,0),
	 ('2022-06-05 00:00:00',0,0),
	 ('2022-06-25 00:00:00',0,0),
	 ('2022-06-24 00:00:00',0,0),
	 ('2022-06-23 00:00:00',0,0),
	 ('2022-06-22 00:00:00',0,0),
	 ('2022-06-21 00:00:00',0,0),
	 ('2022-06-20 00:00:00',0,0),
	 ('2022-06-18 00:00:00',0,0),
	 ('2022-06-17 00:00:00',0,0),
	 ('2022-06-16 00:00:00',0,0),
	 ('2022-06-15 00:00:00',0,0),
	 ('2022-09-22 00:00:00',0,0),
	 ('2022-09-21 00:00:00',0,1),
	 ('2022-09-20 00:00:00',0,0),
	 ('2022-09-19 00:00:00',0,0),
	 ('2022-09-18 00:00:00',0,0),
	 ('2022-09-17 00:00:00',0,0),
	 ('2022-09-16 00:00:00',0,0),
	 ('2022-09-15 00:00:00',0,0),
	 ('2022-09-14 00:00:00',0,0),
	 ('2022-09-13 00:00:00',0,0),
	 ('2022-10-30 00:00:00',0,0),
	 ('2022-10-04 00:00:00',0,0),
	 ('2022-10-03 00:00:00',0,0),
	 ('2022-10-24 00:00:00',0,0),
	 ('2022-10-02 00:00:00',0,0),
	 ('2022-08-29 00:00:00',0,0),
	 ('2022-08-28 00:00:00',0,0),
	 ('2022-08-16 00:00:00',0,0),
	 ('2022-08-15 00:00:00',2,0),
	 ('2022-08-14 00:00:00',0,0),
	 ('2022-08-13 00:00:00',2,0),
	 ('2022-07-22 00:00:00',0,0),
	 ('2022-07-21 00:00:00',2,0),
	 ('2022-07-20 00:00:00',0,3),
	 ('2022-07-19 00:00:00',24,2),
	 ('2022-07-18 00:00:00',5,2),
	 ('2022-07-17 00:00:00',3,2),
	 ('2022-07-16 00:00:00',0,0),
	 ('2022-07-15 00:00:00',10,4),
	 ('2022-07-14 00:00:00',0,0),
	 ('2022-07-13 00:00:00',0,0),
	 ('2022-07-12 00:00:00',0,0),
	 ('2022-07-11 00:00:00',0,0),
	 ('2022-07-10 00:00:00',0,0),
	 ('2022-07-09 00:00:00',0,0),
	 ('2022-08-12 00:00:00',0,0),
	 ('2022-08-11 00:00:00',71,1),
	 ('2022-08-10 00:00:00',0,0),
	 ('2022-08-09 00:00:00',0,0),
	 ('2022-08-08 00:00:00',0,1),
	 ('2022-08-07 00:00:00',0,0),
	 ('2022-08-06 00:00:00',0,0),
	 ('2022-08-05 00:00:00',2,0),
	 ('2022-08-04 00:00:00',0,0),
	 ('2022-06-19 00:00:00',0,0),
	 ('2022-08-03 00:00:00',0,0),
	 ('2022-08-02 00:00:00',0,0),
	 ('2022-08-01 00:00:00',0,0),
	 ('2022-07-31 00:00:00',0,0),
	 ('2022-07-30 00:00:00',0,0),
	 ('2022-07-29 00:00:00',1,0),
	 ('2022-07-28 00:00:00',3,0),
	 ('2022-08-27 00:00:00',0,0),
	 ('2022-08-26 00:00:00',0,0),
	 ('2022-08-25 00:00:00',0,0),
	 ('2022-08-24 00:00:00',0,0),
	 ('2022-08-23 00:00:00',0,0),
	 ('2022-08-22 00:00:00',0,1),
	 ('2022-10-22 00:00:00',0,0),
	 ('2022-10-18 00:00:00',0,0),
	 ('2022-10-17 00:00:00',0,0),
	 ('2022-10-16 00:00:00',0,0),
	 ('2022-09-11 00:00:00',0,0),
	 ('2022-09-10 00:00:00',0,0),
	 ('2022-09-09 00:00:00',0,0),
	 ('2022-07-27 00:00:00',0,0),
	 ('2022-07-26 00:00:00',0,1),
	 ('2022-07-25 00:00:00',2,0),
	 ('2022-07-24 00:00:00',0,0),
	 ('2022-07-23 00:00:00',0,0),
	 ('2022-09-08 00:00:00',0,0),
	 ('2022-09-07 00:00:00',0,0),
	 ('2022-10-31 00:00:00',0,0),
	 ('2022-10-08 00:00:00',0,0),
	 ('2022-10-29 00:00:00',0,0),
	 ('2022-10-28 00:00:00',0,0),
	 ('2022-10-27 00:00:00',0,0),
	 ('2022-09-12 00:00:00',0,0),
	 ('2022-10-01 00:00:00',0,0),
	 ('2022-10-26 00:00:00',3,0),
	 ('2022-10-07 00:00:00',0,1),
	 ('2022-10-06 00:00:00',2,0),
	 ('2022-09-06 00:00:00',0,0),
	 ('2022-09-05 00:00:00',0,0),
	 ('2022-09-04 00:00:00',0,0),
	 ('2022-08-21 00:00:00',0,0),
	 ('2022-08-20 00:00:00',0,0),
	 ('2022-09-03 00:00:00',0,0),
	 ('2022-08-19 00:00:00',0,0),
	 ('2022-09-02 00:00:00',0,0),
	 ('2022-09-01 00:00:00',0,0),
	 ('2022-10-15 00:00:00',1,0),
	 ('2022-09-30 00:00:00',0,0),
	 ('2022-10-14 00:00:00',0,0),
	 ('2022-09-29 00:00:00',0,0),
	 ('2022-09-28 00:00:00',0,0),
	 ('2022-09-27 00:00:00',0,0),
	 ('2022-09-26 00:00:00',0,0),
	 ('2022-10-13 00:00:00',0,0),
	 ('2022-10-12 00:00:00',5,3),
	 ('2022-11-09 00:00:00',0,2),
	 ('2022-10-11 00:00:00',0,0),
	 ('2022-10-10 00:00:00',2,0),
	 ('2022-10-09 00:00:00',0,0),
	 ('2022-10-23 00:00:00',0,0),
	 ('2022-10-21 00:00:00',0,0),
	 ('2022-10-05 00:00:00',35,0),
	 ('2022-10-19 00:00:00',1,0),
	 ('2022-10-25 00:00:00',1,0),
	 ('2022-11-13 00:00:00',0,0),
	 ('2022-11-12 00:00:00',0,0),
	 ('2022-11-11 00:00:00',0,0),
	 ('2022-11-10 00:00:00',0,0),
	 ('2022-11-08 00:00:00',0,0),
	 ('2022-11-07 00:00:00',0,0),
	 ('2022-11-06 00:00:00',0,0),
	 ('2022-11-05 00:00:00',0,0),
	 ('2022-11-04 00:00:00',1,0),
	 ('2022-11-03 00:00:00',0,2),
	 ('2022-11-02 00:00:00',5,1),
	 ('2022-11-01 00:00:00',5,0),
	 ('2022-11-14 00:00:00',3,0);

	 
	 
--cmon_incident_proc

CREATE TABLE IF NOT EXISTS cmon_incident_proc(
	idx integer NOT NULL
	 , incident_id character varying(20)
	 , proc_time timestamp without time zone
	 , proc_content character varying(200)
	 , proc_user character varying(30)
	 , CONSTRAINT cmon_incident_proc_pk PRIMARY KEY (idx)
 );
 CREATE INDEX cmon_incident_proc_idx1 ON public.cmon_incident_proc USING btree (incident_id);



INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (1,'I2022061600001','2022-06-16 04:16:43.21','ㅁ','test'),
	 (2,'I2022061600001','2022-06-16 04:16:46.177','2','test'),
	 (3,'I2022061600001','2022-06-16 04:16:50.293','3','test'),
	 (4,'I2022061600002','2022-06-16 04:31:25.727','1','test'),
	 (5,'I2022061600002','2022-06-16 04:31:29','22222','test'),
	 (6,'I2022061600002','2022-06-16 21:33:45.212','test 등록','test'),
	 (7,'I2022061600005','2022-06-29 17:26:36.947','조치내용추가 업로드','test'),
	 (8,'I2022063000009','2022-06-30 12:44:14.213','처리내역 테스트','test'),
	 (68,'I2022072000013','2022-08-22 13:48:51','fdsfdsafsadfdsafdsafdsafsadfsadfsadfsadfasdfasdfsadfdsafasdfsadfdsafdsafsadfadsfadsf','e1'),
	 (69,'I2022082200017','2022-08-22 18:12:49','sdfdfsfd','e1');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (9,'I2022063000009','2022-06-30 12:47:00','수정완~~','test'),
	 (10,'I2022063000012','2022-06-30 13:10:52.329','문의','test'),
	 (11,'I2022063000012','2022-06-30 13:11:15.879','장애 확인','test'),
	 (12,'I2022063000011','2022-06-30 13:46:58.281','첫입력','test'),
	 (13,'I2022063000011','2022-06-30 13:47:11.173','2','test'),
	 (14,'I2022061600006','2022-06-30 15:10:30.22','테스트 처음','test'),
	 (15,'I2022061600006','2022-06-30 15:10:37.879','두번째','test'),
	 (16,'I2022063000014','2022-06-30 16:46:07.392','1111','test'),
	 (17,'I2022063000014','2022-06-30 16:46:16.736','333','test'),
	 (18,'I2022063000015','2022-06-30 17:12:04.5','테스트','test');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (19,'I2022070400018','2022-07-04 19:28:30.867','1','test'),
	 (20,'I2022070500021','2022-07-05 15:18:13.364','test','이경수'),
	 (21,'I2022070500024','2022-07-05 19:53:41','test123','공통계정'),
	 (23,'I2022070500025','2022-07-05 20:45:08.979','이상징후 대응 시작합니다.','김준호'),
	 (24,'I2022070500025','2022-07-05 20:45:34.668','장애로 확대합니다.','김준호'),
	 (25,'I2022070500025','2022-07-05 20:46:11.699','장애 대응 중입니다.','김준호'),
	 (26,'I2022070500025','2022-07-05 20:46:25.51','장애 완료 되었습니다.','김준호'),
	 (27,'I2022070500023','2022-07-05 22:50:03.945','111 test','공통계정'),
	 (22,'I2022070500024','2022-07-05 19:54:43','2022-07-05 19:53:41	test123	공통계정11','공통계정'),
	 (29,'I2022070600028','2022-07-06 18:52:21.433','인시던트 발생','김지웅');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (30,'I2022070600028','2022-07-06 21:46:16.056','33333','김경진'),
	 (31,'I2022070500024','2022-07-06 21:54:31.067','종료시간 발생시간 경과시간 맞지 않음','민범홍'),
	 (32,'I2022070600030','2022-07-06 22:07:26.713','1번','김경진'),
	 (33,'I2022070600030','2022-07-06 22:07:34.93','2번','김경진'),
	 (34,'I2022070600028','2022-07-06 22:14:11.808','ㄴㅇㅀㄴㅋㅌㅇㅀㅌㄹㅇ호ㅠㄴㅇㄹ흌ㅌㄴㅇ륲ㅋㅌㅇㄹ퓬ㅋㅇ류','민범홍'),
	 (35,'I2022070600031','2022-07-06 22:30:40.764','ㅁㄴㅇㄻㄴㅇㄹ','민범홍'),
	 (36,'I2022070500025','2022-07-07 11:58:31.585','조치완료','김지웅'),
	 (28,'I2022070600026','2022-07-06 13:09:29','인시던트확대합니다?','김지웅'),
	 (37,'I2022070800034','2022-07-08 11:33:40.685','인시던트발생','김지웅'),
	 (38,'I2022070800036','2022-07-08 12:10:55.846','인시던트 확대합니다','김지웅');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (39,'I2022070800036','2022-07-08 13:19:41.813','이상','김지웅'),
	 (40,'I2022070800001','2022-07-08 21:29:51.465','인시던트 확대합니다','김지웅'),
	 (41,'I2022070800001','2022-07-08 21:30:50.789','조치완료','김지웅'),
	 (43,'I2022070800001','2022-07-08 21:32:25.285','수정이 될까요?','민범홍'),
	 (42,'I2022070800001','2022-07-08 21:31:49','조치완료인데 입력???이?','민범홍'),
	 (44,'I2022070800002','2022-07-08 21:38:28.233','테스트 중','민범홍'),
	 (70,'I2022082200017','2022-08-22 18:13:01','111111111111111111111111111111111111111111111111111111111','e1'),
	 (46,'I2022070900007','2022-07-10 16:57:57.332','이벤트 처리완료','김지웅'),
	 (45,'I2022070800002','2022-07-09 12:08:05','조치완료 인시던트 신규입력 테스트 수정 테스?','김지웅'),
	 (47,'I2022070800002','2022-07-10 20:09:15.398','c처리내역추가','김지웅');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (48,'I2022071000012','2022-07-10 21:21:30.019','aaa','김경진'),
	 (49,'I2022071000012','2022-07-10 21:21:38.218','대응종료','김경진'),
	 (50,'I2022071000012','2022-07-10 21:21:47','--','김경진'),
	 (51,'I2022071000009','2022-07-10 21:25:18.209','test','김경진'),
	 (71,'I2022082200017','2022-08-22 18:13:20','666666666','e1'),
	 (52,'I2022071000014','2022-07-11 08:26:05','인시던트확대합니다!!','김지웅'),
	 (53,'I2022071100016','2022-07-11 09:12:13.931','테스트 처리','김준호'),
	 (54,'I2022071500002','2022-07-15 20:20:02','1111','김준호'),
	 (55,'I2022071500002','2022-07-15 20:20:10','2222','김준호'),
	 (56,'I2022071500002','2022-07-15 20:20:30','완료','김준호');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (57,'I2022071500004','2022-07-15 21:36:10','수정','김지웅'),
	 (58,'I2022071700006','2022-07-18 00:22:33','123456dfertyhfty','민범홍'),
	 (59,'I2022071800007','2022-07-18 10:25:26','123','김지웅'),
	 (60,'I2022071800008','2022-07-18 19:33:20','시간','김지웅'),
	 (61,'I2022071900009','2022-07-19 14:24:07','시간확인','김지웅'),
	 (62,'I2022072000012','2022-07-20 19:11:13','이벤트 인시던트로 확대','김지웅'),
	 (63,'I2022072600014','2022-07-26 23:00:31','ㅅㄷㄴㅅ','김경진'),
	 (64,'I2022072600014','2022-07-26 23:00:10','ㄴㅅㄷㄴㅅ-수정','김경진'),
	 (65,'I2022072000013','2022-07-26 23:03:03','ㅅㄷㄴㅅ','김경진'),
	 (66,'I2022081100016','2022-08-11 18:29:35','인시던트 확대','김지웅');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (67,'I2022081100016','2022-08-11 18:29:41','추가!','김지웅'),
	 (72,'I2022082200017','2022-08-22 18:13:40','77666','e1'),
	 (73,'I2022072000011','2022-08-22 18:13:57','1112','e1'),
	 (74,'I2022072000011','2022-08-22 18:14:07','222222','e1'),
	 (75,'I2022072000011','2022-08-22 18:14:18','2122333','e1'),
	 (76,'I2022072000011','2022-08-22 18:14:25','33434','e1'),
	 (78,'I2022072000011','2022-08-22 18:14:40','66666666','e1'),
	 (79,'I2022072000011','2022-08-22 18:14:53','eerr3333333','e1'),
	 (80,'I2022072000011','2022-08-22 18:15:07','55555555','e1'),
	 (77,'I2022072000011','2022-08-22 18:14:32','33ffffff','e1');
INSERT INTO public.cmon_incident_proc (idx,incident_id,proc_time,proc_content,proc_user) VALUES
	 (81,'I2022080800015','2022-08-22 22:50:20','grrt5uymkikm','e1'),
	 (82,'I2022092100018','2022-09-23 10:27:07','adsad','e1'),
	 (83,'I2022092100018','2022-09-23 10:27:21','dsadasd','e1'),
	 (84,'I2022092100018','2022-09-23 10:27:30','asdas','e1'),
	 (85,'I2022092100018','2022-09-23 10:27:45','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','e1'),
	 (86,'I2022092100018','2022-09-23 10:27:55','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','e1'),
	 (88,'I2022072000013','2022-10-05 20:03:32','확인을 합니다','김지웅'),
	 (89,'I2022110300024','2022-11-03 10:20:58','테스트 장애 등록','E1'),
	 (87,'I2022072000013','2022-10-06 20:03:24','내용제거','김지웅'),
	 (90,'I2022110900026','2022-11-15 09:15:44','ADASAS','E1');

	 



	 
	 
--==================================2022-12-02 추가===========================

	 
CREATE TABLE bbs_txn (
	bbs_txn_id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	parent_id int8 NULL,
	pstng_group_id int8 NOT NULL,
	pstng_type_cd varchar(3) NOT NULL,
	pstng_title_nm varchar(200) NOT NULL,
	pstng_sbst text NOT NULL,
	use_yn varchar(1) NOT NULL,
	view_cnt numeric(10) NULL,
	ctgry_type_cd varchar(3) NULL,
	ans_cmplt_yn varchar(1) NULL,
	pop_show_yn varchar(1) NULL DEFAULT 'N'::character varying,
	pop_show_st_dt timestamp NULL,
	pop_show_fns_dt timestamp NULL,
	cret_dt timestamp NULL,
	cretr_id varchar(30) NULL,
	amd_dt timestamp NULL,
	amdr_id varchar(30) NULL,
	CONSTRAINT bbs_txn_pkey PRIMARY KEY (bbs_txn_id)
); 


CREATE TABLE bbs_repl (
	bbs_repl_id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	bbs_txn_id int8 NOT NULL ,
	repl_sbst text NOT NULL ,
	cret_dt timestamp NULL,
	cretr_id varchar(30) NULL,
	amd_dt timestamp NULL,
	amdr_id varchar(30) NULL,
	CONSTRAINT bbs_repl_pkey PRIMARY KEY (bbs_repl_id)
);	 

COMMIT;