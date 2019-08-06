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
)


INSERT INTO CONTESTLIST VALUES(CONLISTSQ.NEXTVAL,'CON_TEST_TITLE','<img src="https://www.wevity.com/upload/contest/20190801160538_8dc7885c.jpg" alt="공모전">','공모전1은이런공모전이다'
,'대학교재학생','100만원','20190725','20190902',0,'영상/사진',SYSDATE);

		
SELECT * FROM CONTESTLIST;
------------------------------------------------------공모 게시글 테이블 
DROP SEQUENCE CON_BOARDNOSQ;
DROP SEQUENCE CON_GROUPNOSQ;
DROP TABLE CONTESTBOARD;

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

SELECT * FROM CONTESTBOARD ;

INSERT INTO CONTESTBOARD VALUES(1,CON_BOARDNOSQ.NEXTVAL,CON_GROUPNOSQ.NEXTVAL,1,0,2.333,3,'TEST작성자','TESTTITLE','<img src="https://t1.daumcdn.net/cfile/tistory/214A374A524CEF0A0E" filename="지구 아이스크림.jpg" filemime="image/jpeg">','부연설명',SYSDATE);
delete from contestboard where boardno=1;
SELECT count(*) FROM (SELECT * FROM contestboard WHERE groupsq=1 AND conlistno=1);

UPDATE CONTESTBOARD 
SET LIKECNT = LIKECNT+1 ,LIKERATE = 2.667 WHERE
BOARDNO = 1;


SELECT COUNT(*) AS CNT FROM CONTESTBOARD WHERE GROUPSQ=1;

		INSERT INTO CONTESTBOARD
		VALUES
		(CON_BOARDNOSQ.NEXTVAL,CON_GROUPNOSQ.NEXTVAL,1,0,0,'asd','dd','ww',SYSDATE);
------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
SELECT * FROM CONTESTBOARD;

UPDATE CONTESTBOARD SET LIKECNT = LIKECNT+1 WHERE BOARDNO=5;

SELECT * FROM (SELECT * FROM CONTESTBOARD ORDER BY LIKECNT DESC ) WHERE ROWNUM<=3;

		
		SELECT * FROM ( SELECT ROWNUM RN,a.* FROM CONTESTBOARD a 
		ORDER BY GROUPNO DESC) WHERE RN &gt;=#{begin} AND RN &lt;=#{end}
