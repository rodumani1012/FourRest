DROP TABLE ANIMAL_SHELTER;

-- 동물보호센터 테이블
CREATE TABLE ANIMAL_SHELTER(
	AREA VARCHAR2(1000) NOT NULL,
	CENTERNAME VARCHAR2(1000) NOT NULL,
	PHONENUMBER VARCHAR2(100) NOT NULL,
	CENTERADDR VARCHAR2(1000) NOT NULL
);

SELECT * FROM ANIMAL_SHELTER;

SELECT COUNT(*) FROM ANIMAL_SHELTER;

SELECT * FROM(
	SELECT	ROWNUM RN, a.* 
	FROM(
		(SELECT * FROM ANIMAL_SHELTER ORDER BY AREA )a
		)
	) WHERE RN >=2 AND RN <=5;
	

-- 멸종위기 동물 테이블
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

DROP TABLE ANIMAL_ENDANGERED_IMG;

CREATE TABLE ANIMAL_ENDANGERED_IMG(
	KOR_NAME VARCHAR2(1000) NOT NULL, -- 국명(늑대)
	IMG VARCHAR2(1000) NOT NULL -- 이미지 경로(https://....)
);

SELECT * FROM ANIMAL_ENDANGERED_IMG;

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

SELECT * FROM ANIMAL_ENDANGERED_JOIN;

