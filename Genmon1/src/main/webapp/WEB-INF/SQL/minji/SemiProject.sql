---- **** MyMVC 다이내믹웹프로젝트에서 작업한 것 **** ----

show user; 
-- USER이(가) "SYS"입니다.

-- 오라클 계정생성시 계정명앞에 c## 을 붙이지 않고 생성하도록 하겠다.
alter session set "_ORACLE_SCRIPT" = true;
-- Session이(가) 변경되었습니다.
-- 그러면 이제부터는 계정생성시 c## 없이 계정 생성이 가능하다.

create user semi_orauser1 identified by aclass default tablespace users;
-- User MYMVC_USER이(가) 생성되었습니다.

grant connect, resource, create view, unlimited tablespace to  semi_orauser1r;
-- Grant을(를) 성공했습니다.
rollback;

show user;
-- USER이(가) "SEMI_ORAUSER1"입니다.

select*
from tbl_product_test;

select*
from tbl_all_product_test;

select*
from tbl_product_imagefile_test;


insert into tbl_category(cnum, code, cname) values(seq_category_cnum.nextval, '100000', '전자제품');



select last_number from USER_SEQUENCES where SEQUENCE_NAME = 'seq_tbl_product_pid';
select seq_tbl_product_pid.nextval from dual;
select seq_tbl_product_pid.currval from dual;
alter sequence  seq_tbl_product_pid increment by 1;

SELECT * FROM SYS.user_sequences;

ALTER SEQUENCE SEQ_TBL_PRODUCT_PID INCREMENT BY 1;
SELECT SEQ_TBL_ALL_PRODUCT_PNUM .NEXTVAL FROM DUAL;
SELECT * FROM SYS.user_sequences;
SELECT LAST_NUMBER  
FROM USER_SEQUENCES  
WHERE SEQUENCE_NAME = 'seq_tbl_product_pid' 


-- 선글라스 전체보기 상품

-- tbl_product_test : productList 상품 12개 먼저 인서트 (pid = 11~12)
insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_5', '릴리트 01(BR)', 259000, '릴리트 01(BR)은 사각형태의 블랙 플랫바 선글라스입니다. 라운딩 처리된 프런트가 부드러운 분위기를 연출하며 템플의 유니크한 메탈 장식이 특징입니다. 99.9% UV 차단이 되는 브라운 렌즈를 사용하였습니다.', 'metal');
-- 1 행 이(가) 삽입되었습니다.
-- rollback


insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_4', '디디온 GRC1', 270000, 
'디디온 GRC1은 슬림한 직사각형태의 그린 클리어 아세테이트 선글라스입니다. 직선 느낌의 프런트와 템플에 두께감이 부드럽고 세련된 느낌을 연출합니다. 99.9% UV차단이 되는 레드 그라디언트 렌즈를 사용하였습니다.', 'acetate');

insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_13', '디디온 VC1', 270000, 
'디디온 VC1은 직사각형태의 바이올렛 클리어 아세테이트 선글라스입니다. 직선 느낌의 프런트와 템플에 두께감이 부드럽고 세련된 느낌을 연출합니다. 99.9% UV차단이 되는 브라운 렌즈를 사용하였습니다.', 'acetate');




insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_6', '로지 YC5', 269000, 
'로지 YC5는 부드러운 사각 형태의 옐로우 클리어 플랫바 선글라스입니다. 렌즈 양 끝의 메탈 장식과 템플의 로고 디테일이 브랜드의 아이덴티티를 강조하며 99.9% UV 차단이 되는 브라운 렌즈를 사용하였습니다.', 'metal');


insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_7', '론디 01(V)', 259000, 
'론디 01(V)은 사각형태의 블랙 플랫바 선글라스입니다. 라운딩 처리된 프런트가 부드러운 분위기를 연출합니다. 슬림한 프런트와 템플의 실버 메탈 장식 디테일이 매력적인 제품입니다. 99.9% UV 차단이 되는 바이올렛 렌즈를 사용하였습니다.', 'metal');



insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_8', '르 IBG1', 280000, 
'르 IBG1은 캣아이 형태의 블루 그라디언트 아세테이트 선글라스입니다. 오발형 프레임의 부드러운 곡선과 균형 잡힌 볼륨감이 매력적인 제품입니다. 템플의 유니크한 메탈 장식이 특징이며 99.9% UV 차단이 되는 네이비 렌즈를 사용하였습니다.', 'metal');

insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_17', '르 IC1', 280000, 
'르 IC1은 캣아이 형태의 아이보리 클리어 아세테이트 선글라스입니다. 오발형 프레임의 부드러운 곡선과 균형 잡힌 볼륨감이 매력적인 제품입니다. 템플의 유니크한 메탈 장식이 특징이며 99.9% UV 차단이 되는 블랙 자이스 렌즈를 사용하였습니다.', 'metal');

insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_18', '르 Iv1', 280000, 
'르 IV1은 캣아이 형태의 아이보리 아세테이트 선글라스입니다. 오발형 프레임의 부드러운 곡선과 균형 잡힌 볼륨감이 매력적인 제품입니다. 템플의 유니크한 메탈 장식이 특징이며 99.9% UV 차단이 되는 브라운 렌즈를 사용하였습니다.', 'metal');

insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_19', '르 P1', 280000, 
'르 P1은 캣아이 형태의 핑크 아세테이트 선글라스입니다. 오발형 프레임의 부드러운 곡선과 균형 잡힌 볼륨감이 매력적인 제품입니다. 템플의 유니크한 메탈 장식이 특징이며 99.9% UV 차단이 되는 핑크 그라디언트 렌즈를 사용하였습니다.', 'metal');


insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_9', '밀 IC1', 249000, 
'밀 IC1은 사각형태의 아이보리 클리어 아세테이트 선글라스입니다. 레귤러 사이즈 제품에 프런트 테두리가 라운딩 처리되어 부드럽고 세련된 분위기를 연출합니다. 템플의 메탈 장식과 로고 디테일이 브랜드의 아이덴티티를 강조하며 99.9% UV 차단이 되는 오렌지 그라디언트 렌즈를 사용하였습니다.', 'metal');

insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_21', '밀 Y2', 249000, 
'밀 Y2는 사각형태의 옐로우 클리어 아세테이트 선글라스입니다. 레귤러 사이즈 제품에 프런트 테두리가 라운딩 처리되어 부드럽고 세련된 분위기를 연출합니다. 템플의 메탈 장식과 로고 디테일이 브랜드의 아이덴티티를 강조하며 99.9% UV 차단이 되는 블랙 자이스 렌즈를 사용하였습니다.', 'metal');



insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_10', '로티 IC1', 280000, 
'로티 IC1은 캣아이 형태의 아이보리 클리어 아세테이트 선글라스입니다. 안구 윗 라인의 유려한 곡선과 부드럽게 떨어지는 하단 라인이 엣지있는 분위기를 연출합니다. 템플의 실버 메탈 장식 디테일이 브랜드의 아이덴티티를 강조하며 99.9% UV 차단이 되는 바이올렛 렌즈를 사용하였습니다.', 'acetate');


insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_22', '로티 IC1', 280000, 
'로티 IC1은 캣아이 형태의 아이보리 클리어 아세테이트 선글라스입니다. 안구 윗 라인의 유려한 곡선과 부드럽게 떨어지는 하단 라인이 엣지있는 분위기를 연출합니다. 템플의 실버 메탈 장식 디테일이 브랜드의 아이덴티티를 강조하며 99.9% UV 차단이 되는 바이올렛 렌즈를 사용하였습니다.', 'acetate');


insert into tbl_product_test(pid, pname, price, pcontent, pmaterial)
values('p_11', '탐부 YC6', 320000, 
'탐부 YC6는 사각형태의 옐로우 아세테이트 선글라스입니다. 캣아이 프레임의 부드러운 곡선과 엔드피스의 볼륨감이 트렌디한 분위기를 연출합니다. 템플의 유니크한 메탈 장식이 특징이며 99.9% UV 차단이 되는 블랙 자이스 렌즈를 사용하였습니다.', 'acetate');



--DELETE FROM tbl_product_test
--where pid between 'p_11' and 'p_22';

-- commit;


-- tbl_all_product_test :  (pnum = 2~13)

select*
from tbl_all_product_test;

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(2,'p_11', 'yellow', '릴리트01(Y).jpg', 10, 100, TO_DATE(SYSDATE-3, 'yy/mm/dd') );
-- 1행 삽입 
insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(3,'p_12', 'red', '디디온GRC1.jpg', 10, 50, TO_DATE(SYSDATE-3, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(4,'p_13', 'clear', '디디온VC1.jpg', 10, 300, TO_DATE(SYSDATE-3, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(5,'p_14', 'yellow', '로지YC5.jpg', 10, 200, TO_DATE(SYSDATE-3, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(6,'p_15', 'black', '론디01(V).jpg', 10, 150, TO_DATE(SYSDATE-3, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(7,'p_16', 'blue', '르IBG1.jpg', 10, 78, TO_DATE(SYSDATE-3, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(8,'p_17', 'clear', '르Ic1.jpg', 10, 30, TO_DATE(SYSDATE-10, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(9,'p_18', 'ivory', '르Iv1.jpg', 10, 50, TO_DATE(SYSDATE, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(10,'p_19', 'pink', '르P1.jpg', 10, 53, TO_DATE(SYSDATE-50, 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(11,'p_20', 'ivory', '밀IC1.jpg', 10, 12, TO_DATE(add_months(sysdate,-1), 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(12,'p_21', 'yellow', '밀Y2.jpg', 10, 200, TO_DATE(add_months(sysdate,-10), 'yy/mm/dd') );

insert into tbl_all_product_test(pnum, fk_pid, pcolor, pimage1, salepcnt, pqty, preleasedate)
values(13,'p_22', 'clear', '로티 IC1.jpg', 10, 100, TO_DATE(add_months(sysdate,-3), 'yy/mm/dd') );

commit;


--선글라스 전체보기 상품
select *
from tbl_all_product_test
where fk_pid = 'p_11';


select  pimage1, pname, price
from
(
select row_number() over(order by pnum desc) AS RNO
      , pnum, pname, C.code, pcompany, pimage1, pimage2, pqty, price, saleprice, S.sname, pcontent, point
      , to_char(pinputdate, 'yyyy-mm-dd') as pinputdate
from tbl_product P
JOIN tbl_category C
ON p.fk_cnum = C.cnum
JOIN tbl_spec S
ON P.fk_snum = S.snum
where S.sname = 'HIT'
) V
where V.RNO between 1 and 8;


select*
from tbl_product_imagefile_test;

select*
from tbl_all_product_test;

select*
from tbl_product_test;

SELECT *
FROM tab


SELECT SEQ_TBL_ALL_PRODUCT_PNUM.NEXTVAL FROM DUAL;
select seq_tbl_product_imagefile_test_imgfileno.NEXTVAL FROM DUAL;

SELECT * FROM SYS.user_sequences;

----  tbl_product_imagefile_test 에 추가 이미지 인서트
insert into tbl_product_imagefile_test (imgfileno, fk_pnum, imgfilename)
values(seqimgfileno.nextval, 3, '디디온VC2.jpg');


insert into tbl_product_imagefile_test (imgfileno, fk_pnum, imgfilename)
values(seqimgfileno.nextval, 3, '디디온VC3.jpg');


insert into tbl_product_imagefile_test (imgfileno, fk_pnum, imgfilename)
values(seqimgfileno.nextval, 3, '디디온VC4.jpg');


insert into tbl_product_imagefile_test (imgfileno, fk_pnum, imgfilename)
values(seqimgfileno.nextval, 3, '파우치.jpg');

commit;



select pnum, pname, fk_pid, pcolor, pimage1, pmaterial
from tbl_all_product_test 
join tbl_product_test 
on fk_pid = pid
where pcolor='black' and pmaterial='metal' and fk_id != 3 ;



select distinct pnum, pname, fk_pid, price, pcolor, pimage1, pmaterial
from tbl_all_product_test
join 
tbl_product_test
on fk_pid = pid
where pcolor='black' and pmaterial='metal' and fk_pid != 'p_7';


String sql = "select distinct pnum, pname, fk_pid, price, pcolor, pimage1, pmaterial\n"+
"from tbl_all_product_test\n"+
"join \n"+
"tbl_product_test\n"+
"on fk_pid = pid\n"+
"where pcolor='black' and pmaterial='metal' and fk_pid != 'p_7'";

-- 할인가

select*
from tbl_all_product_test;

update tbl_product_test set pname = '론디'
where pid = 'p_7';

update tbl_all_product_test set pimage1 = 디디온
where pnum = 7;

commit;