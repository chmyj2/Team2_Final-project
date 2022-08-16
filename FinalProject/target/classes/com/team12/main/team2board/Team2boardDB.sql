--게시판 DB
create table team2_board(
	board_num 		number(6) primary key,
	board_member_id varchar2(30 char) not null,
	board_category 	varchar2(30 char) not null,
	board_title 	varchar2(100 char) not null,
	board_txt 		varchar2(2000 char) not null,
	board_date 		date not null,
	board_count 	number(7) not null,
	board_img 		varchar2(100 char) not null,
	board_like 		number(6) default 0
)
create sequence team2_board_seq;  
select * from team2_board
-----------------------------------------------------------------------------------------------------------
--좋아요 DB
create table team2_like(
	like_pk 		number(6) primary key,
	like_board_num 	number(6) not null,
	like_member_id 	varchar2(30 char) not null,

	constraint board_num_fk foreign key(like_board_num)
	references team2_board(board_num) on delete cascade,
	constraint member_id_fk foreign key(like_member_id)
	references final_member(member_ID) on delete cascade
)
create sequence team2_like_seq;
-------------------------------------------------------------------------------------------------------------
--댓글 DB
create table team2_comment(
	comment_num 		number(6) primary key,
	comment_board_num 	number(6) not null,
	comment_member_id 	varchar2(30 char) not null,
	comment_txt 		varchar2(300 char) not null,
	comment_date 		date not null,
	
	constraint c_board_num_fk foreign key(comment_board_num)
	references team2_board(board_num) on delete cascade,
	constraint c_member_id_fk foreign key(comment_member_id)
	references final_member(member_ID) on delete cascade
)
create sequence team2_comment_seq;
---------------------------------------------------------------------------

insert into team2_comment values(team2_comment_seq.nextval, 47, 'mz', 'hello', sysdate)

select * from team2_comment

update team2_comment 
set comment_txt = 'why'
where comment_num = 107



select comment_num from(
	select comment_num
	from team2_comment
	where comment_board_num = 61
	and comment_member_id = 'mz'
	and comment_txt like '%why%'
	order by comment_date desc
)where rownum = 1



select * 
from (
    select rownum as rn, comment_num, comment_board_num, comment_member_id, comment_txt, comment_date 
     from(
     select * from team2_comment
     where comment_board_num = 47
     order by comment_date desc 
   )
) where rn between 1 and 10

select count(*) from team2_comment where comment_board_num = 47






insert into team2_board values(team2_board_seq.nextval, 'mz', '1', 'title12', 'txt', sysdate, 0,'karina.jpg', 0)


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

select count(*) from team2_like 
where like_board_num = 33 
and   like_member_id= 'mz'

select * from team2_like

select board_like from team2_board
where board_num = 39

delete from team2_like
where like_board_num = 45 and like_member_id = 'mz'










