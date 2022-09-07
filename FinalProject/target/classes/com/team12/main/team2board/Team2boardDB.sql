--게시판 DB
create table team2_board(
	board_num 		number(6) primary key,
	board_member_id varchar2(30 char) not null,
	board_category 	varchar2(30 char) not null,
	board_title 	varchar2(100 char) not null,
	board_txt 		varchar2(2000 char) not null,
	board_date 		date not null,
	board_count 	number(7) not null,
	board_img 		varchar2(1000 char) not null,
	board_like 		number(6) default 0
)
create sequence team2_board_seq;  
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
	comment_child_total number(6) default 0 not null,
	
	constraint c_board_num_fk foreign key(comment_board_num)
		references team2_board(board_num) on delete cascade,
	constraint c_member_id_fk foreign key(comment_member_id)
		references final_member(member_ID) on delete cascade
)
create sequence team2_comment_seq;
---------------------------------------------------------------------------
--대댓글
create table team2_child_comment(
	c_child_num			number(6) primary key,
	c_child_board_num 	number(6) not null,
	c_child_member_id 	varchar2(30 char) not null,
	c_child_parent_num	number(6) not null,
	c_child_txt			varchar2(300 char) not null,
	c_child_date		date not null,
	
	constraint child_board_num_fk foreign key(c_child_board_num)
		references team2_board(board_num) on delete cascade,
	constraint child_member_id_fk foreign key(c_child_member_id)
		references final_member(member_ID) on delete cascade,
	constraint child_parent_num_fk foreign key(c_child_parent_num)
		references team2_comment(comment_num) on delete cascade
)
create sequence team2_child_comment_seq;
---------------------------------------------------------------------------------
