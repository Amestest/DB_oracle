/*계정(사용자)

    * 관리자 계정 : 데이터베이스의 생성과 고나리르 ㄹ담당하는 계정
                    모든 권한과 책임을 가지는 계정
                        SYS(최고관리자),SYSTEM(SYS에서 권한 몇 개 제외된 관리자)
                        
    * 사용자 계정 : 데이터베이스에 대해 질의,갱신,보고서 작성 등의
                    작업을 수행할 수 잇는 계정으로
                    업무에 필욯나 최소한의 권한만을 가지는 것을 원칙으로 함
                    ex)kh_t,kh_workbook 등

*/

/*
DCL(Data Cotrol Language):
계정 DB, DB객체에 대한 접근 권한을 부여하고 회수하는 언어
 - GRANT:권한 부여
 - REVOKE:권한 회수
 
    *권한의 종류
    
    1) 시스템 권한 :DB접속,객체 생성 권한
    CREATE USER :사용자(계정)생성 권한
    CREATE TABLE:테이블 생성 권한
    CREATE SESSTION:데이터베이스 접속 권한
    CREATE VIEW:뷰 생성 권한
    CREATE SEQUENCE:시퀀스 생성 권한
    CREATE PROCEDURE:함수(프로시저)생성 권한
    DROP USER:사용자(계정) 삭제 권한
    DROP ANY TABLE:임의 테이블 삭제 권한
    
    2) GRANT/REVOKE 사용 권한
    GRANT 권한명, 권한명 TO 계정명;

    계정에 권한을 부여할 때 하나만 부여할 경우
    GRANT 권한 TO 계정명;
    
    계정에 권한을 부여할 때 두 가지 이상 부여할 경우(, 사용해서 작성)
    GRANT 권한,권한 TO 계정명;
    
    대표적
    CONNECT:사용자 데이터베이스에 접속 가능하도록 하기 위해 설정
            ->권한 8가지 묶음 패키지
            SESSION(CREATE ALTER),CLUSTER,LINK,SEQUENCE,SYNONYM,TABLE,VIEW
    RESOURCE: 사용자가 객체(테이블,뷰,인덱스)를 생성할 수 있도록 하기 위해 시스템 권한을 묶어 놓음
            -> 권한 5가지 묶음 패키지
             CLUSTER,PROCEDURE,SEQUENCE, TABLE,TRIGGER
    
    DBA : 시스템 관리에 필요한 모든 권한을 부여하는 강력한 설정(최고 설정)
*/

--[사용자 계정 생성하기]
CREATE USER 사용자명 IDENTIFIED BY 비밀번호;

--[생성한 사용자 계정에 접속 권한 부여하기]
GRANT 부여할권한 TO 계정명;