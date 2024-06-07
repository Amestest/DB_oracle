/*
INDEX
--SQL SELECT 처리 속도를 향상 시키기 위해 컬럼에 대해 생성하는 객체

자동으로 정렬 및 검색 속도 증가

조회 시 테이블의 전체 내용을 확인하며 조회하는 것이 아니라 인덱스가
지정된 컬럼만 이용해서 조회하기 때문에 시스템 부하가 낮아짐

주의할 점

데이터 변경(INSERT,UPDATE,DELETE) 작업 시
시스템 과부하가 늘어 성능이 낮아짐

인덱스도 하나의 객체이다보니 별도 저장공간이 필요하기 때문에 메모리 소비

인덱스 생성시간 필요

[작성법]
생성하기
CREATE [UNIQUE] INDEX 인덱스명
ON 테이블명 (컬럼명[,컬럼명|함수명]);

삭제하기
DROP INDEX 인덱스명;

인덱스가 자동으로 생성되는 경우
PRIMARY KEY 또는 UNIQUE 제약 조건이 설정된 컬럼에 대해
UNIQUE INDEX가 자동 생성

*/

-- 인덱스 사용 방법 --> WHERE 절에 INDEX가 지정된 컬럼 언급

SELECT*FROM EMPLOYEE; -- 인덱스를 사용하지 않고 단순히 조회

SELECT* FROM EMPLOYEE WHERE EMP_ID ! = 0; --EMP_ID 라는 INDEX 를 사용한다는 의미
--> EMP_ID가 PRIMARY KEY로 정렬하는 숫자값으로 되어있기 때문에 가능

--> INDEX는 숫자로 무언가를 찾기 위한 값

--> 왜 없다고 하냐면 계정이 KH_WORKBOOK 이기 때문 --> KH_T 계정으로 변경