/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE MEMBER;
DROP SEQUENCE USERSEQ;
CREATE SEQUENCE USERSEQ;
CREATE TABLE MEMBER( 
USERNUM NUMBER PRIMARY KEY, 
NAME VARCHAR2(100) NOT NULL,
ID VARCHAR2(100) NOT NULL,
PW VARCHAR2(100) NOT NULL,
PHONE VARCHAR2(100) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
ADDR VARCHAR2(100) NOT NULL,
ZONECODE VARCHAR2(100) NOT NULL,
ENABLED INTEGER NOT NULL,
ROLE VARCHAR2(100) NOT NULL,
CONSTRAINT CON_ROLE CHECK (ROLE IN ('ADMIN','USER'))
);

INSERT INTO MEMBER VALUES(USERSEQ.NEXTVAL,'관리자','admin','admin123','010-7723-7077',
'brooke1994@naver.com','서초구 역삼동','120-10',1,'ADMIN');
INSERT INTO MEMBER VALUES(USERSEQ.NEXTVAL,'user1','user1','user123','010-7777-7077',
'alice1994@naver.com','강남구 개포동','25-18',1,'USER');
INSERT INTO MEMBER VALUES(USERSEQ.NEXTVAL,'user2','user2','user123','010-7777-7077',
'alice1994@naver.com','강남구 개포동','25-18',0,'USER');


SELECT * FROM MEMBER;
SELECT * FROM AUTHORITIES
COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PW is '비밀번호';
COMMENT ON COLUMN MEMBER.ENABLED is '계정사용여부';


ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (username);

/**********************************/
/* Table Name: 권한 */
/**********************************/
DROP TABLE authorities
CREATE TABLE AUTHORITIES(
		ID                      		VARCHAR2(20)		 NOT NULL,
		AUTHORITY                     		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE AUTHORITIES is '권한';
COMMENT ON COLUMN AUTHORITIES.ID is '회원아이디';
COMMENT ON COLUMN AUTHORITIES.AUTHORITY is '권한';
select * from AUTHORITIES

ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_PK PRIMARY KEY (username, authority);
ALTER TABLE authorities ADD CONSTRAINT IDX_authorities_FK0 FOREIGN KEY (username) REFERENCES users (username);

/**********************************/
/* Table Name: 그룹 */
/**********************************/
CREATE TABLE groups(
		id                            		VARCHAR2(20)		 NOT NULL,
		group_name                    		VARCHAR2(20)		 NULL 
);

COMMENT ON TABLE groups is '그룹';
COMMENT ON COLUMN groups.id is '그룹 아이디';
COMMENT ON COLUMN groups.group_name is '그룹 명';


ALTER TABLE groups ADD CONSTRAINT IDX_groups_PK PRIMARY KEY (id);

/**********************************/
/* Table Name: 그룹 권한 관계 */
/**********************************/
CREATE TABLE group_authorities(
		group_id                      		VARCHAR2(20)		 NOT NULL,
		authority                     		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE group_authorities is '그룹 권한 관계';
COMMENT ON COLUMN group_authorities.group_id is '그룹 아이디';
COMMENT ON COLUMN group_authorities.authority is '권한';


ALTER TABLE group_authorities ADD CONSTRAINT IDX_group_authorities_PK PRIMARY KEY (group_id, authority);
ALTER TABLE group_authorities ADD CONSTRAINT IDX_group_authorities_FK0 FOREIGN KEY (group_id) REFERENCES groups (id);

/**********************************/
/* Table Name: 그룹 회원 관계 */
/**********************************/
CREATE TABLE group_members(
		group_id                      		VARCHAR2(20)		 NOT NULL,
		username                      		VARCHAR2(20)		 NOT NULL
);

COMMENT ON TABLE group_members is '그룹 회원 관계';
COMMENT ON COLUMN group_members.group_id is '그룹 아이디';
COMMENT ON COLUMN group_members.username is '회원 아이디';


ALTER TABLE group_members ADD CONSTRAINT IDX_group_members_PK PRIMARY KEY (group_id, username);
ALTER TABLE group_members ADD CONSTRAINT IDX_group_members_FK0 FOREIGN KEY (username) REFERENCES users (username);
ALTER TABLE group_members ADD CONSTRAINT IDX_group_members_FK1 FOREIGN KEY (group_id) REFERENCES groups (id);


-- 회원 데이터 입력
INSERT INTO users (username, password, enabled) VALUES ('user', '1', 1);
INSERT INTO users (username, password, enabled) VALUES ('admin', '1', 1);

-- 회원 권한 입력
INSERT INTO AUTHORITIES (ID, AUTHORITY) VALUES ('user1', 'ROLE_USER');
INSERT INTO AUTHORITIES (ID, AUTHORITY) VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO AUTHORITIES (ID, AUTHORITY) VALUES ('admin', 'ROLE_USER');

-- 그룹
INSERT INTO groups (id, group_name) VALUES ('G01', '관리자 그룹');
INSERT INTO groups (id, group_name) VALUES ('G02', '사용자 그룹');

-- 그룹 권한
INSERT INTO group_authorities (group_id, authority) VALUES ('G01', 'ROLE_ADMIN');
INSERT INTO group_authorities (group_id, authority) VALUES ('G01', 'ROLE_USER');
INSERT INTO group_authorities (group_id, authority) VALUES ('G02', 'ROLE_USER');

-- 그룹 회원
INSERT INTO group_members (group_id, username) VALUES ('G01', 'admin');
INSERT INTO group_members (group_id, username) VALUES ('G02', 'user');
