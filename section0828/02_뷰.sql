● [뷰 View]

--뷰생성 (두번째부터는 수정)
--형식) create or replace view 뷰이름 as 실제로실행할SQL문

--테이블, 뷰 목록 확인
select * from tab;
select * from tab where tabtype='TABLE';  --테이블 목록
select * from tab where tabtype='VIEW';   --뷰 목록

--sungjuk 테이블 목록 확인
select * from sungjuk;

--주소가 서울,제주지역의 이름, 국, 영, 수, 주소를 조회하시오
select uname, kor, eng, mat, addr
from sungjuk
where addr in('Seoul', 'Jeju');

--위의 SQL문을 뷰로 생성
create or replace view test1_view
as
    select uname, kor, eng, mat, addr
    from sungjuk
    where addr in('Seoul', 'Jeju');
    
--생성된 뷰는 테이블처럼 사용 가능하다
select * from test1_view;

-뷰 삭제
drop view test1_view;  

--test2_view 생성 (alias별칭)
create or replace view test2_view
as
    select uname as 이름, kor as 국어, eng as 영어, mat as 수학, addr as 주소
    from sungjuk
    where addr in('Seoul', 'Jeju');
    
select * from test2_view;

select * from tab where tabtype='VIEW';  --뷰 목록

--데이터사전(user_views테이블)에서 뷰의 세부 정보 확인
select * from user.views;
select text from user_views where view_name='TEST2_VIEW';

문제1) 수강신청한 학생들의 학번, 총학점을 뷰로 생성하시오(test3_view)
    g1001 14학점
    g1002 8학점
    g1005 12학점
    g1006 3학점
    
--1) 수강신청과목의 학점을 가져와서 학번별로 총학점 구하기
select su.hakno, sum(gw.ghakjum) || '학점' as 총학점
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno;

--2) 1)의 결과를 test3_view뷰로 생성하기
create or replace view test3_view
as
    select su.hakno as 학번, sum(gw.ghakjum) || '학점' as 총학점
    from tb_sugang su inner join tb_gwamok gw
    on su.gcode = gw.gcode
    group by su.hakno;

select * from test3_view;

--3) 2)에서 생성한 뷰와 학생테이블을 조인해서 학번, 이름, 총학점 출력하기
select tb_student.uname, test3_view.*
from tb_student inner join test3_view
on tb_student.hakno = test3_view.학번
order by tb_student.hakno;
