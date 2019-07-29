select * from members;
select * from members where name = 'asdasd';
--drop table members;

-- ȸ������DB-------------------------------------------------------------------------
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

insert into members values('admin123@naver.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '������',
'010-2414-9070', '12345', '������ ��', '������ ����Ʈ', sysdate, '192.168.60.25', 'admin',
default, default, '����', '1992/01/29', '�ؿ�����', 'resources/prof/1563966178539.png', '');


--drop table members;
select * from members;
--update members set m_email='admin123@naver.com' where m_email = 'admin123';
commit;

commit;



 
--��ٱ���------------------------------------------------------------------------
create table cart(
c_p_no number,
c_p_imagepath varchar(100) not null,
c_p_title varchar(50) not null,
c_p_price number not null,
c_m_email varchar(30) not null,
c_count number not null,
c_selectdate timestamp default sysdate
);
--drop table cart;
select * from cart;
insert into cart values(1001, '/resources/products/food.jpg', '������', 4000, 'dlgodud8997@naver.com', 2, sysdate);
insert into cart values(1002, '/resources/products/food2.jpg', '������ġ', 3000, 'dlgodud8997@naver.com', 3, sysdate);
insert into cart values(1003, '/resources/products/food2.jpg', '�����̴�', 100, 'dlgodud8997@naver.com', 3, sysdate);
insert into cart values(1004, '/resources/products/food.jpg', '���ְڴ�!', 2000, 'dlgodud8997@naver.com', 1, sysdate);
insert into cart values(1005, '/resources/products/food2.jpg', '�������', 4500, 'dlgodud8997@naver.com', 4, sysdate);

commit;


--���ų���------------------------------------------------------------------------
--drop table shoplist;
create table shoplist(
s_orderno_seq number primary key,
s_orderno number,
s_email varchar(50) not null,
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

delete from shoplist where s_statement = '�ֹ� ����';
delete from shoplist where s_orderno = 1563886066143;

select extract(hour from sysdate - s_orderdate) from shoplist where s_email = 'dlgodud8997@naver.com';
update shoplist set s_statement = '�Ա� ���' where (extract(day from sysdate-s_orderdate)*24
     + EXTRACT(HOUR FROM sysdate-s_orderdate))>20 and s_statement = '�ֹ� ����';

commit;
create sequence s_orderno_seq start with 1001 increment by 1 nomaxvalue nocache;
select s_orderno from shoplist where s_orderdate between sysdate-1 and sysdate and s_statement = '�����';
insert into shoplist values(1, 1, 'dlgodud', '010-2414-9070', 1001, 'dd', 'dd', 3, 100, 'hy', 'fast', 'ī�� ����', '12345', '12345','12345','finish', sysdate, 'n');
update shoplist set s_statement = '�Ա� ���';
select * from shoplist order by s_orderdate desc;
select * from shoplist where s_orderno = 1563246661175;

select distinct s_orderno from shoplist;
select s_orderno from shoplist;

--���ⱸ��------------------------------------------------------------------------
--drop table subscribe;
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
commit;

insert into subscribe values(sb_orderno_seq.nextval, 'dlgodud8997@naver.com','���� �ѹ�',
'����/ä��', '����', '����', '���', '�������Ա�', '2019/08/07', '2019/07/20', '�Ա� ���', 50000);
select * from subscribe;

update subscribe set sb_statement='������' where sb_orderno_seq = 1045;

select sysdate-sb_orderday from subscribe where sysdate-sb_orderday>1;

create sequence sb_orderno_seq
start with 1001
increment by 1
nocache
nomaxvalue;
--�����Խ���-----------------------------------------------------------------------
create sequence bf_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table board_free(
bf_no number primary key,
bf_title varchar(100) not null,
bf_writer varchar(20) not null,
bf_email varchar(50) not null,
bf_content clob not null,
bf_viewcount number default 0,
bf_writedate timestamp default sysdate,
bf_recommend number default 0
);
--drop table board_free;

--�����Խ��� ���-------------------------------------------------------------------
create sequence cf_seq
start with 1
increment by 1
nocache
nomaxvalue;

create table comment_free(
cf_bf_no number not null,
cf_no number primary key,
cf_name varchar(20) not null,
cf_email varchar(50) not null,
cf_writedate timestamp default sysdate,
cf_comment varchar(1000) not null
);
commit;



--drop table comment_free;
--------------------------------------------------------------------------------
--�ı�Խ���DB
create table board_review(
br_p_no number,
br_no number primary key,
br_imagepath varchar(100),
br_title varchar(100) not null,
br_email varchar(50) not null,
br_name varchar(20) not null, 
br_content varchar(4000) not null,
br_writedate timestamp default sysdate,
br_recommend number default 0
);

alter table board_review modify(br_email varchar(50));
--drop table board_review;
commit;
--------------------------------------------------------------------------------
create table br_recommend( --��õ���̺� �߰�
BR_EMAIL VARCHAR2(50) NOT NULL ,
BR_NO NUMBER NOT NULL, 
BR_TITLE VARCHAR2(100)--���߿� not null�߰��ϱ� 
);
--drop table br_recommend;
create sequence board_review_seq
start with 1
INCREMENT by 1
nocache
NOMAXVALUE;

--drop sequence board_review_seq;
commit;

--------------------------------------------------------------------------------

--�����Խ��� ����DB
create table board_qna(
bq_p_no number, --��ǰ�۹�ȣ
bq_no number primary key,--���� �۹�ȣ
bq_checkedAns char(1) default 'n' check(bq_checkedAns in('y', 'n')),--�亯 ����
bq_checkedSecret char(1) default 'n' check(bq_checkedSecret in('y', 'n')),--��б�
bq_title varchar(100) not null,
bq_email varchar(50) not null,
bq_name varchar(20) not null, 
bq_content varchar(4000) not null,
bq_writedate timestamp default sysdate,
bq_imagepath1 varchar(100),
bq_imagepath2 varchar(100),
bq_imagepath3 varchar(100)
);
--drop table board_qna;
alter table board_qna modify(bq_email varchar(50));
commit;
--------------------------------------------------------------------------------
create sequence board_qna_seq
start with 1
INCREMENT by 1
nocache
NOMAXVALUE;
--------------------------------------------------------------------------------

--�����Խ��� �亯DB
create table comment_qna(
cq_p_no number not null,
cq_no number primary key,
cq_name varchar(20) not null,
cq_email varchar(50) not null,
cq_writedate timestamp default sysdate,
cq_comment varchar(1000) not null
);
--drop table comment_qna;

select * from comment_qna;
--drop table comment_qna;
commit;


--------------------------------------------------------------------------------
--��ǰ DB
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

--drop table products;

create sequence p_seq
start with 1001
increment by 1
nocache
nomaxvalue;

select p_title from products where p_category = 'vagetable';
select p_title from products where p_category = 'fruit';
select p_title from products where p_category = 'egg';
select p_title from products where p_category = 'grain';
select p_title from products where p_category = 'source';
select * from products;

--------------------------------------------------------------------------------
--��ǰ ��ӳ�Ʈ ���� �̹������ DB
create table image_product(
img_p_title varchar(30) not null,
img_p_path varchar(200) not null
);
--drop table image_product;

select * from image_product;

commit;

--------------------------------------------------------------------------------
--������� DB
create table gardens(
g_email varchar(50) primary key,
g_name varchar(20) not null,
g_gardenname varchar(100) not null,
g_enrolldate timestamp default sysdate,
g_g_herb varchar(40) not null,
g_temper number not null,
g_humid varchar(30) default '����',
g_light varchar(30) default '����',
g_process char(1) default 'y' check(g_process in('y','n')),
g_consume char(1) default 'y' check(g_consume in('y','n'))
);
--drop table gardens;

alter table gardens rename column g_hurb to g_herb;
select * from gardens;

commit;

--------------------------------------------------------------------------------

--�α׸� ����ϴ� DB
create table log(
l_email varchar(50) not null,
l_method varchar(30) not null,
l_time timestamp default sysdate
);
--drop table log;
commit;

--------------------------------------------------------------------------------
--ä��DB
create table chat(
c_sendemail varchar(50) not null,
c_message varchar(1000) not null,
c_receive_email varchar(50) default 'admin123@naver.com',
c_grade varchar(50),
c_querydate timestamp default sysdate,
c_answer char(1) check(c_answer in('y','n'))
);
--drop table chat;

select * from chat;

commit;