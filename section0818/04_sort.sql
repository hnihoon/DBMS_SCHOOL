● [Sort 정렬]
  - 특정값(keyfield)을 기준으로 순서대로 재배치
  - 오름차순 Ascending Sort   ASC  생략하면 기본값  1->10  A->Z  a->z  ㄱ->ㅎ
  - 내림차순 Descending Sort  DESC
  - 형식) order by 칼럼명1, 칼럼명2, 칼럼명3, ~~
  
-- sungjuk 테이블을 조회하시오
select * from sungjuk;

-- 전체 레코드를 이름순으로 정렬해서 조회하시오
select uname
from sungjuk
order by uname asc;  --오름차순 정렬

select uname
from sungjuk
order by uname asc;  --asc 생략가능

select uname
from sungjuk
order by uname desc;  --내림차순 정렬

--국어점수순으로 정렬해서 조회하시오
select uname, kor
from sungjuk
order by kor;

--1차 정렬 : 국어점수순으로 정렬
--2차 정렬 : 국어점수가 같다면 이름을 기준으로 내림차순 정렬
select uname, kor
from sungjuk
order by kor, uname desc;

--1차(kor), 2차(eng), 3차(mat) 내림차순 정렬
select uname,kor,eng,mat
from sungjuk
order by kor desc, eng desc, mat desc;

--문1) 평균 70점 이하 행을 이름순으로 조회하시오

-- 평균 70점 이하행 조회
select uname, aver from sungjuk where aver<=70;

select uname, aver from sungjuk where aver<=70 order by uname;

--order by는 대체적으로 마지막에 작성해야 함
select uname, aver from sungjuk order by uname where aver<=70; --ORA-00933 에러 발생

