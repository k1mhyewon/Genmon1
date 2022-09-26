
show user; 
-- USER이(가) "SYS"입니다.

-- 오라클 계정생성시 계정명앞에 c## 을 붙이지 않고 생성하도록 하겠다.
alter session set "_ORACLE_SCRIPT" = true;
-- Session이(가) 변경되었습니다.
-- 그러면 이제부터는 계정생성시 c## 없이 계정 생성이 가능하다.

create user SEMI_ORAUSER1 identified by aclass default tablespace users;
-- User SEMI_ORAUSER1(가) 생성되었습니다.

-- 새접속에서 oracle접속을 만든다. 

grant connect, resource, create view, unlimited tablespace to semi_orauser1;
-- Grant을(를) 성공했습니다.


show user;
-- USER이(가) "SEMI_ORAUSER1"입니다.

select *
from tbl_member_test;

SELECT * FROM TAB;

drop table tbl_member_test purge;


-----------------------------------------------------------------------------------------

---- *** 회원테이블 생성 *** ----
create table tbl_member
(userid             varchar2(40)   not null  -- 회원아이디
,pwd                varchar2(200)  not null  -- 비밀번호 (SHA-256 암호화 대상)
,name               varchar2(30)   not null  -- 회원명
,email              varchar2(200)  not null  -- 이메일 (AES-256 암호화/복호화 대상)
,mobile             varchar2(200)            -- 연락처 (AES-256 암호화/복호화 대상) 
,postcode           varchar2(5)              -- 우편번호
,address            varchar2(200)            -- 주소
,detailaddress      varchar2(200)            -- 상세주소
,extraaddress       varchar2(200)            -- 참고항목
,gender             varchar2(1)              -- 성별   남자:1  / 여자:2
,birthdate           varchar2(10)             -- 생년월일   
,coin               number default 0         -- 코인액
,point              number default 0         -- 포인트 
,registerdate        date default sysdate     -- 가입일자 
,lastpwdchangedate  date default sysdate     -- 마지막으로 암호를 변경한 날짜  
,status             number(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,idle               number(1) default 0 not null     -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint PK_tbl_member_userid primary key(userid)
,constraint UQ_tbl_member_email  unique(email)
,constraint CK_tbl_member_gender check( gender in('1','2') )
,constraint CK_tbl_member_status check( status in(0,1) )
,constraint CK_tbl_member_idle check( idle in(0,1) )
);

-----------------------------------------------------------------------------------------




