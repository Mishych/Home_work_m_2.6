select s.name_student, t.name_teacher, sb.name_subject
from assessment_table_1 as a
inner join students_table_1 as s on a.student_id = s.student_id
inner join subject_table_1 as sb on a.subject_id = sb.subject_id 
inner join teacher_table_1 as t on t.id_teacher = sb.teacher_id
where t.id_teacher = 2 and s.student_id = 2
group by sb.subject_id;
