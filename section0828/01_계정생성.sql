● [오라클 사용자 계정 생성]

-- 계정 생성시 세션 변경해야 함
alter session set "_ORACLE_SCRIPT"=true;

--사용자 계정 목록
select username from all_users;

--테이블스페이스(테이블의 저장 공간) 생성
형식) create tablespace 테이블스페이스이름
      datafile '데이터파일경로' size 초기사이즈
      autoextend on
      next 자동증가사이즈
      maxsize 최대사이즈;
      
create tablespace itwill
      datafile 'D:\java202307\database\section0828/itwill.dbf' size 50m
      autoextend on
      next 10m
      maxsize unlimited;
    
select tablespace_name, contents from dba_tablespaces;

연습)
create user java202307 identified by 1234
default tablespace itwill;

--사용자 계정 목록
select username from all_users;

--모든 권한 부여
grant connect, resource, dba to java202307;

※ connect   접속권한
   resource  데이터베이스안에 있는 자원들을 사용할 수 있는 권한
   dba       관리자권한
   
commit;

-- 명령프롬프트에서 권한 부여된 itwill 로그인 하기
>sqlplus java202307/1234

--사용자 계정 삭제
drop user java202307 cascade;
commit;

--테이블스페이스 삭제
형식) drop tablespace 테이블스페이스 명
    including contents and datariles
    cascade constraints;
    
연습)
drop tablespace itwill
including contents and datafiles
cascade constraints;

commit;