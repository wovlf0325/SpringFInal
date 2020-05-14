CREATE SEQUENCE BOARD_SEQ;
CREATE TABLE BOARD(
	BOARD_NO NUMBER PRIMARY KEY, --번호
	BOARD_WRITER VARCHAR2(30) REFERENCES MEMBER(MEMBER_ID), --작성자
	BOARD_TITLE VARCHAR2(30) NOT NULL, --제목
	BOARD_CONTENT VARCHAR2(3000) NOT NULL, --내용
	BOARD_REGDATE DATE NOT NULL, --작성일
	BOARD_VIEWS NUMBER DEFAULT 0 NOT NULL, --조회수
	BOARD_LIKE NUMBER DEFAULT 0 NOT NULL, --좋아요
	BOARD_KIND NUMBER NOT NULL --종류
);

INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','제목','내용용',SYSDATE,0,0,1);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','유진','유진',SYSDATE,0,0,1);

INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','공지사항','공지사항',SYSDATE,0,0,2);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','자유게시판','자유게시판',SYSDATE,0,0,3);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','불만사항','불만사항',SYSDATE,0,0,4);
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'admin','카풀리스트','카풀리스트',SYSDATE,0,0,5);




SELECT * FROM BOARD;

--페이징+제목검색        
SELECT B.*
FROM (SELECT A.*, ROWNUM AS RNUM
FROM (SELECT * FROM BOARD WHERE BOARD_TITLE LIKE '%'||'유진'||'%' ORDER BY BOARD_NO DESC) A)B
WHERE RNUM BETWEEN 1 AND 10;

--페이징+작성자검색        
SELECT B.*
FROM (SELECT A.*, ROWNUM AS RNUM
FROM (SELECT * FROM BOARD WHERE BOARD_WRITER LIKE '%'||'admin'||'%' ORDER BY BOARD_NO DESC) A)B
WHERE RNUM BETWEEN 1 AND 10; --START, END

--페이징+(제목+내용)검색        
SELECT B.*
FROM (SELECT A.*, ROWNUM AS RNUM
FROM (SELECT * FROM BOARD WHERE BOARD_TITLE LIKE '%'||'유진'||'%' OR (BOARD_CONTENT LIKE '%'||'내용용'||'%') ORDER BY BOARD_NO DESC) A)B
WHERE RNUM BETWEEN 1 AND 10;
        
--1~10까지의 게시물(페이징 쿼리)       
SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM BOARD ORDER BY BOARD_NO DESC) A) B
		WHERE RNUM BETWEEN 1 AND 10;      
                
--제목이 ' '에 해당하는 게시물의 갯수                
SELECT COUNT(BOARD_NO)
FROM BOARD
WHERE BOARD_NO>0
AND BOARD_TITLE LIKE '%'||'유진'||'%';

ALTER TABLE BOARD RENAME COLUMN BOARD_KIND TO BOARD_CATEGORY;

SELECT COUNT(BOARD_NO)
		FROM BOARD WHERE BOARD_CATEGORY = 1 AND BOARD_TITLE LIKE '유진' AND BOARD_NO > 0;