create table final_member(
member_ID varchar2(30 char) primary key,
member_PW varchar2(30 char) not null,
member_linkWhere number(3) not null,
member_name varchar2(30 char) not null,
member_birth date not null,
member_sex number(3) not null,
member_phoneNum number(15) not null,
member_address varchar2(100 char) not null,
member_email varchar2(20 char) unique,
member_joinDate date not null,
member_paper number(3) not null
);

drop table final_member;

select * from final_member;

create sequence final_member_seq;

insert into final_member values('mz','1004',1,'mz','2022-08-04',1,01012341234,'종로','mz@naver.com',sysdate,1);

create table pet_information(
baby_num number(6) primary key,
baby_memberNum varchar2(30 char) not null,
baby_name varchar2(30 char) not null,
baby_birth date not null,
baby_sex varchar2(30 char) not null,
baby_weight number(4,1)not null,
baby_type varchar2(30 char)not null,
baby_typeDetail varchar2(30 char)not null,
baby_neut varchar2(30 char)not null,
baby_img varchar2(100 char),

constraint baby_ownerNum_fk foreign key(baby_memberNum) 
    references final_member(member_ID) 
    on delete cascade
)

drop table pet_information;

create sequence pet_information_seq;

select * from PET_INFORMATION;

insert into pet_information values(pet_information_seq.nextval,'mz','동이','2021-05-01','암컷','20.1','강아지','진돗개','무','a.jpg');





