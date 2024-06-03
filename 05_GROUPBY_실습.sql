/*HAVING 절 실습*/
--1. 부서별 급여 합계 계산 급여 합계가 500이상인 부서만 조회
--> 지금은 이런 방식 X
SELECT DEPT_CODE. SUM(SALARY) AS "급여합계"
FROM EMPLOYEE
WHERE SUM(SALARY) >= 500000
GROUP BY DEPT_CODE
ORDER BY "급여 합계"DESC;

/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"

-->WHERE 절에서는 집계 함수(SUM, AVG,MAX,MIN, COUNT등)
    사용할 수 없음
집계함수(SUM,AVG,MAX,MIN,COUNT 등)는 HAVING 이나 WHERE GROUP을 
다른 방식으로 사용해서 작성
*/
--2. 각 부서별 최대 급여 조회
SELECT DEPT_CODE, MAX(SALARY) AS "최대급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--3. 각 부서멸 최소 급여 조회 최소급여를 기준 오름차순으로 정렬
SELECT DEPT_CODE, MIN(SALARY) AS "최소급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY "최소급여" ASC;
--4. 각 부서별 보너스율 합계 조회 AS "총 보너스율"
--SUM 총 보너스율 기준으로 내림차순
SELECT DEPT_CODE,SUM(BONUS) AS "총 보너스율"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY "총 보너스율" DESC;
--5.직급별 사원 수 조회
--COUNT 사원수 기준으로 내림차순
SELECT JOB_CODE,COUNT(*)AS "사원 수"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY "사원 수" DESC;
--6.각 급여 등급별 평균 보너스율 조회
--AVG 평균보너스율 내림차순 정렬
SELECT SAL_LEVEL,AVG(SAL_LEVEL) AS "평균 보너스율"
FROM EMPLOYEE
GROUP BY SAL_LEVEL
ORDER BY "평균 보너스율" DESC;
/*
ORA-00904: "SAL_LAVEL": invalid identifier
오타가 났을 때 오타를 빠르게 찾는 방법
문제가 되는  구문을 복사
CTRL + F 누르고 CTRL + V 로 붙여넣기 한 다음
문제가 되는 구문 찾기(오타찾기)
*/
--7.각 부서별 사원들의 입사일이 가장 오래된 사원 조회
--MIN 최초 입사일 오름 차순 정렬
SELECT DEPT_CODE,MIN(HIRE_DATE) AS "입사일"
FROM EMPLOYEE
GROUP BY dept_code
ORDER BY "입사일" ASC;
--8. 급여가 300만 이상인 사원들의 부서별 사원수 조회
SELECT DEPT_CODE,COUNT(*) AS "사원수"
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
ORDER BY "사원수" DESC;
--9.부서별 보너스율 0.1이상인 사원수 조회
--COUNT AS "보너스 받은 사원수" 내림차순
SELECT DEPT_CODE,COUNT(*) AS "보너스 받은 사원수"
FROM EMPLOYEE
WHERE BONUS >= 0.1
GROUP BY DEPT_CODE
ORDER BY "보너스 받은 사원수" DESC;
--10.급여가 400만원 이하인 사원들의 직급별 사원수 조회
--COUNT AS "사원수" 내림차순
SELECT JOB_CODE,COUNT(*) AS "사원수"
FROM EMPLOYEE
WHERE SALARY <= 4000000
GROUP BY JOB_CODE
ORDER BY "사원수" DESC;
--11.급여가 500만원 이상인 사원들의 부서별 평균 급여 조회
--AVG AS "평균급여" 내림차순
SELECT DEPT_CODE,AVG(SALARY) AS "평균급여"
FROM EMPLOYEE
WHERE SALARY >= 5000000
GROUP BY DEPT_CODE
ORDER BY "평균급여" DESC;

--그룹을 세분화 하여 조회하기 --
--1. 각 부서별 사원들의 퇴사 여부를 조회하고 사원수 조회
SELECT DEPT_CODE,ENT_YN,COUNT(*) AS "사원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE,ENT_YN;

-- 각 부서별, 직급별, 입사일에 따른 사원수 조회
SELECT DEPT_CODE,JOB_CODE, HIRE_DATE,COUNT(*) AS "사원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE,HIRE_DATE
ORDER BY DEPT_CODE,JOB_CODE,HIRE_DATE;
-- 공채 채용 후 기수별 남아잇는 사원 수 조회할 때 사용

/*HAVING 실습*/
-- 1. 각 부서별 평균 급여가 400만원 잇아인 부서 조회
SELECT DEPT_CODE,AVG(SALARY) AS "평균월급"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 4000000;
/*
D9 부서만 평균 급여가 400만원 이상인 것
D9	5900000
*/
-- 2. 각 부서별 직원수가 5명 이상인 부서 조회
SELECT DEPT_CODE,COUNT(*) AS "부서별 직원 수"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >=5;

--D5 6 

-- 3. 각 부서별 보너스 평균이 0.2 이상인 부서 조회
SELECT DEPT_CODE,AVG(BONUS)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(BONUS) >=0.2;

--4. 각 직급별 최소 급여가 300만 이하인 직급 조회
--MIN AS "최소급여"
SELECT DEPT_CODE, MIN(SALARY) AS "최소급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING MIN(SALARY) <=3000000;
--5. EMPLOYEE 테이블에서
-- 부서별 80년대생의 급여 평균이 300만 이상인 부서를 조회하고
-- 부서코드 오름차순 정렬
--FLOOR(AVG(AS 급여평균
SELECT DEPT_CODE,FLOOR(AVG (SALARY)) AS "급여평균"  
FROM EMPLOYEE
--WHERE TO_NUMBER(SUBSTR(EMP_NO.1.2) BETWEEN 70 AND 79
WHERE SUBSTR(EMP_NO,1,1)= '7'
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000
ORDER BY DEPT_CODE;

/*D1 D5 D6
D1	3220000
D5	3500000
D6	3900000
*/

/*ROLLUP CUBE*/
--1. 부서별 직급별 급여 합계
SELECT DEPT_CODE,JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;

--2. 부서멸,직급별, 급여 등급별 급여 합계
SELECT DEPT_CODE,JOB_CODE,SAL_LEVEL,SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE,SAL_LEVEL)
ORDER BY DEPT_CODE; --ASC 생략

--3. 부서별, 직급별 급여평균
-- DEPT_CODE, JOB_CODE,AVG(SALARY)
--ORDER BY DEPT_CODE 오름차순
SELECT DEPT_CODE,JOB_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;
--4.부서별 직급별 직원수
--DEPT_CODE, JOB_CODE,COUNT
--ORDER BY DEPT_CODE 오름차순
SELECT DEPT_CODE,JOB_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;
--5.부서별, 직급별, 급여 등급별 평균 급여
--DEPT_CODE, JOB_CODE,AVG(SALARY)
--ORDER BY DEPT_CODE 내림차순
SELECT DEPT_CODE,JOB_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY CUBE (DEPT_CODE,JOB_CODE,SAL_LEVEL)
ORDER BY DEPT_CODE DESC;
--6.부서별, 직급별, 급여 등급별 보너스 합계
--DEPT_CODE,JOB_CODE,SAL_LEVEL,SUM(BONUS)
--ORDER BY DEPT_CODE 내림차순
SELECT DEPT_CODE,JOB_CODE,SAL_LEVEL,SUM(BONUS)
FROM EMPLOYEE
GROUP BY CUBE (DEPT_CODE,JOB_CODE, SAL_LEVEL)
ORDER BY DEPT_CODE DESC;