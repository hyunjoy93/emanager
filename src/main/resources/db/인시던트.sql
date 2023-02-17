저장 버튼 클릭시
$sql  = "UPDATE cmon_incident_info SET ";
        $sql .= "incident_level     = '{$_REQUEST['dep']}', "; //대응단계
        $sql .= "captain            = '{$_REQUEST['charge1']}', "; //관제상황조장
        $sql .= "incident_chief     = '{$_REQUEST['charge2']}', ";//상황반장
        $sql .= "restore_chief      = '{$_REQUEST['charge3']}', ";//복구반장
        $sql .= "restore_team       = '{$_REQUEST['charge4']}', ";//복구팀
        $sql .= "incident_id        = '{$clear['ciid']}' "; //인시던트 아이디
        $sql .= "WHERE incident_id  = '{$clear['ciid']}'";
////////////////////////////////////////////////////////////////////////////////////////////////////////////
메모 추가 버튼 클릭시
$sql = "INSERT INTO cmon_incident_proc 
                    (incident_id,proc_time,proc_content,proc_user,idx) 
                VALUES ('{$clear['ciid']}','{$SRVDT}','{$cn}','{$user}',{$idx}) ";
인시던트 아이디, 시간, 내용, 입력자, 순서
////////////////////////////////////////////////////////////////////////////////////////////////////////////
인시던트 종료 버튼 클릭시
$sql  = "UPDATE cmon_incident_info SET ";
        $sql .= "incident_state          = '조치완료', ";
        $sql .= "incident_result_user    = '{$_SESSION['uname']}', ";//종료자 
        $sql .= "incident_service_impact = '{$_REQUEST['ec1']}', ";//서비스 영향도
        $sql .= "incident_tech_voc       = '{$_REQUEST['etv']}', ";//테크센터 voc
        $sql .= "itsm_incident_id        = '{$_REQUEST['tc']}', ";//itsm 인시던트 id
        $sql .= "captain                 = '{$_REQUEST['c1']}', ";//관제상황조장
        $sql .= "incident_chief          = '{$_REQUEST['c2']}', ";//상황반장
        $sql .= "restore_chief           = '{$_REQUEST['c3']}', ";//복구반장
        $sql .= "restore_team            = '{$_REQUEST['c4']}', ";//복구팀
        $sql .= "incident_end_time       = '{$SRVDT}' ";//종료시간
        $sql .= "WHERE incident_id       = '{$clear['ciid']}' ";//인시던트 아이디
