
CREATE TABLE MEMBER(
	ID VARCHAR2(2000) PRIMARY KEY,
    PW VARCHAR2(2000) NOT NULL,
    NAME VARCHAR2(2000) NOT NULL,
    EMAIL VARCHAR2(2000) NOT NULL,
    PHONE VARCHAR2(2000) NOT NULL,
    ADDRESS VARCHAR2(2000) NOT NULL,
    ADDONE VARCHAR2(2000) NOT NULL,
    DETAILADD VARCHAR2(2000),
    PROFILEIMG VARCHAR2(4000)
);

DROP TABLE MEMBER;
delete from member;
SELECT * FROM MEMBER;
---------------------------------------------------------

DROP SEQUENCE LETTERSEQ;
DROP TABLE LETTER;

CREATE SEQUENCE LETTERSEQ;
CREATE TABLE LETTER(
	LETTERSEQ NUMBER(10) PRIMARY KEY,
	ID VARCHAR2(2000) NOT NULL,        --받는사람
	SENDER VARCHAR2(2000) NOT NULL,        --보내는사람
	LETTERTITLE VARCHAR2(3000) NOT NULL,    --제목
	LETTERCONTENT VARCHAR2(3000) NOT NULL,    --내용
	LETTEREAD NUMBER(10) NOT NULL,    -- 안읽음(1), 읽음(2)
	LETTERTIME DATE DEFAULT SYSDATE,     --보낸시간
	CONSTRAINT FK_LETTER_GETTER FOREIGN KEY(ID)
	REFERENCES MEMBER(ID) ON DELETE CASCADE
);

INSERT INTO LETTER
VALUES(LETTERSEQ.NEXTVAL,'GUEST','DONG','제목테스트','내용테스트',1,sysdate);


SELECT *
		FROM
		(SELECT ROWNUM
     	 , B.*
  	 	 FROM (SELECT A.*
           	   FROM LETTER A
           	   WHERE A.LETTEREAD = 1 AND A.ID = 'GUEST'
           	   ORDER BY A.LETTERSEQ DESC) B)
		WHERE ROWNUM = 1;
		