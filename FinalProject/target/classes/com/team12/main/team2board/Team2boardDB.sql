create table team2_board(
board_num number(6) primary key,
board_member_id varchar2(30 char) not null,
board_category varchar2(30 char) not null,
board_title varchar2(100 char) not null,
board_txt varchar2(2000 char) not null,
board_date date not null,
board_count number(7) not null,
board_img varchar2(100 char) not null
)
create sequence team2_board_seq;

-------------------------------------------------------------------------------------------------------------

insert into team2_board values(team2_board_seq.nextval, 'mz', '1', 'title12', 'txt', sysdate, 0,'karina.jpg')

select * from team2_board

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
