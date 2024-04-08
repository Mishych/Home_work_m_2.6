select g.group_name, s.name_student, sb.name_subject, a.assessment
from students_table_1 as s
inner join group_table_1 as g on g.group_id = s.group_id 
inner join assessment_table_1 as a on a.student_id = s.student_id
inner join subject_table_1 as sb on sb.subject_id = a.subject_id
where g.group_id = 2 and sb.subject_id = 4;
