--sungjuk테이블 삭제
drop table sungjuk;

--sungjuk태이블 생성
create table sungjuk(
    sno     int primary key         --기본키(유일성)
    ,uname  varchar(10) not null
    ,kor int check(kor between 0 and 100) -- 국어점수 0~100사이만 입력가능
    ,eng int check(eng between 0 and 100) -- 영어점수 0~100사이만 입력가능
    ,mat int check(mat between 0 and 100) -- 수학점수 0~100사이만 입력가능
    ,addr varchar(50) check(addr in('Seoul','Jeju','Busan','Suwon'))
    ,tot int default 0
    ,aver int default 0
    ,wdate date default sysdate        --현재 날짜 함수
    ,email varchar(50) unique           --중복된값 허용하지 않음
);

● [테이블 제약조건 에러 메세지]
-- primary key 제약조건
-- (두번 실행시) ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007337)에 위배됩니다
insert into sungjuk(sno) values(1);

-- not null 조건 
-- uname 칼럼은 not null조건이므로 반드시 값을 입력해야 함
-- ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
insert into sungjuk(sno) values(1); 
insert into sungjuk(sno, uname) values(1, 'KOREA');
insert into sungjuk(sno, uname) values(2, '대한민국');
insert into sungjuk(sno, uname) values(3, '대한민국'); -- uname은 primary key가 아니라서 중복 가능

-- uname varchar(10)하고 글자갯수 테스트함
insert into sungjuk(sno, uname) values(1, '1234567890');
insert into sungjuk(sno, uname) values(2, 'ABCDEFGHUJ');

-- ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" 열에 대한 값이 너무 큼(실제: 11, 최대값: 10)
insert into sungjuk(sno, uname) values(3, 'ABCDEFGHUJK');

insert into sungjuk(sno, uname) values(4, '무궁화');

-- SQL 오류: ORA-12899: "SYSTEM"."SUNGJUK"."UNAME" 열에 대한 값이 너무 큼(실제: 12, 최대값: 10)
-- 문자는 3byte로 글자당 3개로 취급
insert into sungjuk(sno, uname) values(5, '대한민국');

-- 3)check 제약조건
--vSQL 오류: ORA-00904: "SON": 부적합한 식별자
insert into sungjuk(son, uname, kor, eng, mat)
values(1, '홍길동', -10, 20, 300);

-- SQL 오류: ORA-00904: "SON": 부적합한 식별자
-- addr칼럼에 'Incheon' 허용 안함
insert into sungjuk(son, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'Incheon');

-- 4) dafault 제약조건
-- 해당칼럼에 데이터가 입력되지 않은 경우, tot와 aver는 0 입력, wdate는 현재날짜가 입력됨
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'Seoul');

insert into sungjuk(sno, uname, kor, eng, mat, addr, tot, aver, wdate)
values(2, '홍길동', 10, 20, 30, 'Seoul', 60, 30, '2023-08-20');

-- 5)unique 제약조건
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(1, '홍길동', 10, 20, 30, 'Seoul','webmaster@itwill.co.kr');

-- ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007366)에 위배됩니다
insert into sungjuk(sno, uname, kor, eng, mat, addr, email)
values(1, '홍길동', 10, 20, 30, 'Seoul','webmaster@itwill.co.kr');

-- SQL 오류: ORA-00913: 값의 수가 너무 많습니다
-- 컬럼의 갯수보다 values가 더 많은경우
insert into sungjuk(sno, uname, kor, eng, mat)
values(2, '홍길동', 10, 20, 30, 'Seoul');

select * from sungjuk;

