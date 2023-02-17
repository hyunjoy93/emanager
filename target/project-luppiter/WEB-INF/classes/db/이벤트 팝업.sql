1선대응 클릭시
$que = "UPDATE cmon_event_info SET ";
            $que .= "event_state          = '인지', ";
            $que .= "event_step1_user     = '아이디', ";
            $que .= "event_step1_start    = '시간', ";
            $que .= "event_step1_state    = '인지', ";
            $que .= "event_id             = '이벤트 아이디' ";
            $que .= " WHERE event_id      = '이벤트 아이디' ";
////////////////////////////////////////////////////////////////////////////////////////////////////////////
1선 이관 클릭시
 $que = "UPDATE cmon_event_info SET ";        
        $que .= "event_step1_end        = '시간', ";
        $que .= "event_step1_contents   = '텍스트 박스 이관내용', ";
        $que .= "event_state            = '조치중',";
        $que .= "event_step1_state      = '이관' ";
        //$que .= "event_step2_state  = '인지접수 및 조치' ";
        $que .= " WHERE event_id        = '이벤트 아이디' ";

////////////////////////////////////////////////////////////////////////////////////////////////////////////
2선 인지 접수 및 조치 클릭시
$que = "UPDATE cmon_event_info SET ";
        $que .= "event_state        = '조치중', ";
        $que .= "event_step2_state  = '인지 접수 및 조치', ";
        $que .= "event_step2_user   = '아이디', ";
        $que .= "event_step2_start  = '시간' ";
        $que .= " WHERE event_id    = '이벤트 아이디' ";
////////////////////////////////////////////////////////////////////////////////////////////////////////////
2선 이관 클릭시
$que = "UPDATE cmon_event_info SET ";
        $que .= "event_step2_end        = '시간', ";
        $que .= "event_step2_contents   = '텍스트 박스 입력 내용', ";
        $que .= "event_step2_state      = '이관' ";
        $que .= " WHERE event_id        = '이벤트 아이디' ";

////////////////////////////////////////////////////////////////////////////////////////////////////////////
인시던트 생성 버튼 클릭시
$sql  = "INSERT INTO cmon_incident_info 
                (incident_id,incident_start_time,incident_state,incident_level,event_id,event_time,type_nm,container_nm,stdnm,estdnm,incident_contents) 
                VALUES ('{$incident}','{$SRVDT}','조치중','이상징후','{$clear['evid']}','{$rs[0]}','{$rs[1]}','{$rs[2]}','{$rs[3]}','{$rs[4]}','{$content}') ";

인시던트 생성시 이벤트에 인시던트 값 업데이트 한다.
$sql1 = "UPDATE cmon_event_info SET incident_id = '{$incident}', event_step2_contents = '".string_escape_save($_REQUEST['content2'])."' WHERE event_id = '{$clear['evid']}'";


////////////////////////////////////////////////////////////////////////////////////////////////////////////
이벤트종료 클릭시
이벤트 팝업의 이벤트종료처리 폼 값을 업데이트 한다.

$que = "UPDATE cmon_event_info SET ";

        if (!empty($_REQUEST['event_chk1'])) { //서비스 영향도 여부
            $que .= "event_service_impact = '{$_REQUEST['event_chk1']}', ";
        }
        if (!empty($_REQUEST['event_tech_voc'])) { //테크센터 VOC
            $que .= "event_tech_voc = '{$_REQUEST['event_tech_voc']}', ";
        }        

        if (!empty($_REQUEST['content1'])) {
            $que .= "event_step1_contents = '" . string_escape_save($_REQUEST['content1']) . "', ";
        }
        if (!empty($_REQUEST['event_result2'])) {
            $que .= "event_step2_contents = '" . string_escape_save($_REQUEST['event_result2']) . "', ";
        }

        //해당 이벤트 저장된 정보 가져오기
        $que1 = "SELECT event_step2_start,event_step2_end, event_step1_user, event_step1_start, event_step1_state, event_step1_end FROM cmon_event_info WHERE event_id = '{$clear['evid']}'";
        $rs = getOne($que1);

        //저장된 인지 유저가 없으면 현재 로그인한 유저를 등록한다.
        if(empty($rs['event_step1_user'])){
            $que .= "event_step1_user = '{$_SESSION['uname']}', ";
        }
        //상태 없으면 인지로
        if(empty($rs['event_step1_state'])){
            $que .= "event_step1_state = '인지', ";
        }
        //현재 시간등록
        if(empty($rs['event_step1_start'])){
            $que .= "event_step1_start = '{$SRVDT}', ";
        }
        //종료 시간 등록
        if(empty($rs['event_step1_end'])){
            $que .= "event_step1_end = '{$SRVDT}', ";
        }
        //인지접수 조치 시간 등록
        if(!empty($rs['event_step2_start']) && $rs['event_step2_end'] == ''){
            $que .= "event_step2_end = '{$SRVDT}', ";
        }

        $que .= "event_result_user  = '{$_SESSION['uname']}', ";//로그인 이름
        $que .= "event_result_type  = '{$clear['ert']}', "; //이벤트 종료 구분
        $que .= "event_state        = '조치완료', ";
        $que .= "event_result_time  = '{$SRVDT}' "; //시간
        $que .= " WHERE event_id    = '{$clear['evid']}' "; //이벤트 아이디

////////////////////////////////////////////////////////////////////////////////////////////////////////////
저장 버튼 클릭시
 $que = "UPDATE cmon_event_info SET ";
        if(empty($user1)){ //1선 대응이 없다면 기본값으로 현재 유저 등록
            $que .= "event_step1_user     = '{$user1}', ";
        }        
        $que .= "event_id             = '{$clear['evid']}' ";
        $que .= " WHERE event_id      = '{$clear['evid']}' ";