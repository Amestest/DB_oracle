/*
실습 5 SUBQUERY 실습문제
*/

-- 1. 전지연 사원이 속해있는 부서원들을 조회하시오 (단, 전지연은 제외)
-- 사번, 사원명, 전화번호, 고용일, 부서명
SELECT E.EMP_ID, E.EMP_NAME,E.PHONE,E.HIRE_DATE,D.DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE E.DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
AND E.EMP_NAME != '전지연';
-- 2. 고용일이 2000년도 이후인 사원들 중 급여가 가장 높은 사원의
-- 사번, 사원명, 전화번호, 급여, 직급명을 조회하시오.
SELECT E.EMP_ID, E.EMP_NAME, E.PHONE,E.SALARY,J.JOB_CODE
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.HIRE_DATE > TO_DATE('2000-01-01','YYYY-MM-DD')
AND E.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE  WHERE E.HIRE_DATE > TO_DATE('2000-01-01','YYYY-MM-DD'));
-- 3. 노옹철 사원과 같은 부서, 같은 직급인 사원을 조회하시오. (단, 노옹철 사원은 제외)
-- 사번, 이름, 부서코드, 직급코드, 부서명, 직급명
--1번과 동일한 문제 JOB 추가 됨 JOIN AND
SELECT E.EMP_ID, E.EMP_NAME,E.PHONE,E.HIRE_DATE,D.DEPT_TITLE,J.JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
AND E.JOB_CODE = (SELECT JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
AND E.EMP_NAME != '노옹철';

-- 4. 2000년도에 입사한 사원과 부서와 직급이 같은 사원을 조회하시오
-- 사번, 이름, 부서코드, 직급코드, 고용일
SELECT E1.EMP_ID,E1.EMP_NAME,E1.DEPT_CODE,E1.JOB_CODE,E1.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE,'YYYY')= '2000'
AND E1.EMP_ID != E2.EMP_ID;
--204	유재식	D6	J3	00/12/29
-- 2000년에 입사한 직원들을 찾고 동일한 부서와 직급을 가진 다른 직원 찾기
--2000년에 입사한 직원 E과
--동일한 부서 및 직급의 다른 직원 E2
--2000년에 입사한 직원 찾기
SELECT E2.EMP_ID,E2.EMP_NAME,E2.DEPT_CODE,E2.JOB_CODE,E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE,'YYYY')= '2000'
AND E1.EMP_ID != E2.EMP_ID;
--205	정중하	D6	J3	99/09/09
--E1이 2000년에 입사한 직원을 기준으로 동일한 부서와 직급을 가진 다른 직원 E2찾음
--E2는 2000년에 입사한 직원과 동일한 부서 동일한 직급ㅇ르 가진 다른 직원

--유재식과 정중하 모두 출력하기
SELECT E2.EMP_ID,E2.EMP_NAME,E2.DEPT_CODE,E2.JOB_CODE,E2.HIRE_DATE
FROM EMPLOYEE E1
JOIN EMPLOYEE E2 ON E1.DEPT_CODE = E2.DEPT_CODE AND E1.JOB_CODE = E2.JOB_CODE
WHERE TO_CHAR(E1.HIRE_DATE,'YYYY')= '2000'
AND E2.HIRE_DATE IS NOT NULL;


-- 5. 77년생 여자 사원과 동일한 부서이면서 동일한 사수를 가지고 있는 사원을 조회하시오
-- 사번, 이름, 부서코드, 사수번호, 주민번호, 고용일
SELECT
FROM

JOIN
ON
AND

WHERE LIKE
AND IN
AND
-- 6. 부서별 입사일이 가장 빠른 사원의
-- 사번, 이름, 부서명(NULL이면 '소속없음'), 직급명, 입사일을 조회하고
-- 입사일이 빠른 순으로 조회하시오
-- 단, 퇴사한 직원은 제외하고 조회..

-- 7. 직급별 나이가 가장 어린 직원의
-- 사번, 이름, 직급명, 나이, 보너스 포함 연봉을 조회하고
-- 나이순으로 내림차순 정렬하세요
-- 단 연봉은 \124,800,000 으로 출력되게 하세요. (\ : 원 단위 기호)