/****** JOIN 실습 ******/

-- 1. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
-- 각 지원의 이름과 그 직원이 속한 부서명 조회

--ANSI
SELECT EMP_NAME , DEPT_TITLE FROM EMPLOYEE JOIN department ON (DEPT_CODE = DEPT_ID);
--ORACLE
SELECT EMP_NAME , DEPT_TITLE FROM EMPLOYEE,department WHERE (DEPT_CODE = DEPT_ID);

-- 2. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서
-- 각 직원의 이름과 그 지구언이 속한 부서명, 급여조회

--ANSI
SELECT EMP_NAME,DEPT_TITLE, SALARY FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--ORACLE
SELECT EMP_NAME,DEPT_TITLE,SALARY FROM EMPLOYEE, DEPARTMENT WHERE DEPT_CODE = DEPT_ID;
-- 3. EMPLOYEE 테이블과 SAL_GRADE 테이블을 조인해서
-- 각 직원의 이름과 급여 등급 조회
SELECT *FROM EMPLOYEE ; --SAL_LEVEL
SELECT *FROM SAL_GRADE; --SAL_LEVEL
--ANSI
SELECT EMPLOYEE.EMP_NAME, SAL_GRADE.SAL_LEVEL FROM EMPLOYEE JOIN SAL_GRADE ON (EMPLOYEE.SAL_LEVEL = SAL_GRADE.SAL_LEVEL);
/*
다른 테이블에서 컬럼명은 다르지만 서로 의미하는 바가 같은 컬럼 끼리는 컬럼명1 = 컬럼명A 사용할수 있음
다른 테이블에서 컬럼명이 같을 때는 참조하는 테이블이 무엇인지 작성해줘야함 테이블명, 컬럼명1 = 테이블명, 컬럼명2
SELECT로 참조할 때도 테이블명 작성해서 어디서 어느컬럼을 가지고오는지 작성
*/
--ORACLE
SELECT e.EMP_NAME,s.SAL_LEVEL FROM EMPLOYEE e,SAL_GRADE s WHERE e.SAL_LEVEL = s.SAL_LEVEL;

-- 각 직원의 이름과 그 지구언이 속한 부서의 부서명 및 직급 조회
-- 테이블 EMPLOYEE DEPARTMENT JOB
SELECT E.EMP_NAME,D.DEPT_TITLE, J.JOB_NAME FROM EMPLOYEE E JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID) JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
/*
E.DEPT_CODE = D.DEPT_ID
E.JOB_CODE = J.JOB_CODE

EMPLOYEE DEPARTMENT JOB
EMP_NAME DEPT_TITLE JOB_NAME
전지연	 인사관리부	대리
차태연	 인사관리부	대리
방명수	 인사관리부	사원
*/
--ORACLE
SELECT E.EMP_NAME,D.DEPT_TITLE,J.JOB_NAME FROM EMPLOYEE E, DEPARTMENT D, JOB J WHERE E.DEPT_CODE = D.DEPT_ID AND E.JOB_CODE = J.JOB_CODE;

-- 1.직원의 이메일 주소와 해당 부서의 부서명 조회
-- TABLE : EMPLOYEE,DEPARTMNET
-- SELECT EMAIL DEPT_TITLE
SELECT E.EMP_NAME,E.EMAIL,D.DEPT_TITLE FROM EMPLOYEE E,DEPARTMENT D WHERE E.DEPT_CODE = D.DEPT_ID;
-- 2. 급여가 300만원 이상인 직원들의 이름과 그 직원이 속한 부서명 조회
-- TABLE : EMPLOYEE,DEPARTMNET
-- SELECT EMP_NAME,DEPT_TITLE
-- WHERE
SELECT E.EMP_NAME, D.DEPT_TITLE FROM EMPLOYEE E,DEPARTMENT D WHERE E.DEPT_CODE = D.DEPT_ID AND E.SALARY >= 300000;
-- 3. 각 직원의 이름과 그 직원이 속한 부서명의 부서명, 급여 등급명 조회
-- TABLE : EMPLOYEE,DEPARTMENT, SAL_GRADE
-- SELECT : EMP_NAME,DEPT_TITLE,SAL_LEVEL
SELECT E.EMP_NAME,D.DEPT_TITLE,S.SAL_LEVEL FROM EMPLOYEE E,DEPARTMENT D, SAL_GRADE S WHERE E.DEPT_CODE = D.DEPT_ID AND E.SAL_LEVEL = S.SAL_LEVEL;

-- 4.직급이 대리이면서 아시아 지역에 근무하는 직원 조회
-- 사번 이름 직급명 부서명 근무 지역명 급여를 조회
-- EMPLOYEE, JOB, DEPARTMENT,LOCATION
-- SELECT EMP_ID,EMP_NAME,JOB_NAME,DEPT_TITLE,LOCAL_NAME,SALARY
--WHERE AND LIKE 조합
SELECT E.EMP_ID,E.EMP_NAME,J.JOB_NAME,D.DEPT_TITLE,L.LOCAL_NAME,E.SALARY FROM EMPLOYEE E,JOB J ,DEPARTMENT D, LOCATION L WHERE E.JOB_CODE = J.JOB_CODE AND E.DEPT_CODE = D.DEPT_ID AND D.LOCATION_ID = L.LOCAL_CODE AND J.JOB_NAME = '대리' AND L.LOCAL_NAME LIKE 'ASIA%';


-- 1.D5 부서에 속한 직원들의 이름과 직급명 조회
-- 테이블 EMPLOYEE JOB
SELECT E.EMP_NAME,J.JOB_NAME FROM EMPLOYEE E,JOB J WHERE E.JOB_CODE = J.JOB_CODE AND E.DEPT_CODE = 'D5';

-- 2. 각 부서의 부서명과 해당 부서에 속한 직원의 평균급여 조회
-- 테이블 EMPLOYEE DEPARTMENT
---GROUP BY
---AVG
SELECT D.DEPT_TITLE,AVG(E.SALARY) FROM DEPARTMENT D ,EMPLOYEE E WHERE E.DEPT_CODE = D.DEPT_ID GROUP BY D.DEPT_TITLE; 
--> 평균에서 정수로 변경하길 원한다면 CEIL ROUND FLOOR


-- 3. 급여 등급이 S4이상인 직원의 이름, 급여,급여등급 조회 
-- SELECT * FROM SAL_GRADE
-- 테이블 EMPLOYEE,SAL_GRADE
-- WHERE IN 
SELECT E.EMP_NAME,E.SALARY,E.SAL_LEVEL FROM EMPLOYEE E, SAL_GRADE S WHERE E.SAL_LEVEL = S.SAL_LEVEL AND S.SAL_LEVEL IN('S4','S5','S6');