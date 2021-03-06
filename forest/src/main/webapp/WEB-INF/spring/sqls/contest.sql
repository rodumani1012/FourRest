------------------------------------------------------공모전 LIST 테이블 
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
------------------------------------------------------공모 게시글 테이블 
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

-----------------------------------------------------------------------------별점주기중복방지위한 table
DROP TABLE STAR_RECORD;
CREATE TABLE STAR_RECORD(
USERNUM NUMBER ,
BOARDNO NUMBER,
STARRATE NUMBER
);
SELECT * FROM STAR_RECORD;
---------------------------------------------------------------------------- data 넣기용 
--공모전게시글
INSERT INTO CONTESTLIST VALUES(CONLISTSQ.NEXTVAL,'2100년 기후를 체험하자','<img src="resources/defaultdata/go01.jpg" alt="공모전">'
,'<img src="http://ideananumso.com/upload/contest/poster/idlabs_poster_20180514091508.png" alt="공모전"><br>2100년 지구와 우리의 모습을 다양한 방법으로 표현해주세요'
,'대학교재학생','총100만원/기상청장상','20190725','20190909',0,'영상/사진',SYSDATE);
INSERT INTO CONTESTLIST VALUES(CONLISTSQ.NEXTVAL,'우수환경도서 독후감공모','<img src="resources/defaultdata/go02.jpg" alt="공모전">'
,'<img src="http://www.me.go.kr/upload/2/editor/201907/24/20190724171326.jpg" alt="공모사진"><br>환경부에서 선정한 우수환경도서(860)중 택 1'
,'전국 초등학생/중고등학생/일반인','총 250만원','20190725','20190903',0,'글',SYSDATE);
INSERT INTO CONTESTLIST VALUES(CONLISTSQ.NEXTVAL,'CON_TEST_TITLE','<img src="resources/defaultdata/go03.png" alt="공모전">'
,'<img src="http://postfiles4.naver.net/MjAxOTA0MTlfMjgx/MDAxNTU1NjQ4NzM2NTkx.ELu8URjqQaLfIY8WIvuPtlWg3Vq1WdF7Cv8lRW5_O_Ig.9kwyq3UpRo7GqQWxNicsLlJmIE-Mlkce_wISPrtC8hEg.PNG.mesns/0419_%EA%B3%B5%EB%AA%A8%EC%A0%84_%EC%8D%B8%EB%84%A4%EC%9D%BC.png?type=w966" alt="공모사진"><br>종료된 공모전입니다.'
,'제한없음','100만원','20190725','20190801',0,'영상/사진',SYSDATE);
INSERT INTO CONTESTLIST VALUES(CONLISTSQ.NEXTVAL,'전국환경사진공모전','<img src="resources/defaultdata/go04.jpg" alt="공모전">'
,'<img src="http://cfile207.uf.daum.net/image/264BF444532BC79B302886" alt="공모사진" ><br>환경 훼손현장및 보전을위한노력 ,자연과 인간의조화 ,우리나라의 아름다운 자연경관'
,'대학교재학생','100만원','20190725','20191002',0,'영상/사진',SYSDATE);

--공모출품data
INSERT INTO CONTESTBOARD VALUES(1,CON_BOARDNOSQ.NEXTVAL,CON_GROUPNOSQ.NEXTVAL,1,0,0,0,'TEST작성자','TESTTITLE','<img src="https://t1.daumcdn.net/cfile/tistory/214A374A524CEF0A0E">','<img src="https://t1.daumcdn.net/cfile/tistory/214A374A524CEF0A0E"><br>베스킨라빈스',SYSDATE);
