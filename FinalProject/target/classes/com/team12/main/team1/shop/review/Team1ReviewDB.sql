create table team1_review_board(
	review_num number(5) primary key,
	review_id varchar2(30 char) not null,
	review_title varchar2(30 char) not null,
	review_txt varchar2(300 char) not null,
	review_date date not null,
	review_img varchar2(100 char)not null,
	review_star number(5) not null
)

create sequence team1_review_board_seq;
select * from team1_review_board

