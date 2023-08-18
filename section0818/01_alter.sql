--sungjuk 테이블 삭제
DROP TABLE sungjuk;

--sungjuk 테이블 생성
create table sungjuk (
    uname varchar(50) not null  
                                
                                
   ,kor   int         not null                           
   ,eng   int         not null
   ,mat   int         not null
   ,tot   int         null     
   ,aver  int                   
);

--sungjuk 테이블 조회
select * from sungjuk;

////////////////////////////////////////////////////////////////

● [alter문] - 테이블의 구조 수정 및 변경

1. 칼럼 추가
    형식) alter table table명 add (칼럼명 데이터타입);
    select * from sungjuk;
    
--music 칼럼 추가
alter table sungjuk add (music int null);

2. 칼럼명 수정
    형식) alter table table명 rename column 원래컬럼몀 to 바꿀컬럼몀;
    
--국어칼럼 kor를 korea칼럼몀으로 수정하시오
alter table sungjuk rename column kor to korea;
select * from sungjuk;

3. 컬럼 데이터 타입 수정
    형식) alter table table명 modify(컬럼명 데이터타입);

--music 칼럼의 자료형을 varchar 로 수정하시오
alter table sungjuk modify (music varchar(5));
select * from sungjuk;

4. 컬럼 삭제
--music칼럼을 삭제하시오
alter table sungjuk drop (music);
select * from sungjuk;

