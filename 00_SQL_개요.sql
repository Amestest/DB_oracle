-- 주석 작성하기 단축키 ctrl + /
/* 여러 주석 작성하기 */

-- cmd 창에서 대표 관리자의 권한으로 SQL 접속 하는 명령어
/*
sqlplus : 오라클 데이터 베이스에서 제공하는 명령줄 도구
sys : 시스템(system) 단축어
as sysdba : 시스템데이터베이스어드민(SYStem DataBase Admin)
설치할 때 작성한 비밀번호 작성하기
비밀번호는 눈에 보이지 않음
*/
sqlplus sys as sysdba;

-- 기존에는 계정을 생성하기 위해 ALTER를 이용해서
-- SCRIPT TRUE로 변경해주었지만 이제는 하지 않아도 됨

/*
ALTER : 어떤 상황을 변경하는 SQL 명령어
SESSION : 사용자가 로그인해서 명령을 실행하고 연결된 상태
SET : 무엇을 변경할 것인지 선택
"_ORACLE_SCRIPT" : DB 코드 작성
TRUE; : 허용하겠다.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 계정 생성 방법
/*
CREATE : 생성하겠다.
USER : 사용자를
아이디명 : 사용자이름
IDENTIFIED BY : 생성한 사용자계정에 대한 비밀번호를 설정하기 위한 코드
비밀번호 : 비밀번호설정
*/
CREATE USER 아이디명 IDENTIFIED BY 비밀번호;

-- 생성된 계정에 접속 + 기본 자원 관리 권한 추가
/*
GRANT : 사용자에게 특정 권한이나 역할을 부여하기 위한 명령어
CONNECT :사용자가 데이터베이스에 접속할 수 있는 권한 부여 
        ->KH T 반에 들어올 수 있는 권한
RESOURCE : 테이블, 인덱스, 뷰 등을 생성할 수 있는 권한
        -> T 반에서 특정 행동이나 만들기 변경 설정 할 수 잇는 권한
이외 여러가지 권한 있음 권한을 여러가지 한 번에 작성할 때는 , 사용해서 작성
TO 아이디명; : 어떤 아이디에 권한을 줄 것인지 설정
*/
GRANT CONNECT, RESOURCE TO 아이디명;

/* 테이블을 생성하기
테이블이란 ? 데이터 베이스 모든 데이터를 포함하는 공간
    테이블명 : 중점이되어 중점과 관련된 내용을 설정할 수 있도록 작성
    
생성하는 방법
CREATE TABLE 테이블명 (컬럼명 데이터타입);
*/

--직원 테이블 생성하기

CREATE TABLE 직원 (직원번호 NUMBER(4), 직원이름 VARCHAR2(10) ; 

/*
데이터 타입
NUMBER : 숫자값
VARCHAR2 : String과 똑같은 문자열
*/

-- 데이터 추가하기 INSERT
/*
데이터를 추가할 때는 INSERT 를 작성해준다.

작성 방법
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, 컬럼명3, ..) 
VALUES (컬럼에 해당하는 값1, 컬럼에 해당하는 값2, 컬럼에 해당하는 값3, ...);
*/

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (1,'홍길동','40','1234567890','2024-05-01');

CREATE TABLE MEMBER 
(
  M_ID NUMBER(10, 0) 
, M_NAME VARCHAR2(255 BYTE) 
, M_AGE VARCHAR2(20 BYTE) 
, M_PHONE VARCHAR2(11 BYTE) 
, M_DATE VARCHAR2(255 BYTE) 
) 

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (2,'박지훈','35','1234567891','2024-05-02');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (3,'김철수','32','1234567892','2024-05-03');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (4,'이영희','37','1234567893','2024-05-04');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (5,'홍길동','29','1234567894','2024-05-05');

INSERT INTO MEMBER (M_ID, M_NAME, M_AGE, M_PHONE, M_DATE) VALUES (6,'정수진','33','1234567895','2024-05-06');


--KH CAFE 추가하기
INSERT INTO KH_CAFE (C_ID, C_NAME,C_ADDRESS,C_PHONE,C_TIME) VALUES(1,'메가커피','서울시 강남구 광남동','02-888-8888','영업시간 : 9:00 ~ 18:00');