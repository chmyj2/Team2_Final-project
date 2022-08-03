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

<<<<<<< HEAD
<<<<<<< HEAD
select * from team2_board

select * 
from (
    select rownum as rn, board_num, board_member_id, board_category, board_title, board_txt, board_date, board_img
     from(
     select * from team2_board
     where board_category = '1'
     and board_title like '%%'
     order by board_date desc 
   )
) where rn between 1 and 20

select count(*)
from team2_board
where board_category = '1'
and board_title like '%%'
=======
select * from team2_board
>>>>>>> 083b2bd9d393a607e06b4f007a76fdc81b901777
=======
select * from team2_board
>>>>>>> 2485cdb (create board DB)
