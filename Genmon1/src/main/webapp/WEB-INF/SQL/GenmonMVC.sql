


---- *** 테스트용 회원테이블 생성 *** ----
create table tbl_member_test
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
,birthday           varchar2(10)             -- 생년월일   
,coin               number default 0         -- 코인액
,point              number default 0         -- 포인트 
,registerday        date default sysdate     -- 가입일자 
,lastpwdchangedate  date default sysdate     -- 마지막으로 암호를 변경한 날짜  
,status             number(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,idle               number(1) default 0 not null     -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint PK_tbl_member_userid primary key(userid)
,constraint UQ_tbl_member_email  unique(email)
,constraint CK_tbl_member_gender check( gender in('1','2') )
,constraint CK_tbl_member_status check( status in(0,1) )
,constraint CK_tbl_member_idle check( idle in(0,1) )
);
-- Table TBL_MEMBER이(가) 생성되었습니다.


insert into tbl_member_test(userid, pwd, name, email, mobile, postcode, address, detailaddress, 
                            extraaddress, gender, birthday ) 
                    values ('kimhw', 'qWer1234$', '김혜원', 'kimhw@gmail.com', '01012345678', '14547', '제주특별자치도 제주시 첨단로 242', '1동', ' (영평동)', '2', '2000-01-01' );
                    
                    
select *
from tbl_member_test;

show user;

select * from tab;



create table tbl_login_history_test
( fk_userid      varchar2(40)         not null  -- 회원아이디
, logindate      date default sysdate not null
, clientip       varchar2(20)         not null  -- 123.456.789.123
, constraint     FK_tbl_login_history_fk_userid foreign key(fk_userid) references tbl_member_test(userid)
);
Table TBL_LOGIN_HISTORY이(가) 생성되었습니다.
                    
delete table TBL_LOGIN_HISTORY