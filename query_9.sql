select s.name_student, sb.name_subject
from assessment_table_1 as a
inner join students_table_1 as s on a.student_id = s.student_id 
inner join subject_table_1 as sb on sb.subject_id = a.subject_id 
where s.student_id  = 1
group by sb.name_subject; 