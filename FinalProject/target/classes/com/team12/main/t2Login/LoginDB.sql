create table final_member(
member_num number(6) primary key,
member_ID varchar2(30 char) unique,
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

insert into final_member values(final_member_seq.nextval,'mz','1004',1,'mz','2022-08-04',1,01012341234,'종로','mz@naver.com',sysdate,1);

create table pet_information(
baby_num number(6) primary key,

)