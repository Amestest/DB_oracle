/*
형변환(Parsing)함수

--문자열(CHAR,VARCHAR2)<->숫자(NUMBER)
--문자열(CHAR,VARCHAR2)<->날짜(DATE)
--숫자(NUMBER)----------->날짜(DATE)
*/

/*
TO_CHAR(날짜|숫자[,포멧]):문자열로 변환

숫자->문자열
포맷
1) 9:숫자 한 칸 의미, 오른쪽 정렬
2) 0:숫자 한 칸 의미, 오른쪽 정렬, 빈칸에 0을 추가
3) L:현재 시스템이나 DB에 설정된 나라의 화폐 기호
4) ,:숫자의 자릿수 구분
*/

--DUAL 가상 테이블을 이용해서 조회
SELECT 1234, TO_CHAR(1234) FROM DUAL;-- 데이터 타입 변경->문자열

SELECT 1234, TO_CHAR(1234,'99999999') FROM DUAL;--'     1234'앞에 공백 4칸 생성
--9를 사용하지 않으면 기본으로 왼쪽 정렬 9의 반대는 아무것도 작성하지 않는 것

SELECT 1234, TO_CHAR(1234,'00000000') FROM DUAL; --'00001234'앞에 0이 4칸 생성

--숫자-> 문자열 변환시 주의사항
-->지정된 칸 수가 숫자 길이보다 적으면 전부 # 변환돼서 출력

SELECT 1234, TO_CHAR(1234,'000')FROM DUAL; 
-- 지정된 자리 값보다 변환해야하는 값의 길이가 더 크기 때문에 ### 출력
SELECT 1234, TO_CHAR(1234,'999')FROM DUAL; 


-- 화폐기호 + 자릿수 구분
SELECT 
        TO_CHAR(123456789,'L999999999'),--L 9아홉개
        TO_CHAR(123456789,'$999999999'),--$ 9아홉개
        TO_CHAR(123456789,'$999,999,999')--# 9아홉개
FROM DUAL; --          SELECT 
        TO_CHAR(123456789,'L999999999'),--L 9아홉개
        TO_CHAR(123456789,'$999999999'),--$ 9아홉개
        TO_CHAR(123456789,'$999,999,999')--# 9아홉개
FROM DUAL;   --123456789	 $123456789	 $123,456,789
--L 의 경우 현재 시스템에서 사용하는 화폐 단위 기호 한국 = ￦

--모든 사원의 연봉 조회
--현재 화폐 단위, 사용해서 조회
--FROM EMPLOYEE
SELECT EMP_NAME,TO_CHAR(SALARY*12,'L999,999,999') AS "연봉" FROM EMPLOYEE;

--DUAL 테이블 사용해서 현재 날짜(SYSDATE) YYYY-MM--DD
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;

--DUAL 테이블 사용해서 현재 날짜(SYSDATE) 2024-06-05 수요일
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD DAY') FROM DUAL;

--DUAL 테이블 사용해서 현재 날짜(SYSDATE) 2024-06-05 (수)
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD (DY)') FROM DUAL;

--DUAL 테이블 사용해서 현재 날짜(SYSDATE) 2024-06-05 (수) 오전 시:분:초
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD (DY) AM HH:MI:SS') FROM DUAL;

--DUAL 테이블 사용해서 현재 날짜(SYSDATE) 2024년06월05일 오전 00시 00분 00초
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일" AM HH"시"MI "분" SS"초"') FROM DAUL;

/*
TO_DATE(문자열|숫자ㅔ,포맷])
--문자열 또는 숫자를 날짜 형식 변환
*/

--DUAL 가상 테이브 ㄹ문자열 이 날짜를 표현한느 형식이면 형식 지정 없이 바로 변경 가능
SELECT TO_DATE('2024-05-05') FROM DUAL;

-- 날짜 - 월 -년 표기
SELECT TO_DATE('06-05-2024','DD-MM-YYYY') FROM DUAL;
--TO_DATE 형식으로 년/월/일 변경하겠다. 
--06-05-2024-> 24/05/05

SELECT TO_DATE('05월 27일 월요일 12시 50분','MM"월" DD"일" DAY HH"시"MI"분"') FROM DUAL;
--TO_DATE 형식 년/월/일 변경하겠다 
--05월 27일 월요일 12시 50분 -> 24/05/27

--숫자->날짜
SELECT TO_DATE(20240605,'YYYYMMDD')FROM DUAL;

--RR YY 차이점
--연도가 두 자리만 작성이 되어 있느 ㄴ경우
--50미만 : Y 현재 세기(2000년대 기준 이후) R 이전 세기(1900년대 기준)
--50미만 : Y,R 둘다 누락된 연도 앞부분에 현재 2000년대 세기 추가


--연도가 앞 두자리 누락 50년 대 기준으로 살펴봄

--1) 50년대 미만 확인

SELECT
        TO_DATE('49-12-01','YY-MM-DD')AS "YY", --2049
        TO_DATE('49-12-01','RR-MM-DD')AS "RR"  --2049
FROM DUAL;

--2) 50년대 이상 확인
SELECT
        TO_DATE('50-12-01','YY-MM-DD')AS "YY", --2050
        TO_DATE('50-12-01','RR-MM-DD')AS "RR"  --1950
FROM DUAL;