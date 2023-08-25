�� ����->���θ����->�����ͺ��̽�����->�����ͺ��̽� ����
   ->���ϸ�   : 03_���ο�������.sql
   ->������ġ : E:\java202307\database\section0824   
///////////////////////////////////////////////////////////////////////////////


�� [���̺� ���� ���� ����]

��1) ������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

--���� ��û�� �л��� ��� ����
select * from tb_sugang;

--�������̺� + �л����̺�
select SU.*, uname, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno;

--'����'�� ��ȸ�ϱ�
select SU.*, uname, address
from tb_sugang SU inner join tb_student ST
on SU.hakno = ST.hakno
where address='����';


--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ� 
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
      ) AA;


-- ORA-00904: "AA"."EMAIL": �������� �ĺ���
-- ST ���̺��� emailĮ���� �������� �ʾ��� 
select AA.hakno, AA.gcode, AA.uname, AA.address, AA.email
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
      ) AA;


select AA.hakno, AA.gcode, AA.uname, AA.address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
      ) AA
where AA.address='����';


-- AA��Ī ���� ���� 
select hakno, gcode, uname, address
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
      ) 
where address='����';


-- AA���̺��� ��� Į��
select *
from (
        select SU.hakno, SU.gcode, uname, address
        from tb_sugang SU inner join tb_student ST
        on SU.hakno = ST.hakno
      ) 
where address='����';
///////////////////////////////////////////////////////////////////////////////


��2) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
        d001	HTML	2��
        d002	���伥	1��
        d003	�Ϸ���Ʈ	1��
        p001	JAVA	4��
        p002	Oracle	2��
        p003	JSP     2��
        p004	Python	1��
        p005	AJAX	1��
        
--1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;        
        
--2) �������̺��� �����ڵ尡 ������ ���� �׷�ȭ �ϱ�
select gcode, count(*)
from tb_sugang
group by gcode;
        
--3) 2)�� ����� AA���̺�� �����ϰ�, �������̺� �����ϱ�       
select AA.gcode, GW.gname, concat(AA.cnt, '��')
from (
        select gcode, count(*) as cnt
        from tb_sugang
        group by gcode
     ) AA  inner join tb_gwamok GW
on AA.gcode = GW.gcode
order by AA.gcode;    
///////////////////////////////////////////////////////////////////////////////


��3) ������û�� �� �л����� �й�, �̸� ��ȸ
     g1001  ȫ�浿
     g1002  ȫ�浿
     g1005  ���޷�
     g1006  ������
     
--1) ������û�� �� �л����� �й� ��ȸ
select hakno from tb_sugang order by hakno;
select distinct hakno from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001','g1002','g1005','g1006');

--3) 1)�� ����� �������� ���·� ��ȸ
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);


��4) ������û�� ���� ���� �л����� �й�, �̸� ��ȸ
     g1003  ������
     g1004  ȫ�浿

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);
////////////////////////////////////////////////////////////////////////////////

��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
        g1001	d001	HTML
        g1001	p001	JAVA
        g1001	p002	Oracle
        g1001	p003	JSP
        g1001	p004	Python
        g1001	p005	AJAX

--1) �й� g1001 ������û ���
select * from tb_sugang where hakno ='g1001';

--2) �������̺� + �������̺� ����

select su.hakno, su.gcode, gw.gname,gw.gcode
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode;

--3) �й� g1001�� ��û�� ������ ��ȸ�ϱ�
select su.hakno, su.gcode, gw.gname,gw.gcode
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno= 'g1001';

--4) �����ڵ� �����ϱ�
select su.hakno, su.gcode, gw.gname,gw.gcode
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno= 'g1001'
order by su.gcode;

--5) �ߺ��Ǵ� Į������ ���̺� ���� �����ϱ�
select hakno, su.gcode,gw.gcode,gname
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
where su.hakno= 'g1001'
order by su.gcode;


��6) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
        g1001	ȫ�浿	14����
        g1002	ȫ�浿	8����
        g1005	���޷�	12����
        g1006	������	3����

--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2)�������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select su.hakno, gw.gcode, gw.ghakjum
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode;

--3) 2)�� ����� AA���̺�� �����, �й����� �׷�ȭ�� ��, ������ �հ� ���ϱ�
select hakno, sum(AA.ghakjum) as hap
from(
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
)AA
group by AA.hakno;

--4) 3)�� ����� BB���̺�� �����, �й��� �������� �л����̺��� �̸� �����ͼ� ���̱�
select bb.hakno, st.uname, concat(bb.hap, '����')
from(
select hakno, sum(AA.ghakjum) as hap
from(
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su inner join tb_gwamok gw
on su.gcode = gw.gcode
)AA
group by AA.hakno
)BB inner join tb_student st
on bb.hakno = st.hakno;

��6)�� �Ǵٸ� ���
--1) �������̺� + �л����̺� + �������̺� - 3�� ���̺� �Ѳ����� ����
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang su inner join tb_student st
on su.hakno = st.hakno inner join tb_gwamok gw
on su.gcode = gw.gcode
order by su.hakno;

--2) 1���׷�(�й�), 2���׷�(�̸�)���� �׷�ȭ�ϰ�, ������ ���ϱ�
select su.hakno, st.uname, sum(gw.ghakjum) || '����' as hap
from tb_sugang su inner join tb_student st
on su.hakno = st.hakno inner join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno, st.uname;

��7) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
        ���� 2��
        ���� 2��

--1) �������̺� ��ȸ
select * from tb_sugang order by hakno;

--2) ���� ��û�� �л����� ��� ��ȸ (�й�)
select hakno from tb_sugang group by hakno;


--3) ������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select AA.hakno, st.address
from (
select hakno from tb_sugang group by hakno
)AA inner join tb_student st
on AA.hakno = st.hakno;

--4 3)�� ����� BB���̺�� ���� ��, �ּҺ� ���� ��ȸ
select BB.address,count(*)
from(
select AA.hakno, st.address
from (
select hakno from tb_sugang group by hakno
)AA inner join tb_student st
on AA.hakno = st.hakno
) BB
group by BB.address;

--5) 4)�� ������� Į���� �ο�, ���̺� ��Ī ����
select address,concat(count(*),'��') as cnt
from(
select AA.hakno, st.address
from (
select hakno from tb_sugang group by hakno
)AA inner join tb_student st
on AA.hakno = st.hakno
) 
group by address;

