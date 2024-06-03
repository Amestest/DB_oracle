/*ORDER BY 실습하기*/
--1.EMPLOYEE 테이블에서 모든 직원의 이름을 오름차순 정렬
-- 모두보기
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME;
--2.EMPLOYEE 테이블에서 모든 직원의 급여를 내림차순 정렬 조회
--모두 보기
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC;
--3.사원번호와 이름 조회
--사원번호는 AS"사번" 이름 AS "이름"
--별칭이용해서 직원이름 내림차순 정렬
SELECT EMP_ID AS "사번",EMP_NAME AS "이름" FROM EMPLOYEE ORDER BY "이름"DESC;
--4.아이디,이름,급여 조회 급여는 AS "월급"
--월급으로 내림차순 정렬
SELECT EMP_ID, EMP_NAME,SALARY AS "얼급"
--5.EMPLOYEE 테이블에서 모든 직원의 보너스를 AS "보너스"로 표기
--보너스 내림차순으로 정렬
--SALARY AS "월급"
--월급 오름차순 정렬;
SELECT BONUS AS "보너스",SALARY AS "월급" FROM EMPLOYEE ORDER BY 보너스 DESC,월급 ASC;
-->사람이나 어떤 값을 정렬해서 모두 보겠다.X
--->제일 많이 보너스 받는 값은 무엇이고, 월급 제일 낮게 받거나 높게 받는 금액 
--6.EMPLOYEE 테이블에서 모든 직원의 이메일을 "이메일"표기
--EMAIL 오름차순으로 정렬
--전화번호를 AS"전화번호"표기
--EMAIL 내에서는 전화번호를 내림차순으로 정렬
SELECT EMAIL AS "이메일",PHONE AS "전화번호" FROM EMPLOYEE ORDER BY 이메일 ASC, 전화번호 DESC;
--7.EMPLOYEE 테이블에서 모든 직원의 이름"직원명"표기
--직원명 내침차순 정렬
--입사일 "입사일자"표기
--같은 이름 내에서 오름차순으로 정렬해서 조회
SELECT EMP_NAME AS "직원명",HIRE_DATE AS "입사일자" FROM EMPLOYEE ORDER BY 직원명 DESC,입사일자 ASC;
-->동명이인인데 직급이 다르거나 부서가 다를 때