DROP SEQUENCE LETTER_SEQ;
DROP TABLE LETTER;

CREATE SEQUENCE LETTER_SEQ;
CREATE TABLE LETTER(
	LETTER_NO NUMBER PRIMARY KEY,
	LETTER_TO VARCHAR2(30) REFERENCES MEMBER(MEMBER_ID),
	LETTER_FROM VARCHAR2(30) REFERENCES MEMBER(MEMBER_ID),
	LETTER_TITLE VARCHAR2(100) NOT NULL,
	LETTER_CONTENT VARCHAR2(3000) NOT NULL,
	LETTER_REGDATE DATE NOT NULL,
	LETTER_READ VARCHAR2(2) DEFAULT 'N'
);

INSERT INTO LETTER VALUES(LETTER_SEQ.NEXTVAL, 'admin', 'admin', '제목', '내용', SYSDATE, 'N');
INSERT INTO LETTER VALUES(LETTER_SEQ.NEXTVAL, 'admin', 'test', '제목', '내용', SYSDATE, 'N');

SELECT * FROM LETTER;

SELECT * FROM LETTER WHERE LETTER_TO = 'admin' ORDER BY LETTER_NO DESC;

SELECT * FROM LETTER WHERE LETTER_FROM = 'test' AND LETTER_NO =41;

SELECT B.* FROM ( SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM LETTER WHERE LETTER_READ = 'N' AND LETTER_TO = 'admin' ORDER BY LETTER_NO DESC)A )B WHERE RNUM = 1;
