�� ���� : http://pretyimo.cafe24.com/lectureRead.do?lectureno=185

--�����ð��� ������� �÷����� ����
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'����Ƽ��', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

/////////////////////////////////////////////////////////////////

�� nvl() �Լ� - null���� �ٸ������� �ٲ�

����1) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select max(kor), count(*)
from sungjuk
where addr='Incheon';       --�ִ밪(null), �ο���(0)

select count(*)+1           --0+1
from sungjuk
where addr='Incheon';

select max(kor)+1           --null+1 -> null���� ������ �� ����
from sungjuk
where addr='Incheon';

--null���̸� 0���� ��ü��
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

����2) sungjuk���̺� �Ʒ� �����͸� ���߰� �Ͻÿ�

sno : max(sno) + 1
    ��, max()���� null 0���� �ٲ� �� ����Ѵ�.
uname : �����
kor   : 100
eng   : 100
mat   : 100
addr  : Seoul
wdate : sysdate

--1) snoĮ������ ���� ū�� ��������
select max(sno) from sungjuk;

--2) ���� 1)����� null�� ������ 0���� �ٲٱ�
select nvl(max(sno),0) from sungjuk;

--3) 2)����� +1 �����ϱ�
select nvl(max(sno),0)+1 from sungjuk;

--4) ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values((select nvl(max(sno),0)+1 from sungjuk), '�����', 100, 100, 100, 'Seoul', sysdate);

select * from sungjuk;

commit;