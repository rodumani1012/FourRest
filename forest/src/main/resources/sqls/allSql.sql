1.user.sql 에서 먼저 member table를 만들어 주고 다음 table을 만들때 순서는 무관하다

CREATE SEQUENCE USERSEQ;
CREATE TABLE MEMBER( 
USERNUM NUMBER PRIMARY KEY, 
NAME VARCHAR2(100) NOT NULL,
ID VARCHAR2(100) UNIQUE,
PW VARCHAR2(100) NOT NULL,
PHONE VARCHAR2(100) NOT NULL,
EMAIL VARCHAR2(100) UNIQUE NOT NULL,
ADDR VARCHAR2(100) NOT NULL,
ZONECODE VARCHAR2(100) NOT NULL,
ENABLEDDB VARCHAR2(100) NOT NULL,
ROLE VARCHAR2(100) NOT NULL,
JOINDATE DATE NOT NULL,
PERPAY VARCHAR2(10),
CONSTRAINT CON_PERPAY CHECK (PERPAY IN ('Y','N')),
CONSTRAINT CON_ENABLED CHECK (ENABLEDDB IN ('Y','N')),
CONSTRAINT CON_ROLE CHECK (ROLE IN ('ROLE_ADMIN','ROLE_USER'))
);


-- 동물보호센터 테이블
CREATE TABLE ANIMAL_SHELTER(
	AREA VARCHAR2(1000) NOT NULL,
	CENTERNAME VARCHAR2(1000) NOT NULL,
	PHONENUMBER VARCHAR2(100) NOT NULL,
	CENTERADDR VARCHAR2(1000) NOT NULL
);
-- 멸종위기 동물 CSV 파일 테이블
CREATE TABLE ANIMAL_ENDANGERED_CSV(
	GROUPS VARCHAR2(1000) NOT NULL, -- 분류군(포유류, 어류, ...) 
	GRADE VARCHAR2(1000) NOT NULL, -- 멸종위기 등급(I, II)
	KOR_NAME VARCHAR2(1000) NOT NULL, -- 국명(늑대)
	ENG_NAME VARCHAR2(1000) NOT NULL, -- 학명(Canis lupus coreanus)
	-- 절멸(EX), 야생절멸(EW), 지역절멸(RE), 위급(CR), 위기(EN), 취약(VU), 준위협(NT), 관심대상(LC), 정보부족(DD), 미평가(NE), 미적용(NA)
	KOR_RED_LIST VARCHAR2(1000), -- 국가적색목록
	ENG_RED_LIST VARCHAR2(1000) -- 세계자연보전연맹
);
-- 멸종위기 동물 IMG 테이블
CREATE TABLE ANIMAL_ENDANGERED_IMG(
	KOR_NAME VARCHAR2(1000) NOT NULL, -- 국명(늑대)
	IMG VARCHAR2(1000) NOT NULL -- 이미지 경로(https://....)
);
-- 멸종위기 CSV & IMG 테이블 JOIN 한 테이블
CREATE TABLE ANIMAL_ENDANGERED_JOIN(
	GROUPS VARCHAR2(1000) NOT NULL,
	GRADE VARCHAR2(1000) NOT NULL,
	KOR_NAME VARCHAR2(1000) NOT NULL,
	ENG_NAME VARCHAR2(1000) NOT NULL,
	KOR_RED_LIST VARCHAR2(1000) NOT NULL,
	ENG_RED_LIST VARCHAR2(1000) NOT NULL,
	IMG VARCHAR2(1000) NOT NULL
);
-- 생태계 교란종
CREATE TABLE ANIMAL_ALIEN_DISTURB(
	KOR_NAME VARCHAR2(1000),
	ENG_NAME VARCHAR2(1000),
	GROUPS VARCHAR2(1000), -- 분류군(식물, 어류, 곤충, ...)
	MANAGEMENT VARCHAR2(1000), -- 관리현황(외래생물, 생태계 교란 생물)
	COUNTRY VARCHAR2(1000), -- 원산지
	IMG VARCHAR2(1000)
);
-- 위해 우려종
CREATE TABLE ANIMAL_ALIEN_HARM(
	KOR_NAME VARCHAR2(1000),
	ENG_NAME VARCHAR2(1000),
	GROUPS VARCHAR2(1000),
	MANAGEMENT VARCHAR2(1000),
	IMG VARCHAR2(1000)
);


CREATE SEQUENCE CALSEQ;

CREATE TABLE VOLCALENDAR(
	CALNUM NUMBER,
	CALTITLE VARCHAR2(2000),
	CALID VARCHAR2(500),
	CALRECDATE DATE,
	CALRECDATEEND DATE,
	CALVOLUNDATE DATE,
	CALVOLUNDATEEND DATE,
	CALCONTENT VARCHAR2(4000),
	CALRECPEO NUMBER,
	CALNOWPEO NUMBER,
	NOTICE VARCHAR2(2),
	CALDEL VARCHAR2(2),
	CONSTRAINT VOLCALENDAR_CHECK_NOTICE CHECK(NOTICE IN('Y','N')),
	CONSTRAINT VOLCALENDAR_CHECK_CALDEL CHECK(CALDEL IN('Y','N'))
);


CREATE TABLE VOLMEMBER(
	VOLTITLE VARCHAR2(2000),
	VOLID VARCHAR2(500)
);

CREATE SEQUENCE CONLISTSQ;
		
CREATE TABLE CONTESTLIST (
BOARDNO NUMBER PRIMARY KEY,
TITLE VARCHAR2 (100),
REPPIC CLOB,
CONTENT CLOB ,
FORWHO VARCHAR2 (100),
PRIZE VARCHAR2 (100),
STARTDATE DATE, 
ENDDATE DATE,
PARTNUM NUMBER,
SORT VARCHAR2 (100),
REGDATE DATE 
);

CREATE SEQUENCE CON_BOARDNOSQ;
CREATE SEQUENCE CON_GROUPNOSQ; 

CREATE TABLE CONTESTBOARD(
CONLISTNO NUMBER ,
BOARDNO NUMBER PRIMARY KEY,
GROUPNO NUMBER NOT NULL,
GROUPSQ NUMBER NOT NULL,
REPLYNO NUMBER ,
LIKERATE NUMBER(2,1),
LIKECNT NUMBER,
WRITER VARCHAR2(2000) NOT NULL,
TITLE VARCHAR2(3000),
REPPIC CLOB,
CONTENT CLOB,
REGDATE DATE NOT NULL,
CONSTRAINT CON_REF FOREIGN KEY(CONLISTNO) REFERENCES CONTESTLIST(BOARDNO) ON DELETE CASCADE,
CONSTRAINT CHECHSTAR CHECK (LIKERATE BETWEEN 0 AND 5)
);



CREATE TABLE STAR_RECORD(
USERNUM NUMBER ,
BOARDNO NUMBER,
STARRATE NUMBER,
CONSTRAINT STARUSER_REF FOREIGN KEY(USERNUM) REFERENCES MEMBER(USERNUM),
CONSTRAINT STARBONO_REF FOREIGN KEY(BOARDNO) REFERENCES CONTESTBOARD(BOARDNO)
);

CREATE SEQUENCE FREESEQ;
CREATE TABLE FREEBOARD(
	FREE_SEQ NUMBER NOT NULL,
	ID VARCHAR2(1000) NOT NULL,
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	FREE_DATE DATE NOT NULL
);

CREATE SEQUENCE FREECOMMENTSEQ;
CREATE TABLE FREECOMMENT (
	COMM_SEQ NUMBER NOT NULL,
	COMM_FREESEQ NUMBER NOT NULL,
	COMM_ID VARCHAR2(1000) NOT NULL,
	COMM_CONTENT VARCHAR2(4000) NOT NULL,
	COMM_DATE DATE NOT NULL
);



CREATE TABLE FUNDINGPAY(
	FUNID VARCHAR2(500),
	FUNTITLE VARCHAR2(2000),
	FUNPAY NUMBER
);


CREATE SEQUENCE FUNSEQ;

CREATE TABLE FUNDING(
	FUN_SEQ NUMBER,
	FUN_ID VARCHAR2(500) NOT NULL,
	FUNTITLE VARCHAR2(2000) PRIMARY KEY NOT NULL,
	GOALMONEY NUMBER NOT NULL,
	NOWMONEY NUMBER,
	FUNDATE DATE NOT NULL,
	PARTICIPANTS NUMBER,
	FUN_CONTENT VARCHAR2(4000),
	NOTICE VARCHAR2(2),
	CONSTRAINT FUNDING_CHECK_NOTICE CHECK(NOTICE IN('Y','N'))
);


CREATE TABLE AREA_TRASH(
REPYEAR NUMBER,
AREA VARCHAR2(100),
AMOUNT NUMBER
);

CREATE TABLE AREA_WATER(
REPYEAR NUMBER,
AREA VARCHAR2(100),
AMOUNT NUMBER 
);


CREATE TABLE AREA_AIR(
REPYEAR NUMBER,
AREA VARCHAR2(100),
AMOUNT NUMBER
);

CREATE TABLE SORTGAME(
USERID VARCHAR2(100),
TAKETIME NUMBER,
CORRECTCNT NUMBER,
SCORE NUMBER
);

CREATE TABLE TRASH (
	IMGREF VARCHAR2(1000),
	TRASHNAME VARCHAR2(1000) NOT NULL,
	TRASHLIFE VARCHAR2(1000) NOT NULL
);
