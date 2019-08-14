-- 동물보호센터
DROP TABLE ANIMAL_SHELTER; 
-- 멸종위기 동물 CSV 
DROP TABLE ANIMAL_ENDANGERED_CSV; 
-- 멸종위기 동물 IMG
DROP TABLE ANIMAL_ENDANGERED_IMG; 
-- 멸종위기 동물 CSV,IMG Join한 테이블
DROP TABLE ANIMAL_ENDANGERED_JOIN; 
-- 생태계 교란종
DROP TABLE ANIMAL_ALIEN_DISTURB; 
-- 위해 우려종
DROP TABLE ANIMAL_ALIEN_HARM; 

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

SELECT * FROM ANIMAL_SHELTER;
SELECT * FROM ANIMAL_ENDANGERED_CSV;
SELECT * FROM ANIMAL_ENDANGERED_IMG;
SELECT * FROM ANIMAL_ENDANGERED_JOIN ORDER BY KOR_NAME;
SELECT * FROM ANIMAL_ALIEN_DISTURB;
SELECT * FROM ANIMAL_ALIEN_HARM;

SELECT count(*)
FROM ANIMAL_ALIEN_DISTURB
WHERE GROUPS LIKE '식물'



