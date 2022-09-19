--회원 DB
create table final_member(
member_ID varchar2(100 char) primary key,
member_PW varchar2(30 char) not null,
member_linkWhere number(3) not null,
member_name varchar2(30 char) not null,
member_birth date ,
member_sex varchar2(30 char) not null,
member_phoneNum varchar2(30 char) not null,
member_address varchar2(100 char) not null,
member_email varchar2(40 char) unique,
member_joinDate date not null,
member_paper varchar2(30 char) not null
);

--펫 DB
create table pet_information(
baby_num number(6) primary key,
baby_memberID varchar2(30 char) not null,
baby_name varchar2(30 char) not null,
baby_birth date not null,
baby_sex varchar2(30 char)not null,
baby_weight number(4,1) not null,
baby_type varchar2(30 char)not null,
baby_typeDetail varchar2(30 char)not null,
baby_neut varchar2(30 char)not null,
baby_img varchar2(100 char),

constraint baby_ownerID foreign key(baby_memberID) 
    references final_member(member_ID) 
    on delete cascade

)

create sequence pet_information_seq;

--비즈니스용 DB
create table vet_member(
vet_ID varchar2(30 char)primary key,
vet_PW varchar2(30 char)not null,
vet_businessNum varchar2(30 char)not null,
vet_address varchar2(100 char) not null,
vet_phoneNum varchar2(30 char) not null,
vet_joinDate date not null
)

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


