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
	

------------ 동훈 DB ------------

	-- 상품등록 DB(동훈)
create table finalProduct(
    product_num number(10) primary key,
	product_category varchar2(30 char) not null,
	product_sub_category varchar2(30 char) not null,
	product_title varchar2(100 char) not null,
	product_title2 varchar2(100 char) not null,
	product_price number(30) not null,
	product_stock number(10) not null,
	product_thumnail varchar2(1000char) not null,
    product_detail varchar2(1000char) not null,
	product_info varchar2(1000 char) not null,
	product_manufactor varchar2 (100 char) not null
)

create sequence finalProduct_seq;

select * from finalProduct

-- 주문내역 DB(동훈)
create table order_Table(
    Order_Num VARCHAR2(100 char)primary key,
    Order_User_ID varchar2(100 char)not null,
    Order_ProductNum VARCHAR2(100 char) not null,
    Order_PhoneNumber VARCHAR2(100 char) not null,
    Product_Quantity VARCHAR2(100 char) not null,
    Order_Date DATE not null,
    Shipping_Address VARCHAR2(200 char)not null,
    Order_DeliverState VARCHAR2(50 char)not null,
    Order_State varchar2 (50 char)not null,
    Order_PaymentState VARCHAR2 (50 char)not null,
    Product_Price varchar2(100 char) not null,
    Order_TotalPrice varchar2 (100 char)not null,
    Shipping_Memo varchar2(100 char)not null,
    Recipient varchar2(20 char)not null,
    Order_thumbnail varchar2(200 char) not null
)

create sequence Order_Num_seq;




	
	
	
	
	
	