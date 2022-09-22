
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