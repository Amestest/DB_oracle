/*춘 대학교 탐방기*/
--1. 춘 기술대학교 학과 이름과 계열 조회
-- 컬럼명 학과명 계열로 표시

SELECT department_name AS "학과명", category "계열"
FROM TB_DEPARTMENT;

--2. 학과의 학과 정원을 조회
SELECT DEPARTMENT_NAME || '의 정원은'|| CAPACITY||'명 입니다.'
FROM tb_department;

--3. 국문학과에 다니는 여학생 중에 현재 휴학생 중인 여학생 조회
-- 국문학과 코드 DEPARTMENT_NO 001

SELECT * FROM TB_STUDENT;

SELECT STUDENT_NAME 
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN,8, 1)='2'
AND ABSENCE_YN = 'Y'
AND DEPARTMENT_NO = '001';


--3.5
-- 도서관에서 대출 도서 장기 연체자들을 찾아 이름 계시하고자하낟
------ 그 대상자들의 학번이 다음과 같을 때 대상자를 찾는 적절한 SQL 쿼리 구문
--A513079, A513090 A513091 A513110 A513119
--WHERE IN 학생이름 내림차순
--TB_STUDENT

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090',' A513091',' A513110',' A513119')
ORDER BY STUDENT_NAME DESC;



--4. 입학 정원이 20명이상 30명 이하인 학과들의 학과 이름과 계열 조회
SELECT DEPARTMENT_NAME, CATEGORY
FROM tb_department
WHERE CAPACITY BETWEEN 20 AND 30;

--5.
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속학과를 가지고 있음
-- 춘 기술대학교 총장의 이름을 알아 낼 수 있는 SQL 문장 작성 총장은 NULL
SELECT * FROM TB_PROFESSOR;


SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE department_no IS NULL;


-- 7. 수강신청을 하려고 한다. 선수과목 여부를 확인하는데
-- 선수과목이 존재하는 과목들은 어떤과목인지 과목번호 조회
SELECT * FROM TB_CLASS;

SELECT CLASS_NO,CLASS_NAME
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--8.DSTINCT 활용해서
--춘 대학에는 어떤 카테고리 들어 있는지 조회
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY CATEGORY; --ORDER BY 1;

--9.
-- 영문학과(학과코드 002) 학생들의 학번과 이름, 입학년도를
-- 입학년도가 빠른 순으로 표시
-- AS "학번" AS"이름" AS"입학년도"
SELECT STUDENT_NAME AS "이름",STUDENT_NO AS "학번",TO_CHAR(ENTERANCE_DATE,'YYYY-MM-DD') AS "입학년도"
FROM TB_STUDENT
WHERE department_no = '002'
ORDER BY ENTERACE_DATE ASC;
--10
-- 춘 대학교 교수 중 이름이 세글자가 아닌 교수가 두명 있음
-- 그 교수의 이름과 주민번호 조회
-- FROM TB_PROFESSOR WHERE LIKE 
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM tb_professor
WHERE professor_name NOT LIKE '___';


--14
-- 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되었음
---2000년도 이전 학번을 받은 학생들의 학번과 이름 조회
--STUDENT_NO, STUDENT_NAME
--FROM TB_STUDENT
SELECT STUDENT_NO ,STUDNET_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';


--15
--학번이 A517178인 한아름 학생의 학점 총 평점 구하기
SELECT * FROM TB_GRADE;
SELECT ROUND(AVG(POINT))AS "평점"
FROM TB_GRADE
WHERE student_no = 'A517178';

-->소수점 제거 소수점 몇자리까지 표기
--->소수점 1자리까지 표기
-----> ROUND(AVG(POINT).1)
--17
--지도교수를 배정받지 못한 학생의 수 조회
--TB_STUDENT 에서 COACH_PROFESSOR
SELECT COUNT(*)
FROM TB_STUDENT
WHERE coach_professor_no IS NULL;

--18
--- 학번이 A112113인 김고운 학생의 년도 별 평점
---- 화면 AS년도 AS년도 별 평점
------- 점수는 반올림해서 소수점 한자리까지만 표기
SELECT * FROM TB_GRADE;
SELECT SUBSTR(TERM_NO,1,4)AS "년도",ROUND(AVG(POINT),1)AS "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

--20
--춘 대학교에 다니는 동명이인 학생들의 이름, 동명인 수 조회
--FROM TB_STUDENT
SELECT STUDENT_NAME AS "동일이름",COUNT(*) AS "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) >1
ORDER BY 1;