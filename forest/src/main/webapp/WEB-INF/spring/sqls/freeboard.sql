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

INSERT INTO FREEBOARD VALUES (FREESEQ.NEXTVAL, 'admin', 'test 중', 'test 중입니다!!!', SYSDATE);

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

INSERT INTO FREECOMMENT VALUES (FREECOMMENTSEQ.NEXTVAL, 1, 'admin', '댓글 test', SYSDATE);

SELECT * FROM FREECOMMENT;


