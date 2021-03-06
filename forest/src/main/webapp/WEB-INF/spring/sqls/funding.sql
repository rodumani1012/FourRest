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

INSERT INTO FUNDING VALUES (FUNSEQ.NEXTVAL, 'admin', 'TEST FUNDING', 1000, 0, '2019-09-03', 0, '모금 많이 해주세요.', 'Y');
INSERT INTO FUNDING VALUES (FUNSEQ.NEXTVAL, 'admin', 'TEST FUNDING2', 1100, 1300, '2019-09-03', 0, '모금 많이 해주세요.', 'Y');

SELECT * FROM FUNDING;

SELECT FUN_SEQ, FUNTITLE, GOALMONEY, NOWMONEY, FUNDATE, PARTICIPANTS, FUN_CONTENT FROM FUNDING ;

SELECT FUN_SEQ, FUNTITLE, GOALMONEY, NOWMONEY, FUNDATE, PARTICIPANTS, FUN_CONTENT FROM FUNDING WHERE FUNTITLE='TEST FUNDING';

UPDATE FUNDING SET NOWMONEY=0 WHERE FUNTITLE LIKE 'TEST FUNDING';

INSERT INTO FUNDING VALUES (FUNSEQ.NEXTVAL, 'TEST FUNDING', 1000, 0, '2019-09-03', 0, '모금 많이 해주세요.', 'Y')
WHERE 'TEST FUNDING' NOT LIKE (SELECT FUNTITLE FROM FUNDING WHERE FUNTITLE = 'TEST FUNDING');
	
SELECT * FROM FUNDING WHERE FUNTITLE = 'TEST FUNDING';

UPDATE FUNDING SET NOTICE='Y' WHERE FUNTITLE = 'TEST FUNDING' AND FUN_ID = 'admin'

