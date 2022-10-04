---- *** 회원테이블 생성 *** ----
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


create table tbl_login_history
( fk_userid      varchar2(40)         not null  -- 회원아이디
, logindate      date default sysdate not null
, clientip       varchar2(20)         not null  -- 123.456.789.123
, constraint     FK_tbl_login_history_fk_userid foreign key(fk_userid) references tbl_member(userid)
);
-- Table TBL_LOGIN_HISTORY이(가) 생성되었습니다.


-- tbl_basket_test 장바구니 테이블 (회원)
create table tbl_basket_test
(fk_pnum        number(8)               not null
,fk_userid      varchar2(40)            not null
,qty            number(3)               not null
,updateDate     date default sysdate    not null
,constraint PK_tbl_basket_test_fk_pnum_fk_userid primary key (fk_pnum, fk_userid)
,constraint FK_tbl_basket_test_fk_pnum foreign key(fk_pnum) references tbl_all_product_test(pnum)
,constraint FK_tbl_basket_test_fk_userid foreign key(fk_userid) references tbl_member_test(userid)
)
-- Table TBL_BASKET_TEST이(가) 생성되었습니다.


-- tbl_order_test 주문하기 테이블
create table tbl_order_test
(pk_orderid         number(20)     not null
,fk_userid          varchar2(40)  -- 비회원 주문 가능
,email              varchar2(200)  not null
,name               varchar2(30)   not null
,postcode           varchar2(5)   not null
,address            varchar2(200) not null
,detailaddress      varchar2(200) not null
,extraaddress       varchar2(200) 
,mobile             varchar2(200) not null
,orderDate          date default sysdate not null
,constraint PK_tbl_order_test_pk_orderid primary key(pk_orderid)
,constraint PK_tbl_order_test_fk_userid foreign key(fk_userid) references tbl_member_test (userid)
);
-- Table TBL_ORDER_TEST이(가) 생성되었습니다.

-- tbl_order_detail_test 주문하기 상세테이블
create table tbl_order_detail_test
(pk_order_detail_id number(30)  not null
,fk_orderid         number(20)  not null
,fk_pnum            number(8)   not null
,order_status       number(1) default 1 not null -- 주문 상태 1주문 2취소(반품) 3교환
,order_price        number(10)  not null
,constraint PK_tbl_order_detail_test_pk_order_detail_id primary key(pk_order_detail_id)
,constraint FK_tbl_order_detail_test_fk_orderid foreign key(fk_orderid) references tbl_order_test (pk_orderid)
,constraint FK_tbl_order_detail_test_fk_pnum foreign key(fk_pnum) references tbl_all_product_test (pnum)
);

-- tbl_purchase_test 결제하기 테이블
create table tbl_purchase_test
(pk_purchaseid    number(20) not null
,fk_orderid     number(20) not null
,status         number(1) not null -- 결제 전 0/ 결제 완료 1
,paymentAmount  number(12) not null -- 적립금, 포인트 제외하고 총가격
,method         number(1) not null  -- 카드 1, 무통장 2
,purchaseDate   date 
,usedCoin       number(10)
,usedPoint      number(10) -- 포인트 먼저 차감
,constraint PK_tbl_purchase_test_pk_purchase primary key(pk_purchaseid)
,constraint FK_tbl_purchase_test_fk_userid foreign key(fk_orderid) references tbl_order_test(pk_orderid)
,constraint CK_tbl_purchase_test_status check( status in(0,1) )
);
-- Table TBL_PURCHASE_TEST이(가) 생성되었습니다.

-- tbl_refund_account_test 환불 계좌 테이블 (무통일때만)
create table tbl_refund_account_test
(fk_purchaseid      number(20)     not null
,bank               varchar2(20)  not null
,accnum             varchar2(30)  not null
,accname               varchar2(30)   not null
,constraint FK_tbl_refund_account_test_fk_purchaseid foreign key(fk_purchaseid) references tbl_purchase_test (pk_purchaseid)
);
-- Table TBL_REFUND_ACCOUNT_TEST이(가) 생성되었습니다.

-- tbl_product_test 상품(부모) 테이블
create table tbl_product_test
(pid        varchar2(8) not null      -- 상품id(Primary Key)
,pname          varchar2(100) not null   -- 상품명
,price          number(10) default 0     -- 상품 정가
,pcontent       varchar2(4000)           -- 상품설명  varchar2는 varchar2(4000) 최대값이므로
                                         --          4000 byte 를 초과하는 경우 clob 를 사용한다.
                                         --          clob 는 최대 4GB 까지 지원한다.
,pmaterial      varchar2(20) not null
,constraint  PK_tbl_product_pid primary key(pid)
);


-- tbl_all_product_test 상품(자식) 테이블
create table tbl_all_product_test
(pnum           number(8) not null         -- 상품일련번호(Primary Key)
,fk_pid         varchar2(8) not null       -- 상품id(Foreign Key)
,pcolor         varchar2(8) not null       -- 상품 색상
,pimage1        varchar2(100) default 'noimage.png' -- 대표상품이미지   이미지파일명
,salePcnt       number(10) default 0      -- 상품 할인율(할인해서 팔 것이므로)
,pqty           number(8) default 0       -- 상품 재고량                                         
,preleasedate   date                      -- 상품출시일
,constraint  PK_tbl_product_pnum primary key(pnum)
,constraint  FK_tbl_product_fk_pid foreign key(fk_pid) references tbl_product_test(pid)
);



-- tbl_product_imagefile_test 상품이미지 테이블
create table tbl_product_imagefile_test
(imgfileno     number         not null   -- 시퀀스로 입력받음.
,fk_pnum       number(8)      not null   -- 제품번호(foreign key)
,imgfilename   varchar2(100)  not null   -- 제품이미지파일명
,constraint PK_tbl_product_imagefile primary key(imgfileno)
,constraint FK_tbl_product_imagefile foreign key(fk_pnum) references tbl_all_product_test(pnum) on delete cascade 
);


-- tbl_wishlist_test 위시리스트 테이블
create table tbl_wishlist_test
( fk_userid    varchar2(40)   not null
, fk_pnum      number(8) not null
, add_date     date default sysdate
, constraint  FK_tbl_wishlist_test_fk_userid foreign key(fk_userid) references tbl_member_test(userid)
, constraint  FK_tbl_wishlist_test_fk_pnum foreign key(fk_pnum) references tbl_all_product_test(pnum)
);
-- Table TBL_WISHLIST_TEST이(가) 생성되었습니다.

ALTER TABLE tbl_wishlist_test ADD UNIQUE (fk_userid, fk_pnum);
-- Table TBL_WISHLIST_TEST이(가) 변경되었습니다.

-- tbl_member_contact_test 회원 문의 테이블
create table tbl_member_contact_test
(contactid     varchar2(100)    not null    -- 회원문의글일련번호(Primary Key)  
,fk_userid      varchar2(40)    not null    -- 회원id(Foreign Key)
,ctype          varchar2(10)    not null    -- 문의 분류
,contents      varchar2(4000)  not null    -- 문의 내용
,filename         varchar2(100)         -- 첨부파일 
,cregisterday  date default sysdate        -- 문의글등록일(sysdate)
,constraint  PK_tbl_member_contact_test_contactid primary key(contactid)
,constraint  FK_tbl_member_contact_test_fk_userid foreign key(fk_userid) references tbl_member_test(userid)
);



create sequence seq_tbl_member_contact_ctid
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- tbl_guest_contact_test 비회원 문의 테이블
create table tbl_guest_contact_test
(contactid     varchar2(100)    not null    -- 비회원문의글일련번호(Primary Key)   
,email         varchar2(200)   not null    -- 이메일 (AES-256 암호화/복호화 대상)
,ctype          varchar2(10)    not null    -- 문의 분류
,contents      varchar2(4000)    not null    -- 문의 내용
,filename         varchar2(100)         -- 첨부파일 
,cregisterday  date default sysdate        -- 문의글등록일(sysdate)
,constraint  PK_tbl_guest_contact_test_contactid primary key(contactid)
);

create sequence seq_tbl_guest_contact_ctid
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- tbl_admin_memberContact_reply_test  관리자 회원 문의답글 테이블
create table tbl_admin_memberContact_reply_test
(rpid          number(8)       not null   -- 관리자답글일련번호(Primary Key) Seq
,fk_ctid       number(8)       not null   -- 문의글일련번호(foreign key)
,rcontent      varchar2(4000)  not null   -- 답글내용
,rpregisterday date default sysdate       -- 문의답글등록일(sysdate)
,constraint  PK_tbl_admin_memberContact_reply_test_rpid primary key(rpid)
,constraint  FK_tbl_admin_memberContact_reply_test_fk_ctid foreign key(fk_ctid) references tbl_member_contact_test(ctid) on delete cascade
);


-- tbl_admin_guestContact_reply_test  관리자 비회원 문의답글 테이블
create table tbl_admin_guestContact_reply_test
(rpid          number(8)       not null   -- 관리자답글일련번호(Primary Key) Seq
,fk_ctid       number(8)       not null   -- 문의글일련번호(foreign key)
,rcontent      varchar2(4000)  not null   -- 답글내용
,rpregisterday date default sysdate       -- 문의답글등록일(sysdate)
,constraint  PK_tbl_admin_nomemberContact_reply_test_rpid primary key(rpid)
,constraint  FK_tbl_admin_nomemberContact_reply_test_fk_ctid foreign key(fk_ctid) references tbl_nomember_contact_test(ctid) on delete cascade
);



