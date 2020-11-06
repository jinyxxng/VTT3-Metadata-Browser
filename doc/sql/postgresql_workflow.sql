/* 작업 설정 */
DROP TABLE IF EXISTS DEMO_COMPJOB_TB CASCADE;
CREATE TABLE DEMO_COMPJOB_TB (
	JOBNAME VARCHAR(50) NOT NULL, /* 콤포넌트작업 명 */
  JOBTYPE VARCHAR(50), /* 콤포넌트작업 구분 */
	JOBPROPERTY VARCHAR(4000), /* 콤포넌트작업 속성 */
	STARTEXNAME VARCHAR(50), /* 작업시작 Ex 호출명 */
	PROGRESSEXNAME VARCHAR(50), /* 작업진행률 Ex 호출명 */
	ENDEXNAME VARCHAR(50), /* 작업종료 Ex 호출명 */
	PARAMPROPERTY VARCHAR(4000) /* 파라미터 속성 */
);
COMMENT ON TABLE DEMO_COMPJOB_TB IS '작업 설정';
COMMENT ON COLUMN DEMO_COMPJOB_TB.JOBNAME IS '콤포넌트작업 명';
COMMENT ON COLUMN DEMO_COMPJOB_TB.JOBTYPE IS '콤포넌트작업 구분';
COMMENT ON COLUMN DEMO_COMPJOB_TB.JOBPROPERTY IS '콤포넌트작업 속성';
COMMENT ON COLUMN DEMO_COMPJOB_TB.STARTEXNAME IS '작업시작 Ex 호출명';
COMMENT ON COLUMN DEMO_COMPJOB_TB.PROGRESSEXNAME IS '작업진행률 Ex 호출명';
COMMENT ON COLUMN DEMO_COMPJOB_TB.ENDEXNAME IS '작업종료 Ex 호출명';
COMMENT ON COLUMN DEMO_COMPJOB_TB.PARAMPROPERTY IS '파라미터 속성';
ALTER TABLE DEMO_COMPJOB_TB ADD CONSTRAINT PKC_COMPJOB_TB PRIMARY KEY ( JOBNAME );


/* 콤포넌트서버 */
DROP TABLE IF EXISTS DEMO_COMPSERVER_TB CASCADE;
CREATE TABLE DEMO_COMPSERVER_TB (
  COMPSERVERID NUMERIC NOT NULL, /* 콤포넌트서버 ID */
	COMPSERVERNAME VARCHAR(50), /* 콤포넌트서버 명 */
	JOBNAME VARCHAR(50) , /* 콤포넌트작업 명 */
	SESSIONID NUMERIC DEFAULT 0, /* 세션 ID */
	CHANNEL NUMERIC DEFAULT 0, /* 채널 */
	STATUS NUMERIC DEFAULT 0, /* 상태 */
	CHECKINTIME TIMESTAMP WITHOUT TIME ZONE, /* 체크인 일시 */
	POOL NUMERIC DEFAULT 0, /* 풀 번호 */
	CLIENTIP VARCHAR(15), /* 클라이언트 IP */
	TIMESTAMP TIMESTAMP WITHOUT TIME ZONE, /* 타임 스탬프 */
	PORT NUMERIC DEFAULT 0, /* 포트 번호 */
	CLIENTURL VARCHAR(255), /* 클라이언트 URL */
	PINGSTAMP NUMERIC DEFAULT 0 /* 통신상태 테스트 스탬프 */
);
COMMENT ON TABLE DEMO_COMPSERVER_TB IS '콤포넌트서버';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.COMPSERVERID IS '콤포넌트서버 ID';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.COMPSERVERNAME IS '콤포넌트서버 명';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.JOBNAME IS '콤포넌트서버 ID';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.SESSIONID IS '세션 ID';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.CHANNEL IS '채널';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.STATUS IS '상태';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.CHECKINTIME IS '체크인 일시';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.POOL IS '풀 번호';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.CLIENTIP IS '클라이언트 IP';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.TIMESTAMP IS '타임 스탬프';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.PORT IS '포트 번호';
COMMENT ON COLUMN DEMO_COMPSERVER_TB.PINGSTAMP IS '통신상태 테스트 스탬프';
ALTER TABLE DEMO_COMPSERVER_TB ADD CONSTRAINT PKD_COMPSERVER_TB PRIMARY KEY ( COMPSERVERID );


/* 콤포넌트서버작업 */
DROP TABLE IF EXISTS DEMO_COMPSERVERJOB_TB CASCADE;
CREATE TABLE DEMO_COMPSERVERJOB_TB (
	COMPSERVERID NUMERIC NOT NULL, /* 콤포넌트서버 ID */
	JOBNAME VARCHAR(50) NOT NULL /* 작업 명 */
);
COMMENT ON TABLE DEMO_COMPSERVERJOB_TB IS '콤포넌트서버작업';
COMMENT ON COLUMN DEMO_COMPSERVERJOB_TB.COMPSERVERID IS '콤포넌트서버 ID';
COMMENT ON COLUMN DEMO_COMPSERVERJOB_TB.JOBNAME IS '작업 명';
ALTER TABLE DEMO_COMPSERVERJOB_TB ADD CONSTRAINT PKD_COMPSERVERJOB_TB PRIMARY KEY ( COMPSERVERID, JOBNAME );



/* 작업 내역 */
DROP TABLE IF EXISTS DEMO_COMPJOBQUEUE_TB CASCADE;
CREATE TABLE DEMO_COMPJOBQUEUE_TB (
	JOBID NUMERIC NOT NULL, /* 콤포넌트작업 ID */
	WORKFLOWID NUMERIC NOT NULL, /* 워크플로우 ID */
	JOBNAME VARCHAR(50) NOT NULL, /* 콤포넌트작업 명 */
	COMPSERVERID NUMERIC, /* 콤포넌트서버 ID */
	COMPSERVERIP VARCHAR(15), /* 콤포넌트서버 IP */
	CHANNEL NUMERIC DEFAULT 0, /* 콤포넌트작업 채널 번호 */
	POOL NUMERIC DEFAULT 0, /* 콤포넌트작업 풀 번호 */
	PRIORITY NUMERIC DEFAULT 0, /* 콤포넌트작업 우선 순위 */
	STATUS NUMERIC DEFAULT 0, /* 콤포넌트작업 상태 */
	PROGRESS NUMERIC DEFAULT 0, /* 콤포넌트작업 진행 률 */
	PROGRESSEX VARCHAR(300), /* 콤포넌트작업 진행 부가정보 */
	STARTTIME TIMESTAMP WITHOUT TIME ZONE, /* 콤포넌트작업 시작 일시 */
	MODIFYTIME TIMESTAMP WITHOUT TIME ZONE, /* 콤포넌트작업 변경 일시 */
	ENDTIME TIMESTAMP WITHOUT TIME ZONE, /* 콤포넌트작업 종료 일시 */
	JOBCONTENTS TEXT, /* 콤포넌트작업 내용 */
	PARAMLIST VARCHAR(4000), /* 파라미터 목록 */
	FAILCOUNT NUMERIC DEFAULT 0, /* 콤포넌트작업 실패 회수 */
	FAILREASON VARCHAR(1000), /* 콤포넌트작업 실패 원인 */
	JOBORDER NUMERIC DEFAULT 0 /* 순위 */
);
COMMENT ON TABLE DEMO_COMPJOBQUEUE_TB IS '작업 내역';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.JOBID IS '콤포넌트작업 ID';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.WORKFLOWID IS '워크플로우 ID';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.JOBNAME IS '콤포넌트작업 명';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.COMPSERVERID IS '콤포넌트서버 ID';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.CHANNEL IS '콤포넌트작업 채널 번호';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.POOL IS '콤포넌트작업 풀 번호';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.PRIORITY IS '콤포넌트작업 우선 순위';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.STATUS IS '콤포넌트작업 상태';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.PROGRESS IS '콤포넌트작업 진행 률';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.PROGRESSEX IS '콤포넌트작업 진행 부가정보';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.STARTTIME IS '콤포넌트작업 시작 일시';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.MODIFYTIME IS '콤포넌트작업 변경 일시';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.ENDTIME IS '콤포넌트작업 종료 일시';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.JOBCONTENTS IS '콤포넌트작업 내용';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.PARAMLIST IS '파라미터 목록';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.FAILCOUNT IS '콤포넌트작업 실패 회수';
COMMENT ON COLUMN DEMO_COMPJOBQUEUE_TB.FAILREASON IS '콤포넌트작업 실패 원인';
ALTER TABLE DEMO_COMPJOBQUEUE_TB ADD CONSTRAINT PKD_COMPJOB_TB PRIMARY KEY ( JOBID );


/* 워크플로우 설정 */
DROP TABLE IF EXISTS DEMO_WORKFLOW_TB CASCADE;
CREATE TABLE DEMO_WORKFLOW_TB (
	WORKFLOWNAME VARCHAR(50) NOT NULL, /* 워크플로우 명 */
	ASSETINFO VARCHAR(4000), /* 에셋 정보 */
	TABLENAME NUMERIC, /* 테이블 명 */
	ISDELWORKFLOW NUMERIC DEFAULT 0 /* 삭제 워크플로우 여부 */
);
COMMENT ON TABLE DEMO_WORKFLOW_TB IS '워크플로우 설정';
COMMENT ON COLUMN DEMO_WORKFLOW_TB.WORKFLOWNAME IS '워크플로우 명';
COMMENT ON COLUMN DEMO_WORKFLOW_TB.ASSETINFO IS '에셋 정보';
COMMENT ON COLUMN DEMO_WORKFLOW_TB.TABLENAME IS '테이블 명';
COMMENT ON COLUMN DEMO_WORKFLOW_TB.ISDELWORKFLOW IS '삭제 워크플로우 여부';
ALTER TABLE DEMO_WORKFLOW_TB ADD CONSTRAINT PKC_WORKFLOW_TB PRIMARY KEY ( WORKFLOWNAME );


/* 워크플로우 내역 */
DROP TABLE IF EXISTS DEMO_WORKFLOWHIS_TB CASCADE;
CREATE TABLE DEMO_WORKFLOWHIS_TB (
	WORKFLOWID NUMERIC NOT NULL, /* 워크플로우 ID */
	WORKFLOWNAME VARCHAR(50), /* 워크플로우 명 */
	SUBTYPE NUMERIC DEFAULT 0, /* 서브타입 */
	CURRJOB VARCHAR(50), /* 현재 작업 명 */
	MAINTABLE VARCHAR(50), /* 메인테이블 명 */
	MAINASSETID NUMERIC, /* 메인에셋 ID */
	REFTABLE VARCHAR(50), /* 참조테이블 명 */
	REFASSETID NUMERIC DEFAULT 0, /* 참조에셋 ID */
	SESSIONID NUMERIC DEFAULT 0, /* 호출세션 ID */
	USERID NUMERIC DEFAULT 0, /* 호출사용자 ID */
	STATUS NUMERIC DEFAULT 0, /* 워크플로우 상태 */
	CREATETIME TIMESTAMP WITHOUT TIME ZONE, /* 생성일시 */
	DELETETIME TIMESTAMP WITHOUT TIME ZONE /* 종료일시 */
);
COMMENT ON TABLE DEMO_WORKFLOWHIS_TB IS '워크플로우 내역';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.WORKFLOWID IS '워크플로우 ID';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.WORKFLOWNAME IS '워크플로우 명';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.SUBTYPE IS '서브타입';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.CURRJOB IS '현재 작업 명';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.MAINTABLE IS '메인테이블 명';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.MAINASSETID IS '메인에셋 ID';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.REFTABLE IS '참조테이블 명';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.REFASSETID IS '참조에셋 ID';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.SESSIONID IS '호출세션 ID';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.USERID IS '호출사용자 ID';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.STATUS IS '워크플로우 상태';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.CREATETIME IS '생성일시';
COMMENT ON COLUMN DEMO_WORKFLOWHIS_TB.DELETETIME IS '종료일시';
ALTER TABLE DEMO_WORKFLOWHIS_TB ADD CONSTRAINT PKD_WORKFLOW_TB PRIMARY KEY ( WORKFLOWID );


DROP TABLE IF EXISTS DEMO_WORKFLOWORDER_TB CASCADE;
CREATE TABLE DEMO_WORKFLOWORDER_TB (
	WORKFLOWNAME VARCHAR(50) NOT NULL, /* 워크플로우 명 */
	JOBNAME VARCHAR(50) NOT NULL, /* 콤포넌트작업 명 */
	SUBTYPE NUMERIC NOT NULL, /* 서브타입 */
	SEQ NUMERIC DEFAULT 0, /* 순서 */
	POOL NUMERIC DEFAULT 0, /* 풀 번호 */
	PRIORITY NUMERIC DEFAULT 0, /* 우선순위 */
	EXPOOL NUMERIC DEFAULT 0 /* Ex 풀 번호 */
);
COMMENT ON TABLE DEMO_WORKFLOWORDER_TB IS '작업 순서';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.WORKFLOWNAME IS '워크플로우 명';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.JOBNAME IS '콤포넌트작업 명';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.SUBTYPE IS '서브타입';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.SEQ IS '순서';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.POOL IS '풀 번호';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.PRIORITY IS '우선순위';
COMMENT ON COLUMN DEMO_WORKFLOWORDER_TB.EXPOOL IS 'Ex 풀 번호';
ALTER TABLE DEMO_WORKFLOWORDER_TB ADD CONSTRAINT PKC_WORKFLOWORDER_TB PRIMARY KEY ( WORKFLOWNAME, JOBNAME, SUBTYPE );


/* MamEx */
DROP TABLE IF EXISTS DEMO_MAMEX_TB CASCADE;
CREATE TABLE DEMO_MAMEX_TB (
	TRNAME VARCHAR(50) NOT NULL, /* 트랜잭션 명 */
	POOL NUMERIC DEFAULT 0, /* 풀 번호 */
	URI VARCHAR(200), /* URI */
	TIMESTAMP TIMESTAMP WITHOUT TIME ZONE, /* 타임 스탬프 */
	FAIL NUMERIC DEFAULT 0, /* 통신 상태 */
	DELFLAG NUMERIC DEFAULT 0 /* 삭제 플래그 */
);
COMMENT ON TABLE DEMO_MAMEX_TB IS 'MamEx';
COMMENT ON COLUMN DEMO_MAMEX_TB.TRNAME IS '트랜잭션 명';
COMMENT ON COLUMN DEMO_MAMEX_TB.POOL IS '풀 번호';
COMMENT ON COLUMN DEMO_MAMEX_TB.URI IS 'URI';
COMMENT ON COLUMN DEMO_MAMEX_TB.TIMESTAMP IS '타임 스탬프';
COMMENT ON COLUMN DEMO_MAMEX_TB.FAIL IS '통신 상태';
COMMENT ON COLUMN DEMO_MAMEX_TB.DELFLAG IS '삭제 플래그';
ALTER TABLE DEMO_MAMEX_TB ADD CONSTRAINT PKC_MAMEX_TB PRIMARY KEY ( TRNAME );