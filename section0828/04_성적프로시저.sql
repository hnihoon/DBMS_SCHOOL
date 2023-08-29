● sungjuk테이블에서 Create/Read/Update/Delete 관련 프로시저

1)행추가 프로시저 (Create)
create or replace procedure sungjukInsert
(
    --매개변수 (parameter) 선언
    --sungjuk테이블의 uname칼럼과 동일한 타입으로 변수(v_name)선언
     v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
)
is
begin
    insert into sungjuk(sno, uname, kor, eng, mat, tot, aver, addr)
    values(sungjuk_seq.nextval, v_uname, v_kor, v_eng, v_mat
    , (v_kor+v_eng+v_mat), (v_kor+v_eng+v_mat)/3, v_addr);
    commit;
end;

--sungjukInsert 프로시저 실행
execute sungjukInsert('오필승', 100, 99, 95, 'Seoul');

--결과확인
select * from sungjuk order by sno desc;
////////////////////////////////////////////////////////////////////////////////

2)행수정 프로시저 (Update)
--문) sno=61 행을 아래 값으로 이름, 국, 영, 수, 주소, 총점, 평균을 수정하는 프로시저를 생성하시오

create or replace procedure sungjukUpdate
(
     v_uname in sungjuk.uname%type
    ,v_kor in sungjuk.kor%type
    ,v_eng in sungjuk.eng%type
    ,v_mat in sungjuk.mat%type
    ,v_addr in sungjuk.addr%type
    ,v_sno in sungjuk.sno%type
)
is
begin
 update sungjuk
 set uname = v_uname, kor=v_kor, eng=v_eng, mat=v_mat, tot=v_kor+v_eng+v_mat
         ,aver=(v_kor+v_eng+v_mat)/3, addr=v_addr
 where sno=v_sno;
 commit;
end;

execute sungjukUpdate('코리아', 50,60,90,'Jeju', 21);

select * from sungjuk;
////////////////////////////////////////////////////////////////////////////////

3)행삭제 프로시저 (Delete)
create or replace procedure sungjukDelete
(
    v_sno in sungjuk.sno%type
)
is
begin 
    delete from sungjuk
    where sno=v_sno;
    commit;
end;

execute sungjukDelete(21);

select * from sungjuk;
////////////////////////////////////////////////////////////////////////////////
4)전체목록 (Read)
create or replace procedure sungjukList
(
    v_cursor out sys_refcursor  --out 출력매개변수
)
is
    rec sungjuk%rowtype;        --sungjuk테이블의 한행의 타입과 동일
begin
    open v_cursor for select * from sungjuk order by sno desc;
    
    loop
        fetch v_cursor into rec;
        exit when v_cursor%NOTFOUND;
        dbms_output.put_line(rec.uname||' '||rec.kor||' '||rec.eng||' '||rec.mat
        ||' '||rec.tot||' '||rec.aver||' '||rec.addr||' '||rec.wdate);
    end loop;

        close v_cursor;
end;

var v_cursor refcursor;     --참조 커서 변수 선언
execute sungjukList(:v_cursor);

--콘솔창 출력하기 위한 사전 준비작업
set serveroutput on;