�� Ʈ���� Trigger
  - ��Ƽ�, �����ͺ��̽������� �������� ������ ������
  - insert,update, delete���� ����� �� ���������� ����Ǵ� ���ν���
  

--�ܼ�â ��� dbms_output.put_line �� �����
set serveroutput on;
////////////////////////////////////////////////////////////////////////////////

--����)
--sungjuk���̺��� ���������� ����� ���Ͻÿ�
select avg(kor) from sungjuk; --71.5384...

--���������� �߰�, ����, ������ �Ǹ� ��ü ������յ� �޶�����,
--�ٲ� ������� ���� ����Ѵ�

create or replace trigger kor_trigger
after
    insert or update or delete on sungjuk
declare
    avg_kor number;
begin
    select avg(kor) into avg_kor from sungjuk;
    dbms_output.put_line('�������:' || avg_kor);
end;

--���߰�
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval, '�̼���',100, 100, 100, 'Seoul', sysdate); --������� 73.57

--�����
update sungjuk set kor=0 where sno=1;

--�����
delete from sungjuk where sno=12;

commit;
