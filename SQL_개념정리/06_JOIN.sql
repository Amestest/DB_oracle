/*
[JOIN]
- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
- 수행결과는 하나의 RESULT SET 으로 나옴

- 관계형 데이터베이스에서 SQL 이용해 테이블간 관계를 맺느 ㄴ방법

- 관계형 데이터베이스는 최소한의 데이터를 테이블에 담고 있어 
원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서
데이터를 읽어와야 하는 경우가 많음
이 때, 테이블간 관계를 맺기 위한 연결고리 역할이 필요한데
두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가 됨

등가 조인 --> 내부조인(INNER JOIN), JOIN USING, ON, 자연조인(NATURAL JOIN)

포괄 조인 --> 왼쪽 외부 조인(LEFT OUTER), 오른쪽 외부 조인(RIGHT OUTER), 전체 외부 조인(FULL OUTER)

자체 조인 --> JOIN ON 

교차 조인 --> CROSS JOIN 
*/

-- 서로 다른 테이블 데이터를 조회할 경우 2가지로 나눠서 조회

-- 직원번호, 직원명, 부서코드, 부서명을 조회할 때
SELECT EMP_ID,EMP_NAME,DEPT_CODE FROM EMPLOYEE;
--직원번호, 직원명, 부서코드는 EMPLOYEE 테이블에서 조회가능
/*
200	선동일	D9
201	송종기	D9
202	노옹철	D9
*/
--부서명은 DEPARTMENT테이블에서 조회가능
SELECT DEPT_ID,DEPT_TITLE FROM department;
/*
DEPT_ID  DEPT_TITLE
D9	    총무부*/

--JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블 한 번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE FROM EMPLOYEE JOIN department ON (DEPT_CODE = DEPT_ID);
/*

EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
직원ID,이름, 부서코드, 부서 ID, 부서명을 조회하는 쿼리

JOIN DEPARTMENT ON (DEPT_CODE= DEPT_ID)

JOIN은 단순히 테이블을 두 개 붙이는 것이 아닌

기준을 삼은 테이블의 한 컬럼을 지정해
다른 테이블의 한 컬러모가 같은 행을 찾아
기준 테이블 옆에 한 행씩 붙여나가는 것

EMP_ID, EMP_NAME,   DEPT_CODE,  DEPT_ID,    DEPT_TITLE
200	    선동일	    D9	        D9	        총무부
201	    송종기	    D9	        D9	        총무부
202	    노옹철	    D9	        D9	        총무부
*/

--1. 내부 조인 INNER JOIN 
---> 연결되는 컬럼의 값이 일치하는 행들만 조인 됨
--- (일치하는 값이 없는 행은 조인에서 제외)

-- 작성 방법 ANSI ORACLE 로 나뉨

--* ANSI 표준 구문
----구문 기준을 정할 때 정의 되는 기준
----- 가장 유명한 표준 ASCII 코드

--* ORACLE 표준 구문
--- FROM 절에, 로 구분해서 합칠 테이블명을 기술
---- WHERE 절에 합치기에 사용할 컬럼명 명시

-- 1) 연결에 사용할 두 컬럼명이 다른 경우 --> JOIN ON을 사용
---- 오라클에서는 JOIN ON을 사용하지 않고 
----- WHERE 절에 = 사용하면 됨

--JOIN을 활용해서 EMPLOYEE 테이블과 DEPARTMENT 테이블 한 번에 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE,DEPT_ID,DEPT_TITLE FROM EMPLOYEE, department WHERE DEPT_CODE = DEPT_ID;


-- DEPARTMENT 테이블, LOCATION 테이블 참조해서 부서명, 지역명 조회
SELECT * FROM DEPARTMNET;

SELECT * FROM LOCATION;
-- ANSI 박싱 JOIN ON LOCATION_ID = LOCAL_CODE
SELECT DEPT_TITLE AS"부서명",LOCAL_CODE AS "코드명" ,LOCAL_NAME AS "지역명" FROM DEPARTMENT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);
-- ORACLE 방식 LOCATION_ID = LOCAL_CODE
SELECT DEPT_TITLE AS "부서명", LOCAL_NAME AS "지역명" FROM DEPARTMENT, LOCATION WHERE LOCATION_ID = LOCAL_CODE;

/*
연결에 사용할 두 컬럼이 다른 경우 --> JOIN ON
연결에 사용할 두 컬럼이 같은 경우 --> JOIN USING

-- 2) 연결에 사용할 두 컬럼명이 같은 경우 --> JOIN USING을 사용
FROM 테이블명
JOIN 테이블명 USING(같은컬럼명)
*/

-- EMPLOYEE 테이블, JOB테이블 참조해서
--사번, 이름, 직급코드, 직급명 조회

--ANSI 표준 연결방법
-- 연결에 사용할 컬럼이 같은 경우 USING(컬럼명) 사용

SELECT EMP_ID,EMP_NAME,JOB_CODE FROM EMPLOYEE;
/*
EMP_ID  EMP_NAME JOB_CODE
200	    선동일	 J1
201	    송종기	 J2
202	    노옹철	 J2
203	    송은희	 J4
204	    유재식	 J3
205	    정중하	 J3
206	    박나라	 J7
207	    하이유	 J5
208	    김해술	 J5
209	    심봉선	 J3
*/
SELECT * FROM JOB;

/*
JOB_CODE JOB_NAME
J1  	대표
J2	    부사장
J3	    부장
J4	    차장
J5	    과장
J6  	대리
J7	    사원
*/

SELECT EMP_ID,EMP_NAME,JOB_CODE,JOB_NAME FROM EMPLOYEE JOIN JOB USING(JOB_CODE);
/*
EMP_ID EMP_NAME JOB_CODE JOB_NAME
200	    선동일	 J1	     대표
201	    송종기	 J2	     부사장
202	    노옹철	 J2	     부사장
203	    송은희	 J4	     차장
204	    유재식	 J3	     부장
205	    정중하	 J3	     부장
206	    박나라	 J7	     사원
207 	하이유	 J5	     과장
208 	김해술	 J5	     과장
*/

SELECT E.EMP_ID,E.EMP_NAME, E.JOB_CODE,J.JOB_NAME FROM EMPLOYEE E,JOB J WHERE E.JOB_CODE = J.JOB_CODE;
/*
ORACLE 표준 규격으로 작성해서 나온 조회결과
E.EMP_ID EMP_NAME JOB_CODE JOB_NAME
200	     선동일	    J1	    대표
201	     송종기	    J2	    부사장
202	     노옹철	    J2	    부사장
203	     송은희	    J4	    차장
204	     유재식	    J3	    부장
*/


/****** 
NATURAL JOIN (자연조인) JOIN에 별칭을 설정해서 테이블 표현하기 
동일한 타입과 이름을 가진 컬럼이 있는 테이블간의 조인을 간단히 표현한 방법
반드시 두 테이블 간에 동일한 컬럼명, 타입을 가진 컬럼이 필요
없을 경우 교차조인이 됨

EMPLOYEE.JOB_CODE (CHAR(2))
     JOB.JOB_CODE (CHAR(2))
     --> 컬럼명,자료형이 모두 일치 == 자연조인대상
SELECT 컬럼명,컬럼명,컬럼명,... FROM 테이블명 NATURAL JOIN 테이블명

JOIN에 별칠을 설정해서 테이블 표현하기
JOIN과 FROM에서 테이블을 설정할 때
쿼리를 좀 더 간결하고 읽기 쉽게 만드는 방법
테이블을 다수 여러개 참조할 때 유용

사용방법

1) SELECT 테이블명.컬럼명,테이블명.컬럼명
    FROM 테이블명.테이블명
    WHERE 테이블명.컬럼명 = 테이블명.컬럼명

2) SELECT A.컬럼명 , B.컬럼명
    FROM 테이블명 A, 테이블명 B
    WHERE A.컬럼명 = B.컬럼명
******/

-- ***** OUTER JOIN 외부 조인 *****--
-- 두 테이블의 지정하는 컬럼값이 일치하지 않는 행도
-- 조인에 포함 시킴

--OUTER JOIN 과 비교할 INNER JOIN 쿼리문

SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE /*INNER*/ JOIN department ON (DEPT_CODE = DEPT_ID);

-- 1) LEFT[OUTER]JOIN
-- 합치기에 사용한 두 테이블 중에서 왼쪽 편에 작성된 테이블의
-- 컬럼수를 기준으로 JOIN

--ANSI 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE LEFT JOIN department ON (DEPT_CODE =DEPT_ID);
-->JOIN 구문 기준으로 왼쪽에 작성된 테이블의
--->모든 행이 최종 결과(RESULT SET)에 포함되도록 하는 JOIN

--ORACLE 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE = DEPT_ID(+);
--DEPT_CODE 와 DEPT_ID 값이 일치하지 않아도
--왼쪽에 있는 컬럼에 수에 맞게 표시를 넣어라 (NULL 값이라도 넣어라)




-- 2) LIGHT[OUTER]JOIN
-- 합치기에 사용한 두 테이블 중에서 오른쪽 편에 작성된 테이블의
-- 컬럼수를 기준으로 JOIN

--ANSI 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE LIGHT JOIN department ON (DEPT_CODE =DEPT_ID);
-->JOIN 구문 기준으로 오른쪽에 작성된 테이블의
--->모든 행이 최종 결과(RESULT SET)에 포함되도록 하는 JOIN

--ORACLE 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE(+) = DEPT_ID;
--DEPT_CODE 와 DEPT_ID 값이 일치하지 않아도
--오른쪽에 있는 컬럼에 수에 맞게 표시를 넣어라 (NULL 값이라도 넣어라)



-- 3) FULL[OUTER]JOIN
-- 합치기에 사용한 두 테이블이 가진 모든 행을 결과에 포함
-->오라클에서는 FULL OUTER JOIN 구문 사용 불가

--ANSI 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE FULL JOIN department ON (DEPT_CODE =DEPT_ID);
-->JOIN 구문 기준으로 양쪽에 작성된 테이블의
--->모든 행이 최종 결과(RESULT SET)에 포함되도록 하는 JOIN

--ORACLE 표준
SELECT EMP_NAME,DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE(+) = DEPT_ID(+);
/*
ORA-01468: a predicate may reference only one outer-joined table
01468. 00000 -  "a predicate may reference only one outer-joined table"
*Cause:    
*Action:
237행, 72열에서 오류 발생
*/


