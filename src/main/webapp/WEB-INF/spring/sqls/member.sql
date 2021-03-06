select * from PAYMENT;
CREATE SEQUENCE PAYMENT_SEQ;
CREATE TABLE PAYMENT(
	PAYMENT_NO NUMBER PRIMARY KEY,
	MEMBER_NAME  VARCHAR2(128),
	PAYMENT_UID VARCHAR2(128) NOT NULL
);

alter table PAYMENT add PAYMENT_AMOUNT NUMBER;

DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE PAYMENT_SEQ;
DROP TABLE PAYMENT;

SELECT * FROM MEMBER;

CREATE SEQUENCE MEMBER_SEQ;
CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	HOUSE_NO NUMBER,
	MEMBER_ID VARCHAR2(30) UNIQUE NOT NULL,
	MEMBER_PW VARCHAR2(30) NOT NULL,
	MEMBER_EMAIL VARCHAR2(30) UNIQUE NOT NULL,
	MEMBER_NAME VARCHAR2(30) NOT NULL,
	MEMBER_ROLE VARCHAR2(30) NOT NULL,
	MEMBER_AREA VARCHAR2(100),
	MEMBER_INTEREST VARCHAR2(100),
	MEMBER_RATING NUMBER DEFAULT 0,
	MEMBER_IMAGE VARCHAR2(1000),
	MEMBER_DELFLAG VARCHAR2(2) DEFAULT 'N',
	MEMBER_STATUS VARCHAR2(30) DEFAULT '1' NOT NULL
);


SELECT * FROM TAB;
SELECT * FROM HOUSE;
=======
alter table MEMBER add MEMBER_ADDRESS VARCHAR2(30);
alter table MEMBER add MEMBER_PHONE VARCHAR2(30);
alter table MEMBER rename column HOUSE_NO to HOUSE_ID;

SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 0, 'admin', '1234', 'abc@naver.com', '관리자', 'ADMIN', '', '', '', '', 'N', '1');
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 0, 'test', '1234', 'test@naver.com', '테스트', 'TEST', '', '', '', '', 'N', '1');