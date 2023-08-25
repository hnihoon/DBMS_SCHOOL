● [left join 과 fight join]

--학생테이블의 모든 행을 가져오고, 수강테이블에서는 학번이 일치하는 행만 가져오기
select st.*, su.*
from tb_student st left join tb_sugang su
on st.hakno = su.hakno;

--문1) left join을 이용해서 수강신청을 하지 않은 학번, 이름 ,과목코드를 조회하시오
select st.*, su.*
from tb_student st left join tb_sugang su
on st.hakno = su.hakno
where su.hakno is null;

--문2) right join을 이용해서 수강신청을 하지 않은 학번,이름,과목코드 조회하시오
select st.hakno, st.uname, su.hakno, su.gcode
from tb_sugang su right join tb_student st
on su.hakno = st.hakno
where su.hakno is null;
////////////////////////////////////////////////////////////////////////////////

● [ (+)기호를 이용한 테이블 조인 ] 
   (+)기호는 일치되지 않는 행이 존재하는 않은 쪽에 붙인다
   
select st.hakno, st.uname, su.gcode, su.hakno
from tb_student st, tb_sugang su
where st.hakno = su.hakno(+);       --left join

select su.hakno, su.gcode, st.uname, st.hakno
from tb_student st, tb_sugang su
where st.hakno(+) = su.hakno;       --right join