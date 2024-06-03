/*UPDATE 실습*/

--1. 직원 사원 번호 '200'의 이메일을 'sun_di_updated@or.kr'로, 전화번호를 '01012345678'로 변경
SELECT * FROM EMPLOYEE2 WHERE EMP_ID = '200';
UPDATE EMPLOYEE2 SET EMAIL='sun_di_updated@or.kr',PHONE='01012345678' WHERE EMP_ID='200';
--2. 부서 코드 'D1'에 속한 모든 직원의 급여를 10% 인상하고, 보너스율을 0.05 증가시키기
SELECT * FROM EMPLOYEE2 WHERE DEPT_CODE='D1';
UPDATE EMPLOYEE2 SET SALARY=SALARY*1.1,BONUS=BONUS+0.05 WHERE dept_code = 'D1';
--3. 직무 코드 'J2'를 가진 모든 직원의 직무 코드를 'J5'로, 부서 코드를 'D3'로 변경
UPDATE employee2 SET JOB_CODE='J5',DEPT_CODE='D3' WHERE JOB_CODE = 'J2'
--4. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기
UPDATE EMPLOYEE2 SET SALARY = SALARY + 1.05,BONUS= BONUS+0.02 WHERE HIRE_DATE > TO_DATE('2000-01-01','YYYY-MM-DD');
--5. 매니저 ID가 '200'인 모든 직원의 매니저 ID를 '210'으로, 부서 코드를 'D5'로 변경
UPDATE EMPLOYEE2 SET MANAGER_ID='210',DEPT_CODE='D5' WHERE MANAGER_ID='200';
--6. 모든 직원의 이메일 도메인을 'or.kr'에서 'company.com'으로 변경하고, 전화번호 형식을 '010-xxxx-xxxx'로 변경
UPDATE EMPLOYEE2 SET EMAIL = REPLACE(EMAIL,'or.kr','company.com'),PHONE='010-xxxx-xxxx';
--PHONE='010-'||SUBSTR(PHONE,4,4)||'-'||SUBSTR(PHONE,8));
--PHONE=REGEXP_REPLACE(PHONE,'(\d{3})(\d{4})(\d{4})','/1-/2-3');
--LIKE를 사용해서 변경
/*
SQL 오류: ORA-12899: value too large for column "KH_T"."EMPLOYEE2"."PHONE" (actual: 13, maximum: 12)
*/
--7. 급여 수준이 'S3'인 모든 직원의 급여를 4000000으로, 직무 코드를 'J4'로 수정
UPDATE EMPLOYEE2 SET SALARY=4000000,JOB_CODE = 'J4' WHERE SAL_LEVEL = 'S3'
--8. 입사일이 '1997-09-12'인 직원의 퇴사일을 '2024-09-12'로, 퇴사 여부를 'Y'로 변경
UPDATE EMPLOYEE2 SET ENT_DATE = TO_DATE('2024-09-12','YYYY-MM-DD'),ENT_YN='Y' WHERE HIRE_DATE =  TO_DATE('1998-09-12','YYYY-MM-DD');
--9. 이름이 '김영수'인 직원의 이름을 '김영호'로, 이메일을 'kim_yh@or.kr'로 변경
UPDATE EMPLOYEE2 SET EMP_NAME='김영호',EMAIL
--10. 전화번호가 '01045686656'인 직원의 전화번호를 '01198765432'로, 이메일을 'song_jk_updated@or.kr'로 변경

--11. 보너스율이 0.1인 모든 직원의 보너스율을 0.2로, 급여를 3200000으로 변경

--12. 주민등록번호가 '861015-1356452'인 직원의 급여를 3800000으로, 부서 코드를 'D7'으로 수정

--13. 모든 직원의 부서 코드를 'D9'로, 직무 코드를 'J1'로 변경

--14. 부서 코드 'D5'에 속한 모든 직원의 보너스율을 0.05 증가시키고, 전화번호를 '01011112222'로 변경

--15. 직무 코드 'J3'를 가진 모든 직원의 이메일을 'updated@or.kr'로, 급여 수준을 'S5'로 변경

--16. 모든 직원의 입사 연도를 '2023'로, 퇴사 여부를 'N'으로 변경
UPDATE EMPLOYEE2 SET HIRE_DATE=TO_DATE('2023'||TO_CHAR(HIRE_DATE,'-MM-DD'),'YYYY-MM-DD'),ENT_YN='N';
UPDATE EMPLOYEE2 SET HIRE_DATE='2023', ENT_YN='N';
--17. 보너스율이 0.15인 모든 직원의 보너스율을 0.25로, 급여를 4000000으로 변경

--18. 부서 코드 'D8'과 직무 코드 'J2'를 가진 모든 직원의 급여를 4500000으로, 전화번호를 '01022223333'으로 변경
UPDATE EMPLOYEE2 SET SALARY=4500000,PHONE='01022223333' WHERE DEPT_CODE='D8' AND JOB_CODE='J2';
--19. 모든 직원의 이메일 도메인을 'example.com'으로, 부서 코드를 'D10'으로 변경
UPDATE EMPLOYEE2 SET EMAIL = REPALCE(EMAIL,'or.kr','example.com'), DEPT_CODE ='D10'
--20. 이름이 '박민수'인 직원의 이름을 '박준수'로, 급여를 3500000으로 변경

--21. 부서 코드 'D3'에 속한 모든 직원의 급여를 3800000으로, 보너스율을 0.2로 수정

--22. 입사일이 2000-01-01 이후인 모든 직원의 급여를 5% 인상하고, 보너스율을 0.02 증가시키기

--23. 매니저 ID가 '201'인 모든 직원의 매니저 ID를 '211'으로, 부서 코드를 'D6'로 변경

--24. 모든 직원의 이메일 도메인을 'newcompany.com'으로, 전화번호 형식을 '011-xxxx-xxxx'로 변경
UPDATE EMPLOYEE2 SET EMAIL SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1||'@newcompany.com',PHONE='011-xxxx-xxxx';
--25. 부서 코드 'D4'에 속한 모든 직원의 보너스율을 0.1 증가시키고, 전화번호를 '01033334444'로 변경
UPDATE DEMPLOYEE2 SET BONUS = BONUS + 0.1, PHONE = '01033334444' WHERE QNTJZHEM