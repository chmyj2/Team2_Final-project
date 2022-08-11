--게시판 DB
create table team2_board(
	board_num number(6) primary key,
	board_member_id varchar2(30 char) not null,
	board_category varchar2(30 char) not null,
	board_title varchar2(100 char) not null,
	board_txt varchar2(2000 char) not null,
	board_date date not null,
	board_count number(7) not null,
	board_img varchar2(100 char) not null,
	board_like number(7) default 0 not null
)
create sequence team2_board_seq;  

-----------------------------------------------------------------------------------------------------------
--좋아요 DB
create table team2_like(
	like_pk number(6) primary key,
	like_board_num number(6) not null,
	like_member_id varchar2(30 char) not null,

	constraint board_num_fk foreign key(like_board_num)
	references team2_board(board_num) on delete cascade,
	constraint member_id_fk foreign key(like_member_id)
	references final_member(member_ID) on delete cascade
)
create sequence team2_like_seq;

select count(*) from team2_like 
where like_board_num = 33 
and   like_member_id= 'mz'

select * from team2_like

select board_like from team2_board
where board_num = 39
-------------------------------------------------------------------------------------------------------------

insert into team2_board values(team2_board_seq.nextval, 'mz', '1', 'title12', 'txt', sysdate, 0,'karina.jpg', 0)


select * from team2_board where board_num = 32

delete from team2_board where board_num = 


drop table team2_board cascade constraint purge;

select * 
from (
    select rownum as rn, board_num, board_member_id, board_category, board_title, board_txt, board_date, board_img
     from(
     select * from team2_board
     where board_category = '1'
--     and board_title like '%%'
     order by board_date desc 
   )
) where rn between 11 and 20

select count(*)
from team2_board
where board_category = '1'
and board_title like '%%'










