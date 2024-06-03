/*
[SELECT 문 정리]
5 SELECT 컬럼명, 컬럼명 AS "별칭",컬럼명...
1 FROM 참조할 테이블명
2 WHERE 컬럼명|함수식 비교연산자 비교값
3 GROUP BY 그룹을 묶을 컬럼명
4 HAVING 그룹함수식 비교연산자 비교값
6 ORBER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식

--SELECT WHERE 절까지만 존재할 경우
3 SELECT 컬럼명 -> 마지막에 보여주겠다!! 결과를!!
1 FROM 테이블명
2 WHERE 조건식

--SELECT ORDER BY 절까지만 존재할 경우 (WHERE X)
2 SELECT 컬럼명
1 FROM 테이블명
3 ORDER BY 정렬기준

--SELECT ORDER BY 절까지만 존재할 경우 (WHERE O)
3 SELECT 컬럼명
1 FROM 테이블명
2 WHERE 조건식
4 ORDER BY 정렬기준

GROUP BY 절

같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을
하나의 그룹으로 묶은것

여러개의 값을 묶어서 하나로 처리할 목적으로 사용
그룹으로 묶은 값에 대해서 SELECT 절에서 그룹함수를 사용

그룹함수는 단 한개의 결과 값만 산출하기 때문에 그룹이 여러개일 경우 오류 발생
여러개의 결과 값을 산출하기 위해 그룹 함수가 적용된 그룹의 기분을 ORDER BY 절에 기술해서 사용
*/

/*

SELECT DEPT_CODE, SUM(SALARY)
DEPT_CODE 부서코드와 각 부서의 급여 합계를 선택

GROUP BY DEPT_CODE;

DEPT_CODE 기준으로 그룹을 생성
동일한 부서코드를 가진 사람들을 하나의 그룹으로 묶고
각 그룹에 월급 합인 SUM(SALARY)를 적용해서 
해당 부서의 모든 직원의 급여 합계를 계산한 것

(NULL) = 빈칸
NULL	5210000
D1	    7820000
D9	    17700000
D5	    15760000
D6	    10100000
D2	    6520000
D8	    6986240
*/

--EMPLOYEE 테이블에서
--부서코드와 부서별 보너스를 받는 사원의 수 조회
--1. SELECT 절에서 부서코드랑 보너스 사원수 카운트 진행
SELECT DEPT_CODE, COUNT(*) AS "보너스받은사원수"
--2. EMPLOYEE 테이블에서 조회하자
FROM EMPLOYEE
--3. 보너스 받은 사람만 보자 WHERE 조건!
WHERE BONUS IS NOT NULL
--4.  각 부서 기준으로 몇명받았는지 계산해서 
-- 각 그룹에서보너스 받은 사원수 조회
GROUP BY DEPT_CODE;

/*
DEPT_CODE 보너스받은 사원수
(NULL)      1
D1	        2
D9	        1
D5	        2
D6	        1
D8	        2
*/

--맨 밑에 ORDER BY 를 추가해서 부서코드순으로 정렬

SELECT DEPT_CODE, COUNT(*) AS "보너스받은 사원수"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--EMPLOYEE 테이블에서 부서코드가 D5 D6인 부서의 평균 급여 조회
--버림(평균(급여

SELECT DEPT_CODE,FLOOR(AVG(SALARY)) AS "평균 급여"
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6')
GROUP BY DEPT_CODE;

/*
DEPT_CODE   평균급여
D5	        2626666
D6	        3366666
*/


--여러 컬럼을 묶어서 그룹으로 지정 가능

-- GROUP BY 사용시 주의할점

--> SELECT문에 GROUP BY 절을 사용할 경우
--SELECT 절에 명시한 조회 컬럼 중 그룹 함수가 적용되지 않은 컬럼은
--모두 GROUP BY 절에 작성해야함

--EMPLOYEE 테이블에서 부서별로 같은 직급인 사원의 급여 합계를 조회하고
-- 부서코드 오름차순으로 정렬

SELECT DEPT_CODE,JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE
ORDER BY DEPT_CODE;--ASC 생략

/*
EMPLOYEE 테이블에서 부서코드(DEPT_CODE) 직급코드(JOB_CODE)각 코드별로
급여 합계 계산해서 그룹화 하고, 부서코드 순서대로 정렬
D1	    J6	6440000
D1	    J7	1380000
D2	    J4	6520000
D5	    J3	3500000
D5	    J5	8460000
D5	    J7	3800000
D6	    J3	7300000
D6	    J4	2800000
D8	    J6	6986240
D9	    J1	8000000
D9	    J2	9700000
null	J6	2320000
null	J7	2890000

예를 들어 KH 테이블 존재 컬럼 T반 U반 존재

T반 총 학생수가 궁금 어떤 학생수 성별 학생수

SELECT T반,성별, SUM(총학생수)
FROM KH
GROUP BY T반, 성별
ORDER BY 가나다순 정렬
*/

-----------------------------------------------
--WHERE 절: 지정된 테이블에서 어떤 행만을 조회 결과로 삼을 것인지 조건을 지정하는 구문
--          (테이블 내에서 특정 컬럼만 뽑아서 사용하겠다는 조건문)

--HAVING 절: 그룹 함수로 구해 올 그룹에 대한 조건을 설정할 때 사용
--          (그룹에 대한 조건, 어떤 그룹만 조회하겠다)

--부서별 평균 급여가 3000000원 이상인 사원만 조회하고 오름차순 정렬
-->급여가 3000000원 이상인 직원들만 대상으로 각 부서의 평균 급여계산
---> 그룹화 전에 필터링 일어남
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
WHERE SALARY >= 3000000
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

--부서별 평균 급여가 3000000원 이상인 부서를 조회하고 부서코드 오름차순 정렬
-->모든 직원들을 대상으로 그룹화 한후, 각 부서별로 평균 급여를 계싼
--->HAVING 절을 이용해서 계산된 평균 급여가 3,000,000원 이상인 부서만 필터링
----> 모든 급여를 고려해서 평균을 계산한 다음 조건에 맞는 결과만 필터링
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE
--WHERE SALARY >= 3000000;
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000
ORDER BY DEPT_CODE;

/*
D1	3660000
D5	3630000
D6	3650000
D9	5900000

D6	3366666.66666666666666666666666666666667
D9	5900000

WHERE절의 경우 조건에 맞는 값만 가지고 온 후 보여준다면
HAVING절의 경우 모든 값을 확인하고 조건에 부합하는 그룹만 보여줌
*/

--집계함수 (ROLLUP, CUBE)
-- 그룹 별 산출한 결과 값의 집계를 계산하는 함수
-- GROUP BY 절에서만 작성할 수 있는 함수
-- WHERE ORDER SELECT 에서 사용하지 않고 BROUP BY 에서 작성

--ROLLUP함수 : 그룹별로 중간 집계를 처리하는 함수
-- 그룹별로 묶어진 값에 대한 '중간 집계'와 '총 집계'를 계산해서 자동으로 추가하는 함수
-- * 인자로 전닭받은 그룹중에서 가장 먼저 지정한 그룹별 합계와 총 합계를 구하는 함수

--EMPLOYEE 테이블에서
--각 부서에 소속된 직급 별 급여합
--부서별 급여 합
-- 전체 직원 급여 총합 조회

SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;

/*
--> EMPLOYEE 테이블에서 DEPT_CODE와 JOB_CODE 기준으로 SALARY 합계 구함
소계:특정그룹의합계 전체
부서코드가 동일한 모든 행의 합계
모든합계
그룹의 합계
부서 직급 월급합
D1	J6	6440000 <-- D1부서의 J6직급 급여 합계
D1	J7	1380000 <-- D1부서의 J7직급 급여 합계
D1	총합	7820000 <-- D1부서의 전체의 급여합계(소계)
D2	J4	6520000 <--D2부서의 J4 직급 급여 합계
D2	총합	6520000 <-- D2부서의 전체 급여 합계(소계)
D5	J3	3500000 <-- D5부서의 J3직급 급여 합계
D5	J5	8460000 <-- D5부서의 J5직급 급여 합계
D5	J7	3800000 <-- D5부서의 J7직급 급여 합계
D5	총합	15760000 <-- D5부서의 전체(J3,J5,J7)의 급여 합계(소계)
D6	J3	7300000 <-- D6부서의 J3직급 급여 합계
D6	J4	2800000 <-- D6부서의 J4직급 급여 합계
D6	총합	10100000 <-- D6부서의 전체(J3,J4)의 급여 합계(소계)
D8	J6	6986240 <-- D8부서의 J6직급 급여 합계
D8	총합	6986240 <-- D8부서의 전체(J6)의 급여 합계(소계)

카페의민족

빠나쁘레소 아메리카노 총매출
            카페라떼 총매출
            아메리카노 + 카페라떼 총 매출
            
멕아커피    아메리카노 총매출
            카페라떼 총매출
            아메리카노 + 카페라떼 총 매출
            
        */

-- CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수
-- * 그룹으로 지정된 모든 그룹에 대한 집계와 총합계를 함수

--EMPLOYEE 테이블에서
--각 부서에 마다 직급 별 급여합
--부서별 급여 합

SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY DEPT_CODE;

/*
CUBE는 ROLLUP 보다 더 포괄적인 집계 결과 생성
CUBE는 모든 가능한 모든 것을 조합하고 조합에 대한 결과와 종합 계산
부서    직급     SUM(SALARY)
D1	    J6	    6440000 <-- D1부서의 J6직급 급여 합계
D1	    J7	    1380000 <-- D1부서의 J7직급 급여 합계
D1	    총합  	7820000 <-- D1부서의 전체의 급여합계(소계)
D2	    J4	    6520000 <--D2부서의 J4 직급 급여 합계
D2	    총합  	6520000 <-- D2부서의 전체 급여 합계(소계)
D5	    J3	    3500000 <-- D5부서의 J3직급 급여 합계
D5	    J5	    8460000 <-- D5부서의 J5직급 급여 합계
D5	    J7	    3800000 <-- D5부서의 J7직급 급여 합계
D5	    총합	    15760000 <-- D5부서의 전체의 급여 합계(소계)
D6	    J3	    7300000 <-- D6부서의 J3직급 급여 합계
D6	    J4	    2800000 <-- D6부서의 J4직급 급여 합계
D6	    총합  	10100000 <-- D6부서의 전체의 급여 합계(소계)
D8	    J6	    6986240 <-- D8부서의 J6직급 급여 합계
D8	    총합	    6986240 <-- D8부서의 전체의 급여 합계(소계)
D9	    J1	    8000000 <-- D9부서의 J1직급 급여 합계
D9	    J2	    9700000 <-- D9부서의 J2직급 급여 합계
D9	    null	17700000 <--D9 부서의 전체(J1,J2)급여 합계(소계
null	J1	    8000000 <--모든 부서의 J1 직급 급여 합계
null	J2	    9700000 <--모든 부서의 J2 직급 급여 합계
null	J3	    10800000 <--모든 부서의 J3 직급 급여 합계
null	J4	    9320000 <--모든 부서의 J4 직급 급여 합계
null	J5	    8460000 <--모든 부서의 J5 직급 급여 합계
null	J6	    15746240 <--모든 부서의 J6 직급 급여 합계
null	J7	    8070000 <--모든 부서의 J7 직급 급여 합계
null	null	70096240 <-- 전체 데이터의 급여 합계(총계)
*/

--UNION INTERSECT MINUS


/****** 
집합 연산 (SET OPERATION)
여러 개의 SELECT 결과물을 하나의 쿼리로 만드는 연산자
여러가지 조건이 있을 때 그에 해당하는 여러개의 결과값을 결합시키고 싶을 때 사용
--장점:초보자들이 사용하기 좋음(조건을 덜 생각해도 됨)
--주의할점 : 집합 연산에 사용되는 SELECT문ㅇ느 SELECT절이 동일해야함

--UNION은 OR 같은 개념 --> 중복 제거
--INTERSECT AND 같은 개념
--MINUS는 차집합 같은 개념
--UNION ALL 은 OR 결과 값에 AND결과 값이 더해진 값 --> 중복이 제거되지 않은 채로 합쳐짐
********/

---- UNION : 여러개의 쿼리 결과를 하나로 합치는 연산자 ----
--중복된 영역을 제외하여 하나로 합침

--부서코드가 'D5'또는'D6'인 사원 이름, 부서코드 조회

--1)부서코드가 'D5'로 조회
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

UNION
--2)부서코드가 'D5'조회
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'

--UNION ALL : 여러개의 쿼리 결과를 하나로 합치는 연산자
--UNION과 차이점은 중복영역을 모두 포함

--부서코드가 'D5'이거나 급여가 300만 초과하는 사원의
--이름 부서코드 급여 조회(중복 포함)

--1)부서코드가 'D5'
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'

UNION ALL

--2)급여가 300만 초과
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;


--INTERSECT:여러개의 SELECT 한 결과에서 공통 부분만 결과로 추출

--부서코드가 'D5'이면서 급여가 300만 초과하는 사원의
--이름, 부서코드, 급여조회
--부서코드가'D5'
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

INTERSECT

--2) 급여가 300만원 초과
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMLOYEE
WHERE SALARY > 3000000;

-->INTERSECT 사용하지 않아도, GROUP BY WHERE 조건으로 구분지을 수 있음

--- MINUS : 선행 SELECT 결과에서 다음 SELECT 결과와 겹치는 부분을 제외한 나머지 부분만 추출 ---

--부서코드 D5 총 급여가 300만원 초과인 직워 ㄴ제외

--1)부서코드가 D5
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'

MINUS

--2) 급여가 300만원 초과
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMLOYEE
WHERE SALARY > 3000000;

-->MINUS사용하지 않아도 GROUP BY WHERE 조건으로 구분지을 수 있음

