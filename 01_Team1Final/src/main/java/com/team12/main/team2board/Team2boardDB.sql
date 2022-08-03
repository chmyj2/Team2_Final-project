create table team2_board(
board_num number(6) primary key,
board_member_id varchar2(30 char) not null,
board_category varchar2(30 char) not null,
board_title varchar2(100 char) not null,
board_txt varchar2(2000 char) not null,
board_date date not null,
board_img varchar2(100 char) not null
)

create sequence team2_board_seq;

insert into team2_board values(team2_board_seq.nextval, 'mz', '1', 'title', 'txt', sysdate, 'karina.jpg')

select * from team2_board