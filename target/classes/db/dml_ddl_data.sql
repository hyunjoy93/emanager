-- 장애
CREATE TABLE IF NOT EXISTS cmon_mkate (
	mkate_id varchar NOT NULL,
	mkate_proc_id varchar NULL,
	mkate_nm varchar NULL,
	mkate_type varchar NULL,
	mkate_level varchar NULL,
	charge_depart varchar NULL,
	charge_person varchar NULL,
	charge_person2 varchar NULL,
	charge_person3 varchar NULL,	
	occu_time timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN cmon_mkate.mkate_id IS '장애아이디';
COMMENT ON COLUMN cmon_mkate.mkate_proc_id IS '장애처리아이디';
COMMENT ON COLUMN cmon_mkate.mkate_nm IS '장애명';
COMMENT ON COLUMN cmon_mkate.mkate_type IS '장애구분';
COMMENT ON COLUMN cmon_mkate.mkate_level IS '장애등급';
COMMENT ON COLUMN cmon_mkate.charge_depart IS '담당부서';
COMMENT ON COLUMN cmon_mkate.charge_person IS '관제상황조장';
COMMENT ON COLUMN cmon_mkate.charge_person2 IS '상황반장';
COMMENT ON COLUMN cmon_mkate.charge_person3 IS '복구반장';
COMMENT ON COLUMN cmon_mkate.occu_time IS '발생시간';

DELETE FROM cmon_mkate;

INSERT INTO cmon_mkate(mkate_id, mkate_proc_id, mkate_nm, mkate_type, mkate_level, charge_depart, charge_person, charge_person2, charge_person3, occu_time) 
VALUES ('MKATE_20221108132925001', 'MKATE_PROC_20221108132925001', '어플리케이션 성능관리', 'F999', 'A', '장애지원팀', '김준호', '정경호', '최수영', NOW());	

INSERT INTO cmon_mkate(mkate_id, mkate_proc_id, mkate_nm, mkate_type, mkate_level, charge_depart, charge_person, charge_person2, charge_person3, occu_time) 
VALUES ('MKATE_20221108132925002', 'MKATE_PROC_20221108132925002', '트래픽 관리', 'F001', 'B', '운영팀', '박종식', '이경선', '정주몽', (NOW() + '-1 day'));

INSERT INTO cmon_mkate(mkate_id, mkate_proc_id, mkate_nm, mkate_type, mkate_level, charge_depart, charge_person, charge_person2, charge_person3, occu_time) 
VALUES ('MKATE_20221108132925003', 'MKATE_PROC_20221108132925003', '하드웨어 오작동', 'F999', 'C', '자원관리팀', '김사랑', '이광수', '전소미', (NOW() + '-2 day'));

-- 장애처리
CREATE TABLE IF NOT EXISTS cmon_mkate_proc (
	mkate_proc_id varchar NOT NULL,
	proc_contents varchar NULL,
	proc_time timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN cmon_mkate_proc.mkate_proc_id IS '장애처리아이디';
COMMENT ON COLUMN cmon_mkate_proc.proc_contents IS '처리내용';
COMMENT ON COLUMN cmon_mkate_proc.proc_time IS '처리시간';

DELETE FROM cmon_mkate_proc;

INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925001', '소스코드 수정', NOW());

INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925001', 'DATA 변경', (NOW() + '-1 day'));

INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925002', '메모리 증설', (NOW() + '-1 day'));
INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925002', '서버 증설', (NOW() + '-2 day'));

INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925003', '하드웨어 교체', (NOW() + '-1 day'));

INSERT INTO cmon_mkate_proc(mkate_proc_id, proc_contents, proc_time) 
VALUES ('MKATE_PROC_20221108132925003', '하드웨어 수리', (NOW() + '-2 day'));


COMMIT;