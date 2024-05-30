-- 자동정렬 단축키 CTRL + F7
-- 작성한 시트 모두 실행 F5
-- MENU 테이블 생성
CREATE TABLE menu (
    menu_id    NUMBER(10, 0) PRIMARY KEY, --메뉴 ID(기본 키)
    menu_name  VARCHAR2(100 BYTE), --메뉴이름
    menu_desc  VARCHAR2(255 BYTE),--메뉴설명
    menu_price NUMBER(10, 2)
);
--INSERT DATA 집어넣기
INSERT INTO menu (
    menu_id,
    menu_name,
    mneu_desc,
    menu_price
) VALUES (
    1,
    '아메리카노',
    '신선한 원두로 만든 아메리카노',
    3000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    mneu_desc,
    menu_price
) VALUES (
    2,
    '카페라떼',
    '부드러운 우유가 들어간 라떼',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    mneu_desc,
    menu_price
) VALUES (
    3,
    '카푸치노',
    '진한 커피와 커품이 어우러진 카푸치노',
    3500
);

INSERT INTO menu (
    menu_id,
    menu_name,
    mneu_desc,
    menu_price
) VALUES (
    4,
    '카레멜 마키아토',
    '달콤한 카라멜 시럽이 들어간 마키아토 ',
    4000
);

INSERT INTO menu (
    menu_id,
    menu_name,
    mneu_desc,
    menu_price
) VALUES (
    5,
    '에스프레소',
    '강한 맛과 향의 에스프레소',
    2500
);

--menu 테이블
--메뉴이름 맨 앞에 카 가 들어간 메뉴 출력
SELECT * FROM MENU WHERE MENU_NAME LIKE '카%';
--menu_price 3500 인 메뉴들 출력
SELECT * FROM MENU WHERE MENU_PRICE = 3500;
--키오스크에서 1을 눌렀을때 나올 메뉴 출력
SELECT * FROM MENU WHERE MENU_ID = 1;
-- 특정 단어가 포함된 메뉴 설명 조회 카라멜
SELECT MENU_NAME, MENU_DESC, MENU_PRICE FROM MENU WHERE MENU_DESC LIKE '%카라멜%';
--가격이 낮은 순으로 메뉴 조회
SELECT MENU_NAME, MENU_DESC,MENU_PRICE FROM MENU WHERE MENU_PRICE ASC;