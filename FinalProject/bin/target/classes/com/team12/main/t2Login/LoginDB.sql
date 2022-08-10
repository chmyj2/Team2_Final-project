create table final_member(
member_ID varchar2(30 char) primary key,
member_PW varchar2(30 char) not null,
member_linkWhere number(3) not null,
member_name varchar2(30 char) not null,
member_birth date not null,
member_sex varchar2(30 char) not null,
member_phoneNum number(15) not null,
member_address varchar2(100 char) not null,
member_email varchar2(20 char) unique,
member_joinDate date not null,
member_paper varchar2(30 char) not null
);

ALTER TABLE final_member MODIFY member_phoneNum varchar2(30 char);

delete final_member where member_ID ='mz';

drop table final_member;


select * from final_member;

create sequence final_member_seq;

insert into final_member values('mz','1004',1,'mz','2022-08-04','남자','010-1234-1234','종로','mz@naver.com',sysdate,'동의');

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

insert into PET_INFORMATION values(pet_information_seq.nextval,'mz','동이','2021-05-01','암컷',20.1,'강아지','진돗개','무','a.jpg');

drop table pet_information;

drop SEQUENCE pet_information_seq;
create SEQUENCE pet_information_seq INCREMENT by 1 start with 1;


select * from PET_INFORMATION;

create table vet_member(
vet_ID varchar2(30 char)primary key,
vet_PW varchar2(30 char)not null,
vet_businessNum number(20)not null,
vet_address varchar2(100 char) not null,
vet_phoneNum number(15) not null,
vet_joinDate date not null
)

ALTER TABLE vet_member MODIFY vet_phoneNum varchar2(30 char);
ALTER TABLE vet_member MODIFY vet_businessNum varchar2(30 char);

delete vet_member where vet_ID ='sj';

drop table vet_member;

insert into vet_member values('sj','1004','123456789','인천','010-1234-1234',sysdate);

select * from vet_member;