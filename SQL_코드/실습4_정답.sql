/*****OrderBy 실습*****/
--1.  DEPARTMENT 테이블에서 DEPT_TITLE을 기준으로 정렬하여 모든 데이터 조회
SELECT * FROM DEPARTMENT ORDER BY DEPT_TITLE; --ASC 오름차순
--2. EMPLOYEE 테이블에서 SALARY를 기준으로 내림차순 정렬하여 모든 데이터
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC; --DESC 내림차순
-- FROM 찾을 테이블 위치 선정 _> SELECT 조회 -> ORDER BY 정렬

/*****HAVING 실습 -> GROUP BY 사용한다는 의미******/
--1. EMPLOYEE 테이블에서 DEPT_CODE별 평균 급여를 구하고, 평균 급여가 3,000,000보다 큰 부서만 조회
SELECT DEPT_CODE, AVG(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE HAVING AVG(SALARY) > 3000000;    
-- WHERE : 조건에 해당하는 사람들ㅇ르 검색한 다음 조건에 부합하는 것처럼 보임
-- GROUP HAVING : 모든~ 사람들을 조회하고 조건에 맞는 부서만 선별

--2. EMPLOYEE 테이블에서 JOB_CODE별 직원 수를 구하고, 직원 수가 3명 이상인 직급만 조회
SELECT JOB_CODE, COUNT(*) FROM EMPLOYEE GROUP BY JOB_CODE HAVING COUNT(*) > 3;

--FROM 찾을테이블위치 선정--> GROUP BY 묶을그룹선정-->HAVING COUNT 조건 설정--> SELECT 그룹조건에 맞는 내용 조회

/******* GROUP BY *********/
--1. EMPLOYEE 테이블에서 DEPT_CODE별 직원 수를 조회
SELECT DEPT_CODE, COUNT(*) AS "직원수" FROM EMPLOYEE GROUP BY DEPT_CODE;
--2. EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회
SELECT JOB_CODE, FLOOR(AVG(SALARY)) AS "평균 급여" FROM EMPLOYEE GROUP BY JOB_CODE;
-->AVG나 SUM으로 수의 합에 대한 결과를 구할 때
---> 정수 밑에 잇는 소수점을 제거하길 원한다면
----->CEIL, FLOOR, ROUND 설정

/***** WHERE *****/
--1. EMPLOYEE 테이블에서 급여가 3,000,000 이상인 직원들을 조회
SELECT EMP_NAME, SALARY AS "급여" FROM EMPLOYEE WHERE SALARY > 3000000;
--2. EMPLOYEE 테이블에서 DEPT_CODE가 'D1'인 직원들을 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D1';
