-- ȸ������DB
create table members(
m_email varchar(30) primary key,
m_pw varchar(100),
m_name varchar(20),
m_phone varchar(20),
m_zipcode varchar(20),
m_address1 varchar(150),
m_address2 varchar(150),
m_joindate timestamp default sysdate,
m_ipaddress varchar(20),
m_grade varchar(10) default 'public',
m_social varchar(12) default 'MG',
m_point number default 0,
m_gender varchar(6), 
m_birth date,
m_garden varchar(100) unique,
m_profile varchar(200),
m_realpath varchar(300)
);
drop table members;
select * from members;
select m_pw from members where m_email = 'gmail@gmail';
delete from members where m_Email = 'sparkss0419@naver.com';
commit;
insert into members(m_email) values('admin@admin');
select sysdate from dual;

create table test(
birth date
);
insert into test values (to_date('18/1/1', 'yy/mm/dd'));
insert into test values (to_date('1/1', 'yy/mm/dd'));
select * from test;



create table products(
p_no number primary key,
p_imagepath varchar(100) not null,
p_title varchar(20) not null,
p_subtitle varchar(100) not null,
p_category varchar(20) not null,
p_inventory number not null,
p_unit varchar(20) not null,
p_seller varchar(20) not null,
p_origin varchar(20) not null,
p_price number not null,
p_content clob not null,
p_sales number default 0,
p_writedate timestamp default sysdate
); 
create sequence p_seq
start with 1001
increment by 1
nocache
nomaxvalue;
create table image_product(
img_p_title varchar(30) not null,
img_p_path varchar(200) not null
);
--drop table image_product;

select * from image_product;


create table board_review(
br_p_no number,
br_no number primary key,
br_imagepath varchar(100),
br_title varchar(100) not null,
br_email varchar(20) not null,
br_name varchar(20) not null, 
br_content varchar(4000) not null,
br_writedate timestamp default sysdate,
br_recommend number default 0
);
--drop table board_review;
create sequence bf_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table board_free(
bf_no number primary key,
bf_title varchar(100) not null,
bf_writer varchar(20) not null,
bf_email varchar(30) not null,
bf_content clob not null,
bf_viewcount number default 0,
bf_writedate timestamp default sysdate,
bf_recommend number default 0
);
create table cart(
c_p_no number,
c_p_imagepath varchar(100) not null,
c_p_title varchar(50) not null,
c_p_price number not null,
c_m_email varchar(30) not null,
c_count number not null,
c_selectdate timestamp default sysdate
);
create table shoplist(
s_orderno_seq number primary key,
s_orderno number,
s_email varchar(30) not null,
s_phone varchar(20) not null,
s_p_no number not null,
s_p_imagepath varchar(100) not null,
s_p_title varchar(50) not null,
s_p_count number not null,
s_p_price number not null,
s_m_recipient varchar(20) not null,
s_m_memo varchar(500) not null,
s_m_paymethod varchar(20) not null,
s_m_zipcode varchar(20) not null,
s_m_address1 varchar(100) not null,
s_m_address2 varchar(100) not null,
s_statement varchar(20) not null,
s_orderdate timestamp not null,
s_reviewok char(1) check(s_reviewok in('y','n'))
);
insert into shoplist values(56, 66666666, 'espanoir0419@naver.com', 'phone', 33, 'resources/img/profile.png', 'title', 2, 3000, 
'recipient', 'memo', 'paymethod', 'zipcode', 'address1', 'address2', 'statement', '19/7/25 00:59:59.000000000', 'y');
select * from shoplist;
select * from members;
delete from members where m_email='espanoir0419@naver.com_n';
--�ߺ���
select s_orderdate, COUNT(s_orderdate) from shoplist group by(s_orderdate) order by COUNT(s_orderdate);
--�ߺ���
select to_char(s_orderdate, 'yy/mm/dd') as orderdate, COUNT(s_orderdate) as count from shoplist where s_email='espanoir0419@naver.com' group by(s_orderdate);
select s_orderdate as orderdate, COUNT(s_orderdate) as count from shoplist where s_email='espanoir0419@naver.com' group by(s_orderdate);
select to_date(substr(s_orderdate, 1,8), 'yy/mm/dd') as orderdate, COUNT(to_date(substr(s_orderdate, 1,8), 'yy/mm/dd')) as count from shoplist where s_email='espanoir0419@naver.com' group by(to_date(substr(s_orderdate, 1,8), 'yy/mm/dd'));
select * from shoplist where s_email='espanoir0419@naver.com' and s_orderdate='19/02/04';
select * from shoplist where s_email='espanoir0419@naver.com' and s_orderdate='2019-07-23';
select * from shoplist where s_email='espanoir0419@naver.com' and s_orderdate between '19/07/23 00:00:00.000000000' and '19/07/23 23:59:59.000000000';
select * from shoplist where s_email='espanoir0419@naver.com' and s_orderdate between to_date(substr('2019-07-04 12:00', 1,10), 'yy/mm/dd') and to_date(substr('2019-07-04 12:00', 1,10), 'yy/mm/dd')+0.9999;
select concat(substr('19/07/23 16:43:54.000000000', 1,8), ' 00:00:00.000000000') from dual;
select concat(substr('19/07/23 16:43:54.000000000', 1,8), ' 23:59:59.000000000') from dual;
select to_date(substr('19/07/23 16:43:54.000000000', 1,8))+1 from dual;
select to_date(substr('2019-06-04 12:00', 1,10), 'yy/mm/dd') from dual;
select to_date(substr(s_orderdate, 1,8), 'yy/mm/dd') from shoplist;
select * from shoplist where s_email='espanoir0419@naver.com' and s_orderdate between to_date('2019-06-04 12:00', 'yy-mm-dd') and to_date('19/07/23', 'yy-mm-dd')+1;






commit;
create sequence cf_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table subscribe(
sb_orderno_seq number primary key,
sb_email varchar(50) not null,
sb_period varchar(20) not null,
sb_category varchar(20) not null,
sb_component1 varchar(20),
sb_component2 varchar(20),
sb_component3 varchar(20),
sb_paymethod varchar(20) not null,
sb_startday date default sysdate+1,
sb_orderday date default sysdate,
sb_statement varchar(20) not null,
sb_price number not null
);
--drop table subscribe;
create sequence sb_orderno_seq
start with 1001
increment by 1
nocache
nomaxvalue;
insert into subscribe values(sb_orderno_seq.nextval, 'espanoir0419@naver.com','�� �޿� �� ��',
'����/ä��', '����', '����', '���', '�������Ա�', '19/12/22', sysdate, '�Ա� ���', 50000);
select * from subscribe;
--���� �� ��, ���� :���ֿ� �� ��, �����ѹ� : �� �޿� �� ��
--'�Ա� ���' <-> �������
update subscribe set sb_email = 'espanoir0419@naver.com' where sb_email = 'espanoir@naver.com';

select * from shoplist where s_email='espanoir0419@naver.com';
select * from subscribe where sb_email='espanoir0419@naver.com';
select s_orderdate, sb_startday from shoplist, subscribe where sb_email=s_email and sb_email='espanoir0419@naver.com' and s_email='espanoir0419@naver.com';
select s_orderdate || sb_startday from shoplist, subscribe where sb_email='espanoir0419@naver.com' and s_email='espanoir0419@naver.com';


SELECT s_orderdate FROM shoplist WHERE s_email='espanoir0419@naver.com'
UNION ALL
SELECT sb_startday FROM subscribe WHERE sb_email='espanoir0419@naver.com'
ORDER BY 1;

SELECT s_orderdate FROM shoplist WHERE s_email='espanoir0419@naver.com' UNION ALL SELECT sb_startday FROM subscribe WHERE sb_email='espanoir0419@naver.com';

select to_date(substr(s_orderdate, 1,8), 'yy/mm/dd') as orderdate, COUNT(to_date(substr(s_orderdate, 1,8), 'yy/mm/dd')) as count from (SELECT s_orderdate FROM shoplist WHERE s_email='espanoir0419@naver.com' UNION ALL SELECT sb_startday FROM subscribe WHERE sb_email='espanoir0419@naver.com') group by(to_date(substr(s_orderdate, 1,8), 'yy/mm/dd')) order by 1;
select sb_startday as orderdate, COUNT(sb_startday) as count from subscribe where sb_email = 'espanoir0419@naver.com' group by(sb_startday);
select * from subscribe where sb_email='espanoir0419@naver.com' and sb_startday between to_date('2019-07-25', 'yy-mm-dd') and to_date('2019-07-25', 'yy-mm-dd')+0.99;

SELECT * FROM (SELECT * FROM subscribe ORDER BY ROWNUM DESC) WHERE  sb_email = 'espanoir0419@naver.com' and ROWNUM = 1;
SELECT * FROM (SELECT * FROM subscribe WHERE sb_email = 'espanoir0419@naver.com' ORDER BY sb_orderno_seq DESC) WHERE ROWNUM = 1;
select sb_startday from subscribe where sb_email = 'espanoir@naver.com';

select sb_startday, sb_period from subscribe where sb_email = 'espanoir@naver.com';
select sb_startday, sb_startday+7, sb_startday+14, sb_startday+21 from subscribe where sb_email = 'espanoir@naver.com' and sb_period='���� �� ��';
select sb_startday, sb_startday+7 from subscribe where sb_email = 'espanoir@naver.com' and sb_period='���ֿ� �� ��';
select sb_startday from subscribe where sb_email = 'espanoir@naver.com' and sb_period='�� �޿� �� ��';

declare
--sb_period subscribe.sb_period%type;
sb_startday subscribe.sb_startday%type;
begin select sb_period INTO sb_startday from subscribe where sb_email = 'espanoir@naver.com';
IF sb_period = '���� �� ��' THEN
  select sb_startday INTO sb_startday from subscribe where sb_email = 'espanoir@naver.com';
ELSIF sb_period = '���ֿ� �� ��' THEN
  select sb_startday INTO sb_startday from subscribe where sb_email = 'espanoir@naver.com';
ELSE 
   select sb_startday INTO sb_startday from subscribe where sb_email = 'espanoir@naver.com';
END IF;
END;
/

create or replace procedure coffee_select_proc(pro_id coffee.id%type)
is
result coffee%rowtype;
begin
select * into result from coffee where id=pro_id;
dbms_output.put_line(result.id || ' ' || result.name || ' ' || result.price);
end;
/
exec coffee_select_proc(1004);
-----------------------------------------------------


create table comment_free(
cf_bf_no number not null,
cf_no number primary key,
cf_name varchar(20) not null,
cf_email varchar(30) not null,
cf_writedate timestamp default sysdate,
cf_comment varchar(1000) not null
);
commit;