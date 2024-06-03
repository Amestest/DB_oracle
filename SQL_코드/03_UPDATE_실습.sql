/* UPDATE 실습*/

--D1 인사관리부 -> 인사팀으로 변경
UPDATE department2 SET dept_title = '인사팀' WHERE dept_id ='D1';
SELECT*FROM department2 WHERE dept_id='D1';
--D3 마케팅부 -> 마케팅팀 변경
UPDATE department2 SET dept_title = '마케팅팀' WHERE dept_id='D3';
SELECT*FROM department2 WHERE dept_id='D3';
--D8 기술지원부 -> 기술지원팀 변경
UPDATE department2 SET dept_title = '기술지원팀' WHERE dept_id='D8';
SELECT*FROM department2 WHERE dept_id='D8';

SELECT*FROM department2;

--수정된 내용을 저장하길 원한다면 COMMIT
--저장하지 않길 원한다면 ROLLBACK;
COMMIT;

--EMPLOYEE2 테이블에서 BONUS를 받지 않은 사원의
--BONUS를 0.1로 변경
UPDATE EMPLOYEE2 SET BONUS =0.1 WHERE BONUS IS NULL;

--변경 후 EMP_NAME, BONUS 모두 조회
SELECT EMP_NAME,BONUS FROM employee2;

ROLLBACK;

--모든 직원의 기본급여 인상 EMPLOYEE2
UPDATE employee2 SET salary= SALARY*1.1;
SELECT EMP_NAME,SALARY FROM employee2;
--D9부서의 모든 직원의 보너스를 0,4로 수정 EMPLOYEE2
UPDATE employee2 SET BONUS=0.4 WHERE dept_code='D9';
SELECT DEPT_CODE,bonus FROM employee2;

-- DEPT_CODE 가 NULL 인 직원은 D3부터로 이동
UPDATE employee2 SET DEPT_CODE='D3' WHERE dept_code IS NULL;
SELECT * FROM employee2;
--특정 입사일(2000-01-01) 이후 입사한 직원의 급여 수정
--HIER_DATE
UPDATE employee2 SET salary=salary+1000000 WHERE hire_date>TO_DATE('2000-01-01','YYYY-MM-DD');
--1997-09-12에 입사한 직원 퇴사처리
--ENY_YN
UPDATE employee2 SET ENY_YN='Y' WHERE hire_date= TO_DATE('1997-09-12','YYYY-MM-DD');

ROLLBACK;--UPDATE 모두 취소

SELECT EMP_NAME,EMAIL FROM employee2;
--특정 도메인 주소 변경
UPDATE EMPLOYEE2 SET EMAIL = REPLACE(EMAIL,'or.kr','KH.KH');

SELECT EMP_NAME,EMAIL FROM employee2;

--핸드폰번호 EMPLOYEE2 에서 010뒤에 -붙여서 변경
UPDATE employee2 SET PHONE = REPLACE(PHONE,'010','010-');
SELECT EMP_NAME,PHONE FROM employee2;
--LIKE --> 무조건 맨앞이 010이어야하고 중간에 오는 010은 변경 안됨
UPDATE employee2 SET PHONE = REPLACE(PHONE,'010','010-')WHERE PHONE LIKE '010%';
ROLLBACK;
SELECT *FROM employee2;
/*
"EMPLOYEE2"."PHONE" (actual: 13, maximum: 12)
->행 최대 크기 12자리로 설정해줬기 때문에 나중에 발생하는 에러
-->행 최대 크기를 늘리거나 다시 돌아가기 ROLLBACK 설정
*/

--특정 입사일을 가진 직원의 입사일 변경
--1999-09-09 입사한직원 -> 2000-01-02
UPDATE EMPLOYEE2 SET HIRE_DATE= TO_DATE('2000-01-02','YYYY-MM-DD')WHERE HIRE_DATE=TO_DATE('1999-09-09','YYYY-MM-DD');

COMMIT;

SELECT*FROM department2;

UPDATE department2 SET DEPT_TITLE = '인사팀';

SELECT*FROM department2;

ROLLBACK;


-- UPDATE 한 번에 여러컬럼 업데이트

--진행하기전 EMPOLYEE3 만들기 CREATE TABLE EPLOYEE 복사
CREATE TABLE EMPLOYEE3 AS SELECT*FROM EMPLOYEE;

-- EMP_ID가 200인 직원의 이메일과 전화번호 업데이트
UPDATE EMPLOYEE3 SET EMAIL='ONE_SUN@or.kr', PHONE = '01012345678' WHERE EMP_ID = '200';

SELECT EMP_ID,EMAIL,PHONE FROM EMPLOYEE3 WHERE EMP_ID='200';

ROLLBACK;

--D9 부서의 모든 직원의 급여*1.1 보너스=0.2 변경
UPDATE EMPLOYEE3 SET SALARY=SALARY*1.1,BONUS=0.2 WHERE DEPT_CODE ='D9';
--J3 직무 코드를 가진 지구언의 직무코드와 부서코드 변경
--J5 D5
UPDATE employee3 SET JOB_CODE='J5',DEPT_CODE='D5' WHERE JOB_CODE='J3';
--송은희 직원의 이름과 이메일 변경
--송은휘 SONGSONG@or.kr
UPDATE EMPLOYEE3 SET EMP_NAME = '송은휘',EMAIL='SONGSONG@or.kr' WHERE EMP_NAME = '송은희';

ROLLBACK;

--차태연 직원의 이름과 급여변경
--> 차태형 8000000
UPDATE employee3 SET emp_name ='차태형',SALARY=8000000 WHERE emp_name ='차태연';
SELECT * FROM employee3;
-->EMPLOYEE3에 해당하는 모든 직원의 이메일 도메인과 부서코드 D4 변경
UPDATE employee3 SET email = REPLACE(email,'or.kr','kh.kh'),DEPT_CODE='D4';
SELECT * FROM EMPLOYEE3;

ROLLBACK;

--EMPLOYEE3 전체 테이블 삭제
DELETE FROM EMPLOYEE3;

--완전삭제 --> COMMIT;

--되돌리기 --> ROLLBACK;
COMMIT;

SELECT * FROM EMPLOYEE2;

DROP TABLE EMPLOYEE3;

COMMIT;