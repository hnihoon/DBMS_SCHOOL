● [자동으로 일련번호 부여]

- Oracle Database : sequence 생성
- M*SQL Database : identity 제약조건
////////////////////////////////////////////////////////

-- sungjuk 테이블 삭제
drop table sungjuk;

-- sungjuk 테이블 생성
create table sungjuk (
    sno     int         not null --일련번호
    ,uname varchar(50)  not null
    ,kor    int         not null
    ,eng    int         not null
    ,mat    int         not null
    ,tot    int
    ,aver   int
    ,addr varchar(20)   --주소
    ,wdate date         --작성일(년월일시분초)
);

-- 행추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat , addr, wdate)
values(1, '홍길동', 89, 88, 77, 'Seoul', '2023-08-18');

select * from sungjuk;   --전체 행 조회
delete from sungjuk;     --전체 행 삭제
commit;                  --명령어 저장
////////////////////////////////////////////////////////

● [시퀀스 Sequence]
  - 일련번호 자동 생성
  - 시퀀스 생성 : create sequence 시퀀스명;
  - 시퀀스 삭제 : drop sequence 시퀀스명;

--시퀀스 생성 형식)
   create sequence 시퀀스명
   increment by 증가값 start with 시작값
   
--sungjuk테이블에서 사용할 시퀀스 생성;
create sequence sungjuk_seq;

--sungjuk_seq 시퀀스 삭제
drop sequence sungjuk_seq;

● [sysdate 함수] - 시스템의 현재 날짜 정보

////////////////////////////////////////////////////////

-- 시퀀스와 sysdate함수를 이용한 행추가 테스트
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '홍길동', 89, 88, 77, 'Seoul', sysdate);

select * from sungjuk;

delete from sungjuk where uname='홍길동';
delete from sungjuk where kor=89;
delete from sungjuk where sno=3;



