/*
LOWER / UPPER INITCAP

컬럼의 문자 혹은 문자열을 소문자 대문자 첫글자만 대문자로 변환해서 반환


*/

-- 사용법 LOWER : 모두 소문자로 변환해서 적용

SELECT LOWER('wELCOM tO mY wORLD')
FROM DUAL; --결과:welcom to my world

-- 사용법 UPPER : 모두 대문자로 변환해서 적용
SELECT UPPER('wELCOM tO mY wORLD')
FROM DUAL;--결과:WELCOM TO MY WORLD

-- 사용법 INITCAP : 모두 대문자로 변환해서 적용
SELECT INITCAP('wELCOM tO mY wORLD')
FROM DUAL; --결과:Welcom To My World

--문자 처리 함수 CONCAT
/*
CONCAT : 컬럼의 문자 혹은 문자열을 두 개 전달받아 하나로 합친 후 반환
[작성법]
CONCAT(STRING, STRING)
*/

-- 가상테이블 사용해서 확인
SELECT CONCAT('가나다라','ABCD')FROM DUAL;

SELECT '가나다라'||'ABCD' FROM DUAL;

/********CONCAT 함수 || 연산자 차이

CONCAT:두 개의 문자열을 결합 두 개 이상은 불가
      성 + 이름 붙일 때
[작성법]
CONCAT(string1,string2)
      
|| : 두 개 이상의 문자열을 결합할 때 사용      
[작성법]
string1||string2||string3 ... 여러개 결합 가능


**********/