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
