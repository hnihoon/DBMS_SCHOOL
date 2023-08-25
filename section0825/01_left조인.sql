�� [left join �� fight join]

--�л����̺��� ��� ���� ��������, �������̺����� �й��� ��ġ�ϴ� �ุ ��������
select st.*, su.*
from tb_student st left join tb_sugang su
on st.hakno = su.hakno;

--��1) left join�� �̿��ؼ� ������û�� ���� ���� �й�, �̸� ,�����ڵ带 ��ȸ�Ͻÿ�
select st.*, su.*
from tb_student st left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

--��2) right join�� �̿��ؼ� ������û�� ���� ���� �й�,�̸�,�����ڵ� ��ȸ�Ͻÿ�
select st.hakno, st.uname, su.hakno, su.gcode
from tb_sugang su right join tb_student st
on su.hakno = st.hakno
where su.hakno is null;
////////////////////////////////////////////////////////////////////////////////

�� [ (+)��ȣ�� �̿��� ���̺� ���� ] 
   (+)��ȣ�� ��ġ���� �ʴ� ���� �����ϴ� ���� �ʿ� ���δ�
   
select st.hakno, st.uname, su.gcode, su.hakno
from tb_student st, tb_sugang su
where st.hakno = su.hakno(+);       --left join

select su.hakno, su.gcode, st.uname, st.hakno
from tb_student st, tb_sugang su
where st.hakno(+) = su.hakno;       --right join