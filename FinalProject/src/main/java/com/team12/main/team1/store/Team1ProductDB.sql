create table team1Product_tbl(
	product_num number(5) primary key,
	product_category varchar2(30 char) not null,
	product_sub_category varchar2(30 char) not null,
	product_title varchar2(100 char) not null,
	product_title2 varchar2(100 char) not null,
	product_price number(10) not null,
	product_stock number(4) not null,
	product_thumnail varchar2(1000char) not null,
	product_info varchar2(1000 char) not null,
	product_manufactor varchar2 (30 char) not null
)

alter table team1Product_tbl add product_sub_category 
varchar2(30 char) default '-' not null

drop table team1Product_tbl cascade constraint purge;

create sequence team1Product_tbl_seq;
select * from team1Product_tbl

insert into team1Product_tbl 
	values(team1Product_tbl_seq.nextval,'1','1','ANF MADE WITH ORGANIC 6Free+','전연령용', 
	'20000', '10', 'about1.png', '전연령용 사료입니다', 'ANF' )
	
	
	
	
	
	