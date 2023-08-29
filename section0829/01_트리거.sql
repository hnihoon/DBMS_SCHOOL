● 트리거 Trigger
  - 방아쇠, 데이터베이스에서의 연쇄적인 동작을 정의함
  - insert,update, delete문이 실행될 때 묵시적으로 수행되는 프로시저
  

--콘솔창 출력 dbms_output.put_line 를 사용함
set serveroutput on;
////////////////////////////////////////////////////////////////////////////////

--연습)
--sungjuk테이블에서 국어점수의 평균을 구하시오
select avg(kor) from sungjuk; --71.5384...

--국어점수가 추가, 수정, 삭제가 되면 전체 국어평균도 달라지며,
--바뀐 국어평균 값을 출력한다

create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('국어평균:' || avg_kor);
end;

--행추가
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval, '이순신',100, 100, 100, 'Seoul', sysdate); --국어평균 73.57

--행수정
update sungjuk set kor=0 where sno=1;

--행삭제
delete from sungjuk where sno=12;

commit;
