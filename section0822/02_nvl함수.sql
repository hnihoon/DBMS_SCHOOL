※ 참조 : http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

--이전시간에 만들었던 컬럼들의 내용
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'아이티윌', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

/////////////////////////////////////////////////////////////////

● nvl() 함수 - null값을 다른값으로 바꿈

문제1) 주소가 'Incheon'인 행의 국어점수 최대값, 인원수를 조회하시오
select max(kor), count(*)
from sungjuk
where addr='Incheon';       --최대값(null), 인원수(0)

select count(*)+1           --0+1
from sungjuk
where addr='Incheon';

select max(kor)+1           --null+1 -> null값과 연산할 수 없다
from sungjuk
where addr='Incheon';

--null값이면 0으로 대체함
select nvl(max(kor),0)
from sungjuk
where addr='Incheon';    

select nvl(max(kor),0)+1    
from sungjuk
where addr='Incheon';    

select nvl(max(kor),0)+1 as max_kor
from sungjuk
where addr='Incheon';    

select nvl(max(sno),0)+1 as max_kor
from sungjuk;
  
/////////////////////////////////////////////////////////////////

select * from sungjuk order by sno desc;

문제2) sungjuk테이블에 아래 데이터를 행추가 하시오

sno : max(sno) + 1
    단, max()값이 null 0으로 바꾼 후 계산한다.
uname : 손흥민
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate

--1) sno칼럼에서 가장 큰값 가져오기
select max(sno) from sungjuk;

--2) 만일 1)결과가 null이 나오면 0으로 바꾸기
select nvl(max(sno),0) from sungjuk;

--3) 2)결과에 +1 연산하기
select nvl(max(sno),0)+1 from sungjuk;

--4) 행추가
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno),0)+1 from sungjuk), '손흥민', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;

commit;