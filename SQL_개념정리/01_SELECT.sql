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

/*

컬럼명 BETWEEN (A) AND (B)
--컬럼의 값이 A이상이면 B 이하면 TRUE 

컬럼명 NOT BETWEEN (A) AND (B)
--컬럼의 값이 A이상이면 B 이하면 FALSE
--컬럼의 값이 A미만 또는 B 초과시 TRUE
*/

-- 월급이 300이상 500이하 

SELECT EMP_NAME,SALARY FROM EMPLOYEE WHERE  SALARY BETWEEN 3000000 AND 5000000;

--월급이 300 미만이거나 500 초과
SELECT EMP_NAME,SALARY FROM EMPLOYEE WHERE  SALARY NOT BETWEEN 3000000 AND 5000000;

/*
WHERE OR 사용해서 값1,값2,값3, ... 과 같은 표시를 진행하기도 함

컬럼명 IN (값1,값2,값3, ...)
--컬럼의 값이 () 내 값과 일치하면 TRUE

컬럼명 NOT IN (값1,값2,값3, ...)
--컬럼의 값이 () 내 값과 일치하면 FALSE
--컬럼의 값이 () 내 값과 일치하면 않으면 TRUE
*/

---------------
/****OR 사용 ****/
--EMPLOYEE 테이블에서
--부서코드가 'D5' 'D6' 'D9'인 사원의
--이름, 부서코드,급여 조회 
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE WHERE DEPT_CODE= 'D5' OR DEPT_CODE='D6' OR DEPT_CODE='D9';
---------------
/****IN 사용 ****/
--EMPLOYEE 테이블에서
--부서코드가 'D5' 'D6' 'D9'인 사원의
--이름, 부서코드,급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE WHERE DEPT_CODE IN ('D5', 'D6', 'D9');
---------------
/****IN 사용 ****/
--EMPLOYEE 테이블에서
--부서코드가 'D5' 'D6' 'D9'이 아닌 사원의
--이름, 부서코드,급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE WHERE DEPT_CODE NOT IN ('D5', 'D6', 'D9');

/*
LIKE 
비교하려는 값이 특정한 패턴을 만족시키면 조회하는 연산자
WHERE 컬럼명 LIKE '패턴'

%(포함)
- %A : 문자열이 앞은 어떤 문자든 포함되고 마지막은 A 
    예 : %륨 검색창에 륨으로 끝나는 단어를 검색한 것과 비슷
- A% : 문자열에서 A로 시작하고 끝나는 것은 상관없음
    예 : %림% 검색창에 림으로 시작하는 단어를 검색한 것과 비슷
    
- %A% : 문자열 시작과 끝문자는 관계 없이 중간에 A가 들어가면 됨
    예 : %로% 검색창에 로가 중간에 들어가는 단어를 검색한 것과 비슷

- 글자수

- A_: A뒤에 아무거나 한 글자만 있는 문자열
    예 : AB. A1, AQ, A가
        가_: 가로 시작하는 두글자 단어만 검색
        나__: 나로 시작하는 세글자 단어만 검색
        
- _A : A앞에 아무거나 한 글자만 있는 문자열
    예 : BA, 1A, QA, 가A
        _가 : 가로 끝나는 두글자 단어만 검색
        __나 : 나로 끝나는 세글자 단어만 검색
*/

-- EMPLOYEE 에서 성이 전씨인 사원의 사번 이름 조회
SELECT EMP_NAME,EMP_ID FROM employee WHERE EMP_NAME LIKE '전%';
-- EMPLOYEE 에서 이름이 수로 끝나는 사원의 사번 이름 조회
SELECT EMP_NAME,EMP_ID FROM employee WHERE EMP_NAME LIKE '%수';
-- EMPLOYEE 에서 하가 포함되는 사원의 사번,이름 조회
SELECT EMP_NAME,EMP_ID FROM employee WHERE EMP_NAME LIKE '%하%';
-- EMPLOYEE 에서 이름이 전으로 시작하고 돈으로 끝나는 사원의 사번, 이름 조회
SELECT EMP_NAME,EMP_ID FROM employee WHERE EMP_NAME LIKE '전%돈';

/*
___ 세글자 의미

ESCAPE '#' : 구분을 지을 것이다
___LIKE사용하는 3글자만 찾으라는 의미로 구분짓는것
_% -> _로된 글자 찾기

__#_% __@%
_를 @ 처럼 사용하기 ㄹ원했기 때문에 중간 # 넣어준것

__#_% __돈%
_를 돈 처럼 사용하기 ㄹ원했기 때문에 중간 # 넣어준것

LIKE '__#@% ESCAPE # 에서 문자 그대로 @ 의미

^구분짓고 싶어요.
LIKE '___^_%' ESCAPE '^'

*구분짓고 싶어요
LIKE '___*_%' ESCAPE '*';
*/

/*
DUAL(DUmmy tAbLe)
DUmmy : 실제로 사용되지 않은 데이터
더미테이블 : 실제로 존재하지 않는 테이블
        -> 테이블 만들기는 번거롭고.. 뭔가 테스트나 사용은 해봐야겠고..
        -> 단순히 데이터를 조회하거나 확인할 때 사용
*/

-- 존재하지 않는 테이블을 이용해서 현재시간 확인하기
SELECT SYSDATE,SYSTIMESTAMP FROM DUAL;S

/*
WHERE 절 별칠 사용 불가 확인!
*/

--부서코드 D6 확인

SELECT EMP_NAME,DEPT_CODE AS"부서코드" FROM EMPLOYEE WHERE 부서코드='D6';

ORA-00904: "부서코드": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
7행, 64열에서 오류 발생

--> 부서코드 컬럼이 존재하지 않음
----> 별칭은 우리가 눈에 보기 좋게 작성하는 별칭일 뿐
------> WHERE절에서 찾는데 사용할 수 없음

/*
그러나!!
ORDER BY 절에서는 별칭 사용 가능!!
*/

SELECT EMP_NAME,SALARY*12 AS "연봉" FROM EMPLOYEE ORDER BY SALARY DESC;

-->ORDER BY는 무언가를 컬럼에서 찾아오는 것이 아니라나타난 정보를 오름차순으로 정렬할지 내림차순으로 정렬할지 정렬만 하기 때문에 별칭으로 사용할 수 있음

-- EMPLOYEE 테이블에서 이름,부서코드,급여를 부서코드 오름차순,급여내림차순조회
SELECT EMP_NAME,DEPT_CODE,SALARY FROM EMPLOYEE ORDER BY DEPT_CODE, SALARY DESC;
-- EMPLOYEE 테이블에서 이름,부서코드,직급코드(JOB_CODE)를 부서코드 오른차순 직급코드 내림차순 이름 오른차순으로, 활용해서 조회
SELECT EMP_NAME AS "이름",DEPT_CODE AS "부서코드",JOB_CODE AS"직급코드" FROM EMPLOYEE ORDER BY 부서코드 ASC,직급코드 DESC,이름;

/*

||연결 연산자
-- 문자열 이어쓰기
+나, 로 연결하지 않고 || 를 사용해서 연결
*/

SELECT EMP_ID||EMP_NAME FROM EMPLOYEE;


SELECT EMP_NAME||'의 월급은'||SALARY||'원 입니다.' FROM EMPLOYEE;

--사원의 이름과 이메일을 결합해서 조회
SELECT EMP_NAME||'('||EMAIL||')' FROM EMPLOYEE;

--사원의 이름과 전화번호를 - 사용해서 조회
SELECT EMP_NAME||'-'||EMAIL FROM EMPLOYEE; 
--사원의 사번과 부서코드를 - 사용해서 조회
SELECT EMP_NAME||'-'||DEPT_CODE FROM EMPLOYEE;
--사원의 이름과 급여를 이름:급여 형식으로 조회 AS 이름 : 급여
SELECT EMP_NAME||':'|| SALARY AS "이름:급여" FROM EMPLOYEE;
--사원의 이름 - 연봉 형식으로 조회
SELECT EMP_NAME ||' - '||SALARY *12 AS "이름-연봉" FROM EMPLOYEE;