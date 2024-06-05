/*
함수
컬럼값이나 지정된 값을 읽어 연산한 결과를 반환하는 것

단일 행 함수 : N 개의 행의 컬럼 값을 전달하여 N개의 결과가 반환

그룹 함수 : N 개의 행의 컬럼 값을 전달하여 1개의 결과가 반환
        (그룹의 수가 늘어나면 그룹의 수만큼 결과를 반환)
        
함수는 SELECT절, WHERE절, ORDER BY절, GROUP BY 절, HAVING절에서 사용가능

SELECT절 : 찾는 기준이 아닌, 눈으로 표기되는 총합,계산 결과 등에 대한 것을 눈으로 봤을 때 정리해놓은 컬럼
        -> 정리해서 보여주자!!
WHERE절 : 찾는 조건이 되는 행을 작성해줌 길이, 크기, 결과가 조건에 부합하는 결과만 볼 수 있도록 설정
        -> 내가 원하는 조건만 보여줘!


*/
/* 단일행 함수*/

-- 문자열 관련 함수

--LENGTH(문자열|컬럼형) : 문자열의 길이 반환
SELECT 'HELLO WORLD',LENGTH('HELLO WORLD')FROM DUAL;
--EMPLOYEE 테이블에서
-- 사원명, 이메일, 이메일 길이 조회
-- 이메일 길이 오름차순 조회
--12길이보다 이하인 이메일만 조회
SELECT EMP_NAME,EMAIL, LENGTH(EMAIL)AS"이메일 길이" FROM EMPLOYEE WHERE LENGTH(EMAIL) <=12 ORDER BY "이메일 길이";

--INSTR(문자열 | 컬러명. '찾을 문자열'[, 찾는 것을 시작할 위치[,순번]])

--찾을 시작 위치부터 지정된 순번째 찾은 문자열의 시작 위치를 반환

--LIKE와 INSTR 차이점
--LIKE 같은 경우 @ 들어갔는지 검색
--INSTR @ 몇번쨰에 있습니까?

--문자열에서 맨 앞에 있는 'B'의 위치를 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B') FROM DUAL;--DUAL 존재하지 않는 테이블로 어떤 값을 테스트 할 때 사용
-- ↑ B가 처음부터 쭉 글자를 봤을 때 몇 번째에 위치해 있는가? 처음 B가 나타나는 위치는?

--문자열에서 5번 부터 검색해서 처음 찾은'B'의 위치 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B',5) FROM DUAL;
--AABAA 5번쨰부터 B를 찾기 시작
--AABAACAABBAA 9번째 자리에서 B가 처음 나타났기 때문에 B는 9번째 자리에 위치한다 표시된 것

--문자열에서 5번 부터 검색 싲가해서 2번째로 찾은'B'의 위치 조회
SELECT 'AABAACAABBAA', INSTR('AABAACAABBAA','B',5,2) FROM DUAL;
--AABAA 5번쨰부터 B를 찾기 시작
--AABAACAABBAA 10번째 자리에서 B가 두 번째로 나타났기 때문에 B는 10번째 자리에 위치한다 표시된 것

--SUBSTR(문자열|컬럼명, 시작위치[,길이])
--문자열을 시작 위치부터 지정된 길이만큼 잘라내서 반환
--길이를 작성하지 않은 경우 시작 위치부터 끝까지 잘라내서 반환

--시작 위치, 자를 길이 지정
SELECT SUBSTR('ABCDE',2,3) FROM DUAL;
-->2번째 자리에 존재하는 B부터 시작해서 총 3가지를 가지고 오겠다 . B C D 를 가지고 오는 것

--시작위치만 지정 하고 자를 길이는 미지정
SELECT SUBSTR('ABCDE',4)FROM DUAL;
--> ABCD에서 4번재 자리에 위치한 D부터 시작해서 마지막까지 모두 가지고 오겠다는 것 D 다음에 있는 E까지 모두 가지고 온 것 DE

-- EMPLOYEE 테이블에서 사원명,이메일 아이디에서 @앞에 있는 아이디만 가지고 오고 이메일 아이디를 오름차순 조회
---> 외우기 손으로 작성할 때 한글자도 틀리리지 않고 작성
SELECT EMP_NAME,SUBSTR(EMAIL, 1,INSTR(EMAIL,'@')-1)AS"이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";

-- INSTR(EMAIL,'@') 이메일 주소에서 @위치를 찾음
-- 찾은 다음에 @ 가 표시되면 안되기 때문에 -1 설정을 해서 @ 제거

SELECT EMP_NAME,SUBSTR(EMAIL, 1,INSTR(EMAIL,'@'))AS"이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";

-- INSTR(EMAIL,1)을 작성하게 되면 나타나는 결과
SELECT EMP_NAME,SUBSTR(EMAIL, 1)AS"이메일 아이디" FROM EMPLOYEE ORDER BY "이메일 아이디";

--앞에서 부터 값을 가지고 올때는 +를 작성해주지만
--뒤에서 부터 값을 가지고 오길 원할 때는 -를 작성
SELECT EMP_ID,PHONE, SUBSTR(PHONE,-4) AS "마지막_네_자리" FROM EMPLOYEE WHERE PHONE IS NOT NULL;

/* ********* 숫자 관련 함수*********** */

-- COUNT 행의 총 개수를 셀 때 사용하는 함수

/*
COUNT 사용 방법
COUNT(*) : 조회된 모든 행의 개수 반환 
         -> 이름, 주소와 같은 항목이 몇개 있는가?
COUNT(컬럼명) : 지정된 컬럼 값이 NULL이 아닌 행의 개수 반환
                (NULL은 제외하고 개수를 작성하겠다는 의미)
                -> 00개 조회되었습니다. 검색한 내역 총 몇개인가
COUNT(DISTINCT 컬럼명):지정된 컬럼에서 중복 값을 제외한 행의 개수 반환

*/

-- EMPLOYEE 테이블 전체 행의 개수
SELECT COUNT(*) FROM EMPLOYEE;

-- 전화번호가 있는 사원의 수
SELECT COUNT(*) FROM EMPLOYEE WHERE PHONE IS NOT NULL;

--좀 더 가볍게 WHERE을 사용하지 않고
--전화번호가 있는 사원의 수
SELECT COUNT(PHONE) FROM EMPLOYEE;

--AVG평균
-- 모든 사원의 평균 급여 조회
SELECT AVG(SALARY) FROM EMPLOYEE;

--CEIL 올림
SELECT CEIL (AVG(SALARY)) FROM EMPLOYEE;
--FLOOR 내림
SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE;
--ROUND 반올림
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;
-- TRUNC 버림
SELECT TRUNC(AVG(SALARY))FROM EMPLOYEE;

--FLOOR 와 TRUNC 차이
---1) FLOOR: 주어진 숫자보다 작거나 가장 큰 정수를 반환
-----소수 부분은 무조건 버림
SELECT FLOOR(5.7) FROM DUAL;  -- 결과:5
SELECT FLOOR(-5.7) FROM DUAL;  -- 결과:-6
SELECT FLOOR(5.789,1) FROM DUAL; --에러발생 소수 표현 X
---2) TRUNC:숫자의 소수점을 잘라내는 역할
-----자르고자 하는 자릿수를 지정 지정하지 않으면 기본값 0
SELECT TRUNC(5.7) FROM DUAL;  -- 결과:5
SELECT TRUNC(-5.7) FROM DUAL;  -- 결과:-5
SELECT TRUNC(5.789,1) FROM DUAL; --결과:5.7
SELECT TRUNC(5.789,2) FROM DUAL; --결과:5.78
/*
*******TRIM ******
공백 관련 함수

TRIM([   [옵션] 문자열|컬럼명 FROM ]문자열|컬럼명)
주어진 문자열의 앞쪽 | 뒤쪽 | 양쪽에 존재하는 지정된 문자열 제거

--옵션 앞쪽(READING)
       뒤쪽(TRAILING)
       양쪽(BOTH 기본값)
*/
SELECT '  점   심  ',
        TRIM(LEADING '  ' FROM '   점    심    ') --앞쪽 공백 제거
FROM DUAL;
/*
TRIM 의 경우 문자열 1개 만 가능

LEADING '  ' 안에 스페이스바가 2번 들어감

ORA-30001: trim set should have only one character
30001. 00000 -  "trim set should have only one character"
*Cause:    Trim set contains more or less than 1 character. This is not
           allowed in TRIM function.
*/
SELECT '  점   심  ',
        TRIM(LEADING ' ' FROM '   점    심    ') --앞쪽 공백 제거
FROM DUAL;

SELECT '  점   심  ',
        TRIM(TRAILING ' ' FROM '   점    심    ') --뒤쪽 공백 제거
FROM DUAL;
--육안상 뒤쪽 공백 제거한 것이 보이지 않을수 있으나 뒤 공백이 제거된 상태에서 출력

SELECT '  점   심  ',
        TRIM(BOTH ' ' FROM '   점    심    ') --양쪽 공백 제거
FROM DUAL;

--앞쪽 뒤쪽 양쪽 공백제거 한번에 사용하기
SELECT '  점   심  ',
        TRIM(LEADING ' ' FROM '   점    심    '), --앞쪽 공백 제거
        TRIM(TRAILING ' ' FROM '   점    심    '), --뒤쪽 공백 제거
        TRIM(BOTH ' ' FROM '   점    심    ') --양쪽 공백 제거
FROM DUAL;

/*
REPLACE:특정 문자열을 대체할 때 사용

사용방법
(문자열|컬럼명, 찾을 문자열, 바꿀 분자열)
*/

--NATIONAL 테이블에서 한국으로 적혀잇는 글자를 대한민국으로 변경하기
SELECT*FROM NATIONAL;

SELECT national_code,NATIONAL_NAME,REPLACE(NATIONAL_NAME,'한국','대한민국') FROM NATIONAL;