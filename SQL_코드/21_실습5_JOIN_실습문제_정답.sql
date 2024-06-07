SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;

-- 1. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 ‘전’씨인 직원들의
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT E.EMP_NAME,E.EMP_NO,D.DEPT_TITLE,J.JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_NO LIKE '7%'
AND SUBSTR(E.EMP_NO,8,1) IN ('2','4') --1900년대는 2 2000년대 4
AND E.EMP_NAME LIKE '전%';
-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 직급명을 조회하시오.
SELECT E.EMP_ID,E.EMP_NAME,J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.EMP_NAME LIKE '%형%';
-- 3. 해외영업 1부, 2부에 근무하는 사원의
-- 사원명, 직급명, 부서코드, 부서명을 조회하시오.
SELECT E.EMP_NAME,J.JOB_NAME,D.DEPT_CODE,D.DEPT_TITLE
FROM EMPLOYEE E
JOIN department D ON e.dept_code = d.dept_id
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.DEPT_CODE IN('D5','D6');

--SELECT * FROM DEPARTMENT 실행
--D5 해외영업 1부
--D6 해외영업 2부

--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT E.EMP_NAME,E.BONUS,D.DEPT_TITLE,L.LOCAL_NAME
FROM employee E
JOIN department D ON E.DEPT_CODE = D.DEPT_ID 
JOIN location L ON D.LOCATION_ID = L.LOCAL_CODE
WHERE E.BONUS IS NULL;

--5. 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명 조회
SELECT E.EMP_NAME,J.JOB_NAME,D.DEPT_TITLE,L.LOCAL_NAME
FROM employee E
JOIN department D ON E.DEPT_CODE = D.DEPT_ID 
JOIN location L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;


-- 6. 급여등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
--사원명, 직급명, 급여, 연봉(보너스포함)을 조회하시오.
--연봉에 보너스포인트를 적용하시오.
SELECT E.EMP_NAME,J.JOB_NAME,E.SALARY,(E.SALARY+NVL(E.BONUS,0))*12 AS"연봉" --연봉을 나타내는 NVL 이용해서 보너스가 없으면 0
FROM EMPLOYEE E
JOIN SAL_GRADE S ON E.SAL_LEVEL = S.SAL_LEVEL
--SAL_GRADE 테이블과 EMPLOYEE 테이블을 조인하기 위해 서로 값이 같은 컬럼을 연결
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE 
--JOB 테이블과 EMPLOYEE 테이블 조인하기 위해 서로 값이 같은 컬럼을 연결
WHERE E.SALARY >S.MIN_SAL;
--직원의 급여가 최소 급여보다 큰 직원들만 선택할 수 잇도록 조건 설정

-- 7.한국(KO)과 일본(JP)에 근무하는 직원들의
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.
SELECT E.EMP_NAME,D.DEPT_TITLE,L.LOCAL_NAME, N.NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N ON L.NATIONAL_CODE = N.NATIONAL_CODE
WHERE N.NATIONAL_CODE IN ('KO','JP');
-- 8. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- SELF JOIN 사용
SELECT E1.EMP_NAME,E1.DEPT_CODE,E2.EMP_NAME
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE
AND E1.EMP_ID != E2.EMP_ID; --내 부서에서 나와 같이 근무하는 사람들을 봐야하기 때문에 내 코드는 보여주지 않겠다.

--E1.DEPT_CODE = E2.DEPT_CODE 같은 부서에 있으면서
--E1.EMP_ID != E2.EMP_ID 서로 다른 직원일 경우에만 조회
-- 9. 보너스포인트가 없는 직원들 중에서 직급코드가 J4 와 J7 인 직원들의 사원명, 직급명, 급여를조회하시오.
-- 단, JOIN, IN 사용할 것
SELECT E.EMP_NAME,J.JOB_NAME,E.SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.BONUS IS NULL
AND E.JOB_CODE IN ('J4','J7');
/*ORA-00918: column ambiguously defined*/
