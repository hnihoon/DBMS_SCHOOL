--sungjuk ���̺� ����
DROP TABLE sungjuk;

--sungjuk ���̺� ����
create table sungjuk (
    uname varchar(50) not null  
                                
                                
   ,kor   int         not null                           
   ,eng   int         not null
   ,mat   int         not null
   ,tot   int         null     
   ,aver  int                   
);

--sungjuk ���̺� ��ȸ
select * from sungjuk;

////////////////////////////////////////////////////////////////

�� [alter��] - ���̺��� ���� ���� �� ����

1. Į�� �߰�
    ����) alter table table�� add (Į���� ������Ÿ��);
    select * from sungjuk;
    
--music Į�� �߰�
alter table sungjuk add (music int null);

2. Į���� ����
    ����) alter table table�� rename column �����÷��m to �ٲ��÷��m;
    
--����Į�� kor�� koreaĮ���m���� �����Ͻÿ�
alter table sungjuk rename column kor to korea;
select * from sungjuk;

3. �÷� ������ Ÿ�� ����
    ����) alter table table�� modify(�÷��� ������Ÿ��);

--music Į���� �ڷ����� varchar �� �����Ͻÿ�
alter table sungjuk modify (music varchar(5));
select * from sungjuk;

4. �÷� ����
--musicĮ���� �����Ͻÿ�
alter table sungjuk drop (music);
select * from sungjuk;

