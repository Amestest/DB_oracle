/*
올림 CHIL
반올림 ROUND
버림 FLOOR
오름차순 ASC(ASCENDING)
내림차순 DESC(DESCENDING)


자료형

NUMBER : 숫자형(정수,실수)
        실수 자리 : 소수자리 몇 번째까지 가능한지
        NUMBER(2,2) -> 0.00 ~ 99.99까지 가능

CHAR(크기) : 고정길이 문자형 -> 현재 사용 거의 하지 않음

VARCHAR : 이전버전 사용 많이 안함
VARCHAR2 : 최신버전 제일 많이 사용
           가변길이 문자형
           
    CHAR VS VARCHAR2
    고정      가변
    
  예를들어 CHAR(10BYTE) VARCHAR2(10BYTE)
        CHAR = 1; ->1하나를 넣는데 10을 모두 사용
        VARCHAR2 = 1; ->1하나를 넣으면 나머지 99를 돌려줌
        
VARCHAR2같은 경우 공간 확보는 하되, 사용하지 않은 크기는 돌려줌

DATE : 날짜 타입
CLOB : 메일, 항소문, 소설 등 VARCHAR2에서 감당하지 못할 크기의 글 내용을 삽입할 때 사용
BLOB : 이미지, 동영상 과 같은 파일 저장

영어, 숫자, 특수문자 == 1BYTE
이외 문자(한글포함) == 3BYTE
*/

/*
PRIMARY KEY(기본키)
 - 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
 - NOT NULL + UNIQUE (한 행에서 COLUMN에서 똑같은 모양의 데이터는 존재해선 안됨)
 
 - 한 테이블 한개만 설정
 
 - 컬럼 레벨, 테이블 레벨 설정 가능함
 
*/

/*
테스트를 진행하거나 컬럼에 대한 설정을 변경한 후 특정한 내용을 확인하길 원한다면 테이블을 복제해서 사용할 수 있음(사본만들기)

사본만들기를 진행하는 방법

모두 동일하게 사본 만들기
CREATE TABLE 새로운테이블이름 AS SELECT * FROM 복사할테이블이름; 

특정한 컬럼만 선택해서 사본 만들기
CREATE TABLE 새로운테이블이름 AS SELECT 컬럼명1,컬럼명2,... FROM 복사할테이블이름;
*/

CREATE TABLE EMPLOYEE2 AS SELECT*FROM EMPLOYEE;
--테이블을 만들 때 다른 테이블과 동일하게 (컬럼,데이터값)복사 붙여넣기를 진행할 때는
-- CREATE TABLE 테이블명
-- AS 복사하고싶은 테이블 SELECT

--복사한 테이블에 제대로 만들어졌는지 확인하기
SELECT *FROM 새로만든테이블명;

--EMPLOYEE2가 EMPLOYEE 제대로 복사햇는지 확인하기
SELECT * FROM EMPLOYEE2;