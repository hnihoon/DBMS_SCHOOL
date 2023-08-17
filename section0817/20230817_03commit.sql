[명령어 완료와 취소]
- insert, update, delete 명령어를 사용하는 경우, 명령어 취소와 명령어 완료를 선택할 수 있다.
- commit	: 명령어 완료
- rollback  : 명령어 취소

[전체 행 삭제]
delete from sungjuk;

[전체 행 조회]
select * from sungjuk;

commit;
rollback;

update sungjuk set tot=kor+eng+mat;

update sungjuk set aver=(kor+eng+mat)/3;
 