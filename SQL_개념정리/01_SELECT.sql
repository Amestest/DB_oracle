/*
SELECT(조회)

지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL

작성된 구문에 맞는 행, 열 데이터가 조회됨
-> 조회된 결과 행의 집합 == RESULT SET(결과 집합)

- RESULT SET 은 0 행 이상이 포함될 수 있음
-> 조건에 맞는 행이 없을 수 있다는 것
*/

/*
[SELECT 작성법 - 1(기초)]

SELECT 컬럼명, 컬럼명, ...
FROM 테이블명;

-> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼값 조회

테이블의 모든 행 모든 컬럼 조회하는 방법
 *(asterrisk) : 모든,포함하다를 나타내는 기호

*/

--EMPLOYEE 테이블에서
--모든 행의 사번(EMP_ID),이름(EMP_NAME),급여(SALARY) 조회
SELECT EMP_ID,EMP_NAME,SALARY FROM EMPLOYEE;

--EMPLOYEE 테이블에서 모든 행, 모든 컬럼 조회
SELECT * FROM EMPLOYEE;

/*
컬럼 값 산술 연산
--컬럼 값 : 행과 열이 교차되는 테이블 한 칸에 작성된 값
--SELECT문에 산술 연산을 직접 작성하면
--조회결과(RESULT SET)에 연산 결과가 반영되어 조회됨

*/

--EMPLOYEE 테이블에서
--모든 사원의 이름, 급여, 급여 + 100만원 조회
SELECT EMP_NAME,SALARY,SALARY + 1000000 FROM EMPLOYEE;

--EMPLOYEE 테이블에서
--모든 사원의 이름,연봉(급여 *12)조회
SELECT EMP_NAME,SALARY *12 AS "연봉" FROM EMPLOYEE;

/*
SYSDATE,SYSTIMESTAMP
--(시스템이 나타내고 있는) 현재시간

--SYSDATE : 현재시간(년,월,일,시,분,초) 조회
--SYSTIMESTAMP : 현재시간(년,월,일,시,분,초, MS + 지역(local) 조회

회원가입할 때 DB에 들어오는 현재 시간을 기록할 때 생성
컴퓨터에서 체크하는 시간을 기록할 때 사용

*/

/* 날짜 사용 하기
DB에서 저장된 날짜들 중에서 특수한 일정 기간을 조회하거나 변경하길 원할 때 사용

TO_DATE('문자열','패턴')
예를 들어 2024-05-01 자 이후 회원가입 한 회원 조회
TO_DATE('2024-05-01','YYYY-MM-DD')
*/

/*
컬럼명 별칭 지정

별칭 지정 방법
1) 컬럼명 AS "별칭" : 문자O,띄어쓰기O,특수문자O
2) 컬럼명 "별칭" : 문자O,띄어쓰기O, 특수문자O
3) 컬러명 별칭 : 문자O,띄어쓰기X,특수문자X
4) 컬럼명 AS 별칭 : 문자O, 띄어쓰기X,특수문자 X

*/

--EMPLOYEE 테이블에서 이름, 이메일 이메일에 @ 포함이라는 별칭
-- 1) 컬럼명 AS "별칭"
SELECT EMP_NAME,EMAIL AS"이메일@포함" FROM employee;
--2) 컬럼명 "별칭"
SELECT EMP_NAME,EMAIL "이메일@포함" FROM employee;
--3) 컬럴명 별칭 띄어쓰기X,특수문자X
--띄어쓰기와 @ 사용 불가
SELECT EMP_NAME,EMAIL 이메일포함 FROM employee;
--4) 컬럼명 AS 별칭
--띄어쓰기와 @ 사용 불가
SELECT EMP_NAME,EMAIL AS 이메일포함 FROM employee;

/* DISTINCT(별개의, 전혀다른)
->중복 제거

-- 조회 결과 집합(RESULT SET)에서 지정된 컬럼의 값이 중복되는 경우 중복되는 값을 한 번만 표시할 때 사용

사용방법
SELECT DISTINCT 중복제거할컬럼명 FROM 테이블명
*/

--EMPLOYEE 테이블에서 모든 사원의 부서코드 조회
SELECT DEPT_CODE FROM EMPLOYEE;

--EMPLOYEE 테이블에서 사원이 존재하는 부서코드만 조회
SELECT DISTINCT DEPT_CODE FROM employee;

--> D3 D4 D7 부서는 사원이 없기 때문에 조회되지 않음

--EMPLOYEE 테이블에 존재하는 직급 코드의 종류 조회 JOB_CODE
SELECT DISTINCT JOB_CODE FROM employee;

/*
WHERE 절

-- 테이블에서 조건을 충족하는 행을 조회할 때 사용
-- WHERE 절에는 조건적(TRUE/FALSE)만 작성

비교 연산자: >,<,>=,<=,=(같다),!=, <>(같지않다)
논리 연산자 : AND,OR,NOT

작성방법
SELECT 컬럼명, 컬럼명, ...
FROM 테이블명
WHERE 조건식;
--> 지정된 테이블 모든 행에서 컬럼명이 일치하는 컬럼 값 조회
*/
--EMPLOYEE 테이블에서 급여가 300만원을 초과하는 사원의 이름 급여 부서코드 조회
SELECT EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYY WHERE SALARY > 3000000;

--EMPLOYEE 테이블에서 D9 부서에 해당하는 사원의 이름 조회
SELECT EMP_NAME FROM EMPLOYEE WHERE DEPT_CODE !='D9';

/*
NULL, NOT NULL

컬럼 값이 존재하지 않는 경우
IS NULL;

컬럼 갑싱 존재하는 경우
IS NOT NULL;
*/
--EMPLOYEE 테이블에서 DEPT_CODE가 없는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL;
--EMPLOYEE 테이블에서 DEPT_CODE가 있는 사원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NOT NULL;