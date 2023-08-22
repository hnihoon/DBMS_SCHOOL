※ 참조 : http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

--가상 테이블 : bual

● [오라클 함수]

1. 문자열 관련 함수
select lower('Hello World')from dual;           --전부 소문자로 변환
select upper('Hello World')from dual;           --전부 대문자로 변환
select length('Hello World')from dual;          --글자갯수
select substr('Hello World', 1, 5)from dual;    --문자열 자르기(첫번째 글자부터 5개)'Hello'

select instr('Hello World','W')from dual;       --특정문자 위치 체크 6
select lpad('SKY', 5, '*')from dual;            --5칸내에서 출력하고 왼쪽 빈칸은 *로 채움
select rpad('SKY', 5, '*')from dual;            --5칸내에서 출력하고 오른쪽 빈칸은 *로 채움
select replace('happy', 'p', 'k')from dual;     --특정문자 변환

--문자열 연결하기
select concat('로미오', '줄리엣')from dual;     --로미오줄리엣
select concat(uname, '의 평균은'), concat(aver, '입니다') from sungjuk;  
select concat(uname, '의 평균은') as 이름, concat(aver, '입니다') as 평균 from sungjuk;

-- 결합연산자 ||
select uname || '의 평균은'  || aver || '입니다' from sungjuk;
select uname || '의 평균은'  || aver || '입니다' as str from sungjuk;

--ASCII 문자 변환
select chr(65) from dual;   --'A'
select chr(66) from dual;   --'B'
select chr(97) from dual;   --'a'
select chr(98) from dual;   --'b'

select '#' || chr(32) || '#' from dual;   --공백

select chr(43) from dual;   --'+'
select chr(45) from dual;   --'-'
select chr(42) from dual;   --'*'
select chr(47) from dual;   --'/'
////////////////////////////////////////////////////////////////////////////////

2. 숫자 관련 함수
select abs(-7) from dual;               --절대값
select mod(5,3) from dual;              --나머지함수
select ceil(12.4) from dual;            --올림함수
select trunc(13.56,1) from dual;        --내림함수

select avg(kor) from sungjuk;           -- 66.363636
select ceil(avg(kor)) from sungjuk;     -- 67
select trunc(avg(kor),2) from sungjuk;  --66.36
select round(avg(kor),2) from sungjuk;  --66.36
////////////////////////////////////////////////////////////////////////////////

3. 날짜 관련 함수
select sysdate from dual;   -- 시스템의 현재 날짜와 시간 정보를 리턴하는 함수

-- 날짜데이터의 연산
select sysdate+100 from dual;   --오늘날짜+100일
select sysdate-100 from dual;   --오늘날짜-100일

-- sysdate에서 년월일 추출하기
select extract(year from sysdate) from dual;    --2023
select extract(month from sysdate) from dual;   --8
select extract(day from sysdate) from dual;     --22

--두개의 날짜데이터에서 개월 수 계산
select months_between('2023-08-22', '2022-10-30') from dual; --9.7
select months_between('2023-08-22', '2023-12-31') from dual; ---4.2
////////////////////////////////////////////////////////////////////////////////

4. 형변환 함수
--TO_CHAR(원래 날짜, '원하는 모양')
-- 숫자와 날짜를 문자로 변환해주는 두가지 기능
select to_char(sysdate, 'YYYY-MM-DD') from dual;    --2023-08-22
select to_char(sysdate, 'MM/DD/YYYY') from dual;    --08/22/2023
select to_char(sysdate, 'DD-Mon-YYYY') from dual;   --22-8월 -2022

select to_char(sysdate, 'YYYY') from dual;          --2023
select to_char(sysdate, 'MM') from dual;            --08
select to_char(sysdate, 'DD') from dual;            --22

-- to_number('숫자형태의 문자열')
select to_number('123')+1 from dual;    --124
select '123'+1 from dual;               --124 내부적으로 to_number()가 호출됨

--TO_DATE('문자','날짜포맷')
--문자열을 날짜형으로 변환
select to_date('2023-08-22') from dual;  --23/08/22
select to_date('2023-08-22') - to_date('2023-05-30') from dual;     --84






