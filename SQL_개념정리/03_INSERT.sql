/****
DML : 데이터 조작 언어
테이블에 값을 삽입하거나 수정하거나 삭제하는 구문

INSERT : 삽입

UPDATE : 수정

DELETE : 삭제

한 후에 반드시 COMMIT ROLLBACK 진행할 것

COMMIT ROLLBACK - 팀원이나 다른사람과 상의 후 진행
개발 연습이기 때문에 단독으로 진행해도 좋음
******/

-- INSERT UPDATE DELETE 를 위해 연습용 테이블 만들어줄것

-- EMPLOYEE 테이블에 있는 정보를 EMPLOYEE2 테이블에 그대로 복사 붙여넣기 한 것

CREATE TABLE EMPLOYEE2 AS SELECT*FROM EMPLOYEE;
--테이블을 만들 때 다른 테이블과 동일하게 (컬럼,데이터값)복사 붙여넣기를 진행할 때는
-- CREATE TABLE 테이블명
-- AS 복사하고싶은 테이블 SELECT
SELECT * FROM EMPLOYEE2;

-- DEPARTMENT 테이블을 DEPARTMENT2 테이블에 그대로 복사 붙여넣기 진행
CREATE TABLE DEPARTMENT2 AS SELECT*FROM department;
SELECT*FROM DEPARTMENT2;

------------------------------------
--1.INSERT

--테이블에 새로운 행을 추가하는 구문

--1) INSERT INTO 테이블명 VALUES(데이터,데이터,...);
--테이블에 모든 컬럼에 대한 값을 INSERT 할 때 사용
--INSERT 하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략 가능
--단, 컬럼의 순서를 지켜서 VALUES 값에 값을 기입해야함

--모두 INSERT 해줄 거싱기 때문에 컬럼명 생략

INSERT INTO EMPLOYEE2 VALUES(800,'동그라미','870814-2123456','KIM@KH.KR','01076996190','D1','J7','S3',430000,0.2,200,SYSDATE,NULL,'N');

COMMIT;

SELECT * FROM EMPLOYEE2 WHERE EMP_ID = 800;

--동그라미씨 입사 신규 부서
INSERT INTO DEPARTMENT2 VALUES('D0','개발운영부','L1');

--동그라미씨.. 신입인데. 혼자 부서에 있으라고요?
ROLLBACK; --저장 X 돌아가기


--INSERT 에서 특정 부분을 선택해서 넣을 때는 컬럼명을 작성해서 넣어줌
--INSERT INTO 테이블명(컬럼명1,컬럼명2,...) VALUES (컬럼명1에 해당하는값,컬럼명2에 해당하는값,...);

-----------------------------------------------
--2. UPDATE

-- 테이블에 기록된 컬럼의 값을 수정하는 구문
-- 업데이트를 사용하는 예제 : 회원정보수정(핸드폰번호,주소,아이디, 비밀번호 변경) 
--                         사업자-상품수정(수량,이름,재고)

--[작성법]
--UPDATE 테이블명 SET 컬럼명 = 변경할값
--[WHERE 컬럼명 비교연산자 비교값]; -- 필수 아님

--DEPARTMENT2 테이블에서 DEPT_ID가 'D9'인 부서 정보 조회
SELECT * FROM department2 WHERE DEPT_ID='D9';

--DAPARTMENT2 테이블에서 DEPT_ID가 D9인 부서를
--전략기획팀으로 수정

UPDATE department2 SET DEPT_TITLE = '전략기획팀' WHERE DEPT_ID= 'D9';

--UPDATE 확인
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID ='D9';

--저장을 원한다면 COMMIT작성
--되돌리기를 원한다면 ROLLBACK;

ROLLBACK;

--조건을 설정하지 않고 모든 행의 컬럼 값 변경
--UPDATE 테이블명 SET 컬럼명 = 변경할내용작성;

--여러 컬럼을 한번에 수정할 경우 콤마(,)로 컬럼을 구분해서 수정

--D2 / 회계관리부 D0 / 회계관리팀 으로 변경
UPDATE department2 SET DEPT_ID = 'D0',DEPT_TITLE = '회계관리팀' WHERE DEPT_ID = 'D2';

SELECT*FROM department2;

ROLLBACK;

/********
삭제하기
테이블 안에 존재하는 값들을 삭제하는 구문

[작성법]
DELETE FROM 테이블명 WHERE 조건설정;
만약 WHERE 조건을 설정하지 않으면 모든 행이 다 삭제됨

DELETE FROM 테이블명;
->테이블 안에 있는 내용을 모두 삭제

DELETE FROM 테이블명 WHERE 컬럼명 = 삭제할컬럼값;
--> 테이블 안에서 특정한 컬럼값에 대당하는 줄을 모두 삭제

--완전삭제 --> COMMIT;

--되돌리기 --> ROLLBACK;

주의할점;
DELETE는 테이블 안에 잇느 ㄴ내용을 삭제
DROP은 테이블 자체를 삭제
DROP TABLE EMPLOYEE3;

COMMIT;
*******/