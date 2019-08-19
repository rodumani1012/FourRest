DROP TABLE VOLCALENDAR;
DROP SEQUENCE CALSEQ;

CREATE SEQUENCE CALSEQ;

CREATE TABLE VOLCALENDAR(
	CALNUM NUMBER,
	CALTITLE VARCHAR2(2000),
	CALID VARCHAR2(500),
	CALRECDATE DATE,
	CALVOLUNDATE DATE,
	CALCONTENT VARCHAR2(4000),
	CALRECPEO NUMBER,
	CALNOWPEO NUMBER,
	NOTICE VARCHAR2(2),
	CALDEL VARCHAR2(2),
	CONSTRAINT VOLCALENDAR_CHECK_NOTICE CHECK(NOTICE IN('Y','N')),
	CONSTRAINT VOLCALENDAR_CHECK_CALDEL CHECK(CALDEL IN('Y','N'))
);

DROP TABLE VOLMEMBER;

CREATE TABLE VOLMEMBER(
	VOLTITLE VARCHAR2(2000),
	VOLID VARCHAR2(500) PRIMARY KEY
);

INSERT INTO VOLMEMBER VALUES ('KH청소하기', 'admin');

SELECT * FROM VOLMEMBER;

INSERT INTO VOLCALENDAR 
VALUES (CALSEQ.NEXTVAL, 'KH청소하기', 'admin', '2019-08-06', '2019-08-20', '같이 청소해요', 20, 0, 'Y', 'Y');

INSERT INTO VOLCALENDAR 
VALUES (CALSEQ.NEXTVAL, 'KH학원청소할까', 'admin', '2019-08-01', '2019-08-25', '같이 청소해봅시다', 30, 0, 'Y', 'Y');

SELECT * FROM VOLCALENDAR;

SELECT CALNUM, CALTITLE, CALID, CALRECDATE, CALVOLUNDATE, CALCONTENT, CALRECPEO, CALNOWPEO FROM VOLCALENDAR;

UPDATE VOLCALENDAR SET CALNOWPEO = CALNOWPEO + 1
WHERE CALTITLE = '강아지 보호소';

UPDATE VOLCALENDAR SET CALDEL = 'Y' WHERE CALTITLE = 'KH청소하기' AND CALID = 'admin'

UPDATE VOLCALENDAR SET CALNOWPEO = (SELECT COUNT(VOLTITLE) FROM VOLMEMBER WHERE VOLTITLE = 'KH청소하기') WHERE CALTITLE = 'KH청소하기';
