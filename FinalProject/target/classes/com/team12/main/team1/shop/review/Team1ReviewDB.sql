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

insert into team1_review_board 
	values(team1_review_board_seq.nextval,'leeyoky','제목','내용', sysdate, 'about5.png', '1')

		select * from (
		select rownum as rn, review_num, review_id, review_title, review_txt,
				review_date, review_img, review_star
				from (
				select * from team1_review_board
				order by review_date desc
				)
	)