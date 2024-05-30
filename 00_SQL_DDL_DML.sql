/*
DDL
SQL을 관리하고 구조를 정의하기위한 명령어의 집합

CREATE ALTER DROP

CREATE USER ID를 만들거나, TABLE을 ㅁ나들 때 대표적으로 많이 사용

ALTER USER 에 대한 정보나, TABLE명을 수정할 때 사용

DROP USER 에 대한 정보를 삭제하거나, TABLE 명을 삭제할 때 사용

DML
    데이터베이스의 데이터를 조작하기 위한 SQL 명령어 집합 
    
    INSERT UPDATE DELETE SELECT 등이 존재
    
    INSERT : 테이블에 새로운 행을 삽입 row 삽입
        기본문법 : INSERT INTO 테이블명 (컬럼1, 컬럼2, ...) VALUES (값1, 값2, ...);
        
    UPDATE : 테이블에 기존 데이터를 수정
        기본 문법 : UPDATE 테이블명 SET 컬럼1 = 변경할값1, 컬럼2 = 변경할값2, ... where 조건;
        
    DELETE : 테이블에서 데이터를 삭제
        기본 문법 : DELETE 테이블명 WHERE 조건;
                   테이블에서 삭제하고자 하는 조건을 선택해서 삭제
                   
    SELECT : 테이블에서 데이터를 조회
        기본 문법 : SELECT *(모두선택) FROM 테이블명;
                    테이블에 적혀잇는 모든 내용을 보겠다라는 의미
                   SELECT 컬럼명1, 컬럼명2, ... FROM 테이블명;
                    테이블에서 원하는 컬럼을 선택해서 보겠다는 의미
                   SELECT 컬럼명1 AS 별칭1, 컬럼명2 AS 별칭2, ...  FROM 테이블명;
                    테이블에서 원하는 컬럼에 별칭을 붙여 출력하겠다는 의미
                    
*/

