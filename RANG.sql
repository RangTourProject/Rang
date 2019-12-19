--------------------관리자 계정에서 할것들 ---------------------------------------
-- CREATE USER RANG IDENTIFIED BY RANG;

-- GRANT CONNECT, RESOURCE TO RANG;
-- 프로젝트 이름 : RANG
-- 아이디 : RANG
-- 비번 :   RANG
-- 으로 하세욥.
----------------------- 회원테이블 ----------------------------------------------
CREATE TABLE MEMBER (
                        USERNO NUMBER PRIMARY KEY,      -- 회원 번호
                        EMAIL VARCHAR2(30) UNIQUE,      -- 회원 이메일
                        USERNAME VARCHAR2(30) NOT NULL, -- 회원 이름
                        PASSWORD VARCHAR2(1000) NOT NULL, -- 회원 비밀번호
                        NICKNANE VARCHAR2(30) NOT NULL,  -- 닉네임
                        BIRTHDATE DATE NOT NULL,         -- 생년월일
                        ZIPCODE VARCHAR2(100) NOT NULL,  -- 우편번호
                        ADDRESS VARCHAR2(300) NOT NULL,  -- 회원 주소
                        PHONE VARCHAR2(20) NOT NULL ,    -- 회원 전화번호
                        ENROLLDATE DATE DEFAULT SYSDATE, -- 가입일
                        STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN ('Y', 'N')), -- 탈퇴여부
                        GRADE  CHAR(1) DEFAULT 1 CHECK (GRADE IN (0, 1))
);

------------------------ 회원 시퀀스 ----------------------------------------------
CREATE SEQUENCE SEQ_MEM;  --회원 번호 시퀀스

------------------------ 메인 게시글 ----------------------------------------------
CREATE TABLE MBOARD (
    MBNO NUMBER PRIMARY KEY ,            -- 게시글 번호
    USERNO NUMBER ,                      -- 회원 번호
    WRITER VARCHAR2(30) NOT NULL ,       -- 작성자
    MBTITLE VARCHAR2(200) NOT NULL ,     -- 게시글 제목
    MBCONTENT VARCHAR2(3000) NOT NULL ,  -- 게시글 내용
    HASHTAG VARCHAR2(500) ,              -- 해쉬태그
    LOCATIONNAME VARCHAR2(100),          -- 여행지명
    TOTALCOST NUMBER ,                   -- 총 비용
    MBCOUNT NUMBER DEFAULT 0,            -- 게시글 조회수
    MBFILE VARCHAR2(900) ,               -- 첨부파일
    MBDATE DATE DEFAULT SYSDATE,         -- 게시글 작성 날짜
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN ('Y', 'N')), -- 게시글 삭제 여부
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO) -- 외래키 
);

-------------------------- 메인 게시글 시퀀스 -----------------------------------------
CREATE SEQUENCE SEQ_MB;  -- 메인 게시글 번호 시퀀스

--------------------------  너랑나랑 게시글 -------------------------------------------
CREATE TABLE TBOARD (
    TBNO NUMBER PRIMARY KEY ,            -- 게시글 번호
    USERNO NUMBER ,                      -- 회원 번호
    WRITER VARCHAR2(30) NOT NULL ,       -- 작성자
    TBTITLE VARCHAR2(200) NOT NULL ,     -- 게시글 제목
    TBCONTENT VARCHAR2(3000) NOT NULL ,  -- 게시글 내용
    MAXMEMBER NUMBER DEFAULT 1,          -- 최대 참여인원
    TBCOUNT NUMBER DEFAULT 0,            -- 게시글 조회수
    TBFILE VARCHAR2(900) ,               -- 첨부파일
    TBDATE DATE DEFAULT SYSDATE,         -- 게시글 작성 날짜
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN ('Y', 'N')), -- 게시글 삭제 여부
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO) -- 회원 번호 참조 
);

--------------------------- 너랑나랑 게시글 시퀀스 ----------------------------------------
CREATE SEQUENCE SEQ_TB; -- 너랑나랑 게시글 번호 시퀀스

--------------------------- 메인 게시글 댓글 ---------------------------------------------
CREATE TABLE MCOMMENT(
    MCNO NUMBER PRIMARY KEY,           -- 댓글 번호
    MBNO NUMBER ,                      -- 메인 게시글 번호
    USERNO NUMBER ,                    -- 회원 번호
    MCCONTENT VARCHAR2(1000) NOT NULL, -- 댓글 내용
    MCDATE DATE DEFAULT SYSDATE,       -- 댓글 작성 날짜
    MCLEVEL NUMBER ,                   -- 댓글 순번
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N')), -- 메인 게시글 댓글 삭제여부
    REF_MCNO NUMBER ,                  -- 참조할 댓글 번호
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),  -- 회원 번호 참조
    FOREIGN KEY (MBNO) REFERENCES MBOARD (MBNO)     -- 메인 게시글 참조
);

------------------------- 메인 게시글 댓글 시퀀스 ----------------------------------------
CREATE SEQUENCE SEQ_MC;  -- 메인 게시글 댓글 번호 시퀀스

------------------------- 너랑나랑 게시글 댓글 --------------------------------------------
CREATE TABLE TCOMMENT(
    TCNO NUMBER PRIMARY KEY,           -- 댓글 번호
    TBNO NUMBER ,                      -- 너랑나랑 게시글 번호
    USERNO NUMBER ,                    -- 회원 번호
    TCCONTENT VARCHAR2(1000) NOT NULL, -- 댓글 내용
    TCDATE DATE DEFAULT SYSDATE,       -- 댓글 작성 날짜
    TCLEVEL NUMBER ,                   -- 댓글 순번
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N')), -- 너랑나랑 게시글 댓글 삭제여부
    REF_TCNO NUMBER ,                  -- 참조할 댓글 번호
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),  -- 회원 번호 참조
    FOREIGN KEY (TBNO) REFERENCES TBOARD (TBNO)      -- 너랑나랑 게시글 참조
);

------------------------- 너랑나랑 게시글 댓글 시퀀스 -------------------------------------
CREATE SEQUENCE SEQ_TC; -- 너랑나랑 게시글 댓글 번호 시퀀스

------------------------- 메인 게시글 파일 저장용 --------------------------------------------
CREATE TABLE MATTACHMENT(
    MFNO NUMBER ,                       -- 파일 번호
    MBNO NUMBER ,                       -- 메일 게시글 번호
    USERNO NUMBER ,                     -- 회원 번호
    MORIGINNAME VARCHAR2(2000),         -- 저장된 파일명
    MCHANGENAME VARCHAR2(2000),         -- 변경된 파일명
    UPLOADDATE DATE DEFAULT SYSDATE ,   -- 업로드 날짜
    MFILEPATH VARCHAR2(600),            -- 메인 게시글 파일 저장 경로
    MFLEVEL NUMBER ,                    -- 메인 게시글 파일 순번
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N')), -- 메인 게시글 파일 삭제 유무
    FOREIGN KEY (MBNO) REFERENCES MBOARD(MBNO),     -- 메인 게시글 참조
    FOREIGN KEY (USERNO) REFERENCES MEMBER(USERNO)  -- 회원 번호 참조
);

------------------------- 메인 게시글 파일 시퀀스 ------------------------------------------
CREATE SEQUENCE SEQ_MF; -- 메인 게시글 파일 번호 시퀀스

-------------------------- 너랑나랑 게시글 파일 저장용 --------------------------------------
CREATE TABLE TATTACHMENT(
    TFNO NUMBER ,                       -- 파일 번호
    TBNO NUMBER ,                       -- 너랑나랑 게시글 번호
    USERNO NUMBER ,                     -- 회원 번호
    TORIGINNAME VARCHAR2(2000),         -- 저장된 파일명
    TCHANGENAME VARCHAR2(2000),         -- 변경된 파일명
    UPLOADDATE DATE DEFAULT SYSDATE ,   -- 업로드 날짜
    TFILEPATH VARCHAR2(600),            -- 너랑나랑 게시글 파일 저장 경로
    TFLEVEL NUMBER ,                    -- 너랑나랑 게시글 파일 순번
    STATUS CHAR(1) DEFAULT 'N' CHECK (STATUS IN('Y', 'N')), -- 너랑나랑 게시글 파일 삭제 유무
    FOREIGN KEY (TBNO) REFERENCES TBOARD(TBNO),     -- 너랑나랑 게시글 참조
    FOREIGN KEY (USERNO) REFERENCES MEMBER(USERNO)  -- 회원 번호 참조
);

------------------------- 너랑나랑 게시글 파일 시퀀스 ------------------------------------------
CREATE SEQUENCE SEQ_TF; -- 너랑나랑 게시글 파일 번호 시퀀스

-------------------------------- 회원 취향 -------------------------------------------------
CREATE TABLE MEMBERFAVORITE(
    USERNO NUMBER ,                 -- 회원 번호
    TYPE NUMBER PRIMARY KEY,        -- 취향 번호 
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO) -- 회원 번호 참조
);

------------------------------- 여행 취향 -------------------------------------------------
CREATE TABLE TRAVELTYPE (
    TYPE NUMBER ,                    -- 취향 번호
    TYPENAME VARCHAR2(30) NOT NULL , -- 취향 이름
    FOREIGN KEY (TYPE) REFERENCES MEMBERFAVORITE (TYPE) -- 취향 번호 참조
);

--------------------------------- 플래너 --------------------------------------------------
CREATE TABLE PLANNER(
    USERNO NUMBER ,              -- 회원 번호
    STARTDATE DATE NOT NULL,     -- 시작일
    ENDDATE DATE NOT NULL,       -- 마지막 날
    TITLE VARCHAR2(100) NOT NULL, -- 플랜 제목
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO) -- 회원 번호 참조
);

-------------------------------- 좋아요 꾸욱 --------------------------------------------
CREATE TABLE ILIKE (
    USERNO NUMBER ,
    MBNO NUMBER ,
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),
    FOREIGN KEY (MBNO) REFERENCES MBOARD (MBNO)  
);

------------------------------ 팔로우 팔로워 --------------------------------------------
CREATE TABLE FOLLOW (
    FOLLOWER NUMBER ,     -- 팔로워 
    FOLLOWING NUMBER,     -- 팔로잉 
    FOREIGN KEY (FOLLOWER) REFERENCES MEMBER (USERNO), -- 회원 번호 참조
    FOREIGN KEY (FOLLOWING) REFERENCES MEMBER (USERNO) -- 회원 번호 참조
);

------------------------------ MB 스크랩 ----------------------------------------------
CREATE TABLE MBSCRAP(
    USERNO NUMBER ,         -- 회원 번호
    MBNO NUMBER ,           -- 메인 게시글 번호
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO), -- 회원 번호 참조
    FOREIGN KEY (MBNO) REFERENCES MBOARD (MBNO)      -- 메인 게시글 번호 참조
);

------------------------------ TB 스크랩 ----------------------------------------------
CREATE TABLE TBSCRAP(
    USERNO NUMBER ,         -- 회원 번호
    TBNO NUMBER ,           -- 너랑나랑 게시글 번호 
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO), -- 회원 번호 참조
    FOREIGN KEY (TBNO) REFERENCES TBOARD (TBNO)      -- 너랑나랑 게시글 번호 참조
);

-------------------------------- 지 도 ------------------------------------------------
CREATE TABLE MAP (
    USERNO NUMBER,            -- 회원 번호
    LAT NUMBER ,              -- 위도
    LNG NUMBER ,              -- 경도
    CITYNAME VARCHAR2(100),   -- 도시 이름
    MEMO VARCHAR2(300),       -- 메모
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO)   -- 회원 번호 참조
);

------------------------------ 너랑나랑 참여인원 ----------------------------------------
CREATE TABLE TBOARDMEMBER(
    USERNO NUMBER ,            -- 회원 번호
    TBNO NUMBER ,              -- 너랑나랑 게시글 번호 
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),-- 회원 번호 참조
    FOREIGN KEY (TBNO) REFERENCES TBOARD (TBNO)     -- 너랑나랑 게시글 번호 참조
);

---------------------------- 너랑나랑 신고하기 -------------------------------------------
CREATE TABLE TBREPORT(
    USERNO NUMBER ,            -- 회원 번호
    TBNO NUMBER ,              -- 너랑나랑 게시글 번호 
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),-- 회원 번호 참조
    FOREIGN KEY (TBNO) REFERENCES TBOARD (TBNO)     -- 너랑나랑 게시글 번호 참조    
);

--------------------------- 메인 게시글 신고하기 ----------------------------------------
CREATE TABLE MBREPORT(
    USERNO NUMBER ,            -- 회원 번호
    MBNO NUMBER ,              -- 메인 게시글 번호 
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO),-- 회원 번호 참조
    FOREIGN KEY (MBNO) REFERENCES MBOARD (MBNO)     -- 메인 게시글 번호 참조  
);

--------------------------- 메인 게시글 댓글 신고하기 ----------------------------------------------
CREATE TABLE MCREPORT(
    MCNO NUMBER ,               -- 메인 게시글 댓글 번호
    USERNO NUMBER,             -- 회원 번호
    MBNO NUMBER,               -- 메인 게시글 번호  
    FOREIGN KEY (MCNO) REFERENCES MCOMMENT (MCNO),    -- 메인 게시글 댓글 번호 참조
    FOREIGN KEY (USERNO) REFERENCES Member (USERNO), -- 회원 번호 참조
    FOREIGN KEY (MBNO) REFERENCES MBOARD (MBNO)     -- 메인 게시글 번호 참조
);

-------------------------- 너랑나랑 게시글 댓글 신고하기 --------------------------------------
CREATE TABLE TCREPORT(
    USERNO NUMBER,             -- 회원 번호
    TBNO NUMBER,               -- 너랑나랑 게시글 번호
    TCNO NUMBER,               -- 너랑나랑 게시글 댓글 번호
    FOREIGN KEY (USERNO) REFERENCES MEMBER (USERNO), -- 회원 번호 참조
    FOREIGN KEY (TBNO) REFERENCES TBOARD (TBNO),     -- 너랑나랑 게시글 번호 참조
    FOREIGN KEY (TCNO) REFERENCES TCOMMENT (TCNO)    -- 너랑나랑 게시글 댓글 번호 참조    
);


















