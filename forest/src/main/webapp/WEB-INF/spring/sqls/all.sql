/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP SEQUENCE USERSEQ;

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

SELECT * FROM MEMBER;
/**********************************/
/* Table Name: 자유게시판 */
/**********************************/
DROP TABLE FREEBOARD;
DROP SEQUENCE FREESEQ;

CREATE SEQUENCE FREESEQ;
CREATE TABLE FREEBOARD(
	FREE_SEQ NUMBER NOT NULL,
	ID VARCHAR2(1000) NOT NULL,
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	FREE_DATE DATE NOT NULL
);

SELECT * FROM FREEBOARD;

DROP TABLE FREECOMMENT;
DROP SEQUENCE FREECOMMENTSEQ;

CREATE SEQUENCE FREECOMMENTSEQ;
CREATE TABLE FREECOMMENT (
	COMM_SEQ NUMBER NOT NULL,
	COMM_FREESEQ NUMBER NOT NULL,
	COMM_ID VARCHAR2(1000) NOT NULL,
	COMM_CONTENT VARCHAR2(4000) NOT NULL,
	COMM_DATE DATE NOT NULL
);

SELECT * FROM FREECOMMENT;
/**********************************/
/* Table Name: 공모게시판 */
/**********************************/
DROP TABLE CONTESTLIST CASCADE CONSTRAINT;
DROP SEQUENCE CONLISTSQ;

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

SELECT * FROM CONTESTLIST;

DROP SEQUENCE CON_BOARDNOSQ;
DROP SEQUENCE CON_GROUPNOSQ;
DROP TABLE CONTESTBOARD CASCADE CONSTRAINT;

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

DROP TABLE STAR_RECORD;

CREATE TABLE STAR_RECORD(
USERNUM NUMBER ,
BOARDNO NUMBER,
STARRATE NUMBER
);
SELECT * FROM STAR_RECORD;
/**********************************/
/* Table Name: 달력 */
/**********************************/
DROP TABLE VOLCALENDAR;
DROP SEQUENCE CALSEQ;

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

SELECT * FROM VOLCALENDAR;

DROP TABLE VOLMEMBER;

CREATE TABLE VOLMEMBER(
	VOLTITLE VARCHAR2(2000),
	VOLID VARCHAR2(500)
);

SELECT * FROM VOLMEMBER;
/**********************************/
/* Table Name: 후원게시판 */
/**********************************/
DROP TABLE FUNDINGPAY;

CREATE TABLE FUNDINGPAY(
	FUNID VARCHAR2(500),
	FUNTITLE VARCHAR2(2000),
	FUNPAY NUMBER
);

SELECT * FROM FUNDINGPAY;

DROP TABLE FUNDING;
DROP SEQUENCE FUNSEQ;

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

SELECT * FROM FUNDING;
/**********************************/
/* Table Name: 환경오염지도 */
/**********************************/
DROP TABLE AREA_TRASH;               
DROP TABLE AREA_WATER;
DROP TABLE AREA_AIR;

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

SELECT * FROM AREA_TRASH;
SELECT * FROM AREA_WATER;
SELECT * FROM AREA_AIR;
/**********************************/
/* Table Name: 동물관련 테이블 */
/**********************************/

-- 멸종위기 동물 CSV 
DROP TABLE ANIMAL_ENDANGERED_CSV;

CREATE TABLE ANIMAL_ENDANGERED_CSV(
	GROUPS VARCHAR2(1000) NOT NULL, -- 분류군(포유류, 어류, ...) 
	GRADE VARCHAR2(1000) NOT NULL, -- 멸종위기 등급(I, II)
	KOR_NAME VARCHAR2(1000) NOT NULL, -- 국명(늑대)
	ENG_NAME VARCHAR2(1000) NOT NULL, -- 학명(Canis lupus coreanus)
	-- 절멸(EX), 야생절멸(EW), 지역절멸(RE), 위급(CR), 위기(EN), 취약(VU), 준위협(NT), 관심대상(LC), 정보부족(DD), 미평가(NE), 미적용(NA)
	KOR_RED_LIST VARCHAR2(1000), -- 국가적색목록
	ENG_RED_LIST VARCHAR2(1000) -- 세계자연보전연맹
);

SELECT * FROM ANIMAL_ENDANGERED_CSV;

-- 멸종위기 동물 IMG
DROP TABLE ANIMAL_ENDANGERED_IMG; 

CREATE TABLE ANIMAL_ENDANGERED_IMG(
	KOR_NAME VARCHAR2(1000) NOT NULL, -- 국명(늑대)
	IMG VARCHAR2(1000) NOT NULL -- 이미지 경로(https://....)
);

SELECT * FROM ANIMAL_ENDANGERED_IMG;
-- 멸종위기 동물 CSV,IMG Join한 테이블
DROP TABLE ANIMAL_ENDANGERED_JOIN; 

CREATE TABLE ANIMAL_ENDANGERED_JOIN(
	GROUPS VARCHAR2(1000) NOT NULL,
	GRADE VARCHAR2(1000) NOT NULL,
	KOR_NAME VARCHAR2(1000) NOT NULL,
	ENG_NAME VARCHAR2(1000) NOT NULL,
	KOR_RED_LIST VARCHAR2(1000) NOT NULL,
	ENG_RED_LIST VARCHAR2(1000) NOT NULL,
	IMG VARCHAR2(1000) NOT NULL
);

SELECT * FROM ANIMAL_ENDANGERED_JOIN ORDER BY KOR_NAME;
-- 생태계 교란종
DROP TABLE ANIMAL_ALIEN_DISTURB;

CREATE TABLE ANIMAL_ALIEN_DISTURB(
	KOR_NAME VARCHAR2(1000),
	ENG_NAME VARCHAR2(1000),
	GROUPS VARCHAR2(1000), -- 분류군(식물, 어류, 곤충, ...)
	MANAGEMENT VARCHAR2(1000), -- 관리현황(외래생물, 생태계 교란 생물)
	COUNTRY VARCHAR2(1000), -- 원산지
	IMG VARCHAR2(1000)
);

SELECT * FROM ANIMAL_ALIEN_DISTURB;
-- 위해 우려종
DROP TABLE ANIMAL_ALIEN_HARM; 

CREATE TABLE ANIMAL_ALIEN_HARM(
	KOR_NAME VARCHAR2(1000),
	ENG_NAME VARCHAR2(1000),
	GROUPS VARCHAR2(1000),
	MANAGEMENT VARCHAR2(1000),
	IMG VARCHAR2(1000)
);

SELECT * FROM ANIMAL_ALIEN_HARM;
/**********************************/
/* Table Name: 쓰레기 테이블 */
/**********************************/
DROP TABLE TRASH;

CREATE TABLE TRASH (
	IMGREF VARCHAR2(1000),
	TRASHNAME VARCHAR2(1000) NOT NULL,
	TRASHLIFE VARCHAR2(1000) NOT NULL
);

SELECT * FROM TRASH;
/**********************************/
/* Table Name: 분리수거게임 테이블 */
/**********************************/
DROP TABLE SORTGAME;

CREATE TABLE SORTGAME(
USERID VARCHAR2(100),
TAKETIME NUMBER,
CORRECTCNT NUMBER,
SCORE NUMBER
);

SELECT * FROM SORTGAME;



