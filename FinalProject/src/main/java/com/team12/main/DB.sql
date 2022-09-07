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
