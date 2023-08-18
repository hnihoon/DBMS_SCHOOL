[sungjuk 테이블 삭제]
drop table sungjuk;

[sungjuk 테이블 생성]
create table sungjuk (
    uname varchar(50) not null  --빈값을 허용하지 않음(반드시 입력하라)
                                --영문자 50글자 이내로 입력
                                --한글 16글자 이내로 입력
    ,kor int    not null
    ,eng int    not null
    ,mat int    not null
    ,tot int    null        --빈값 허용
    ,aver int               --null 생략가능
);

[샘플 데이터 행 추가]
insert into sungjuk(uname,kor,eng,mat) values ('홍길동', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('무궁화',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('진달래',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('개나리',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('라일락',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('봉선화',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('해바라기',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('나팔꽃',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('대한민국',100,100,100);

[전체 레코드 조회]
select uname, kor, eng, mat, tot, aver
from sungjuk;

[전체 행 갯수 조회]
select count(*) from sungjuk;

[select 조회 및 검색]
select kor, eng, mat from sungjuk;
select tot, aver from sungjuk;
select * from sungjuk;  --占쏙옙체 占쏙옙占? 칼占쏙옙 占쏙옙회

[as] --칼럼명을 임시 변경
select kor as korea, eng as english, mat as mathe
from sungjuk;

--as 생략 가능
select kor korea, eng english, mat mathe
from sungjuk;

--임시 한글 칼럼명은 일시적으로 분석해야 하는 경우만 추천!!
select uname as 홍길동, kor as 국어 점수, eng as 영어 점수, mat as 수학, tot 총점, aver 평균
from sungjuk;

--칼럼의 순서는 의미가 없다
select uname, kor, eng, mat from sungjuk;
select kor, mat, eng from sungjuk;

[count 함수] - 행 갯수 조회
select count(uname) from sungjuk;   --10
select count(kor) from sungjuk;     --10
select count(eng) from sungjuk;     --10
select count(mat) from sungjuk;     --10

select * from sungjuk; --전체 행 조회

--null값은 카운트하지 않는다.
select count(tot) from sungjuk;     --0
select count(aver) from sungjuk;    --0

select count(eng) from sungjuk;
select count(eng) as cnt_eng from sungjuk;
select count(mat) as 수학갯수 from sungjuk;  --임시 칼럼명은 한글 가능

--sungjuk 테이블의 전체 행의 갯수
select count(*) from sungjuk;
select count(*) as 전체행갯수 from sungjuk;
select count(*) 전체행갯수 from sungjuk;