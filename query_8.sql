select t.name_teacher, s.name_subject, avg(a.assessment) as averageASS
from subject_table_1 as s
inner join teacher_table_1 as t on t.id_teacher = s.teacher_id
inner join assessment_table_1 as a on s.subject_id = a.subject_id 
where t.id_teacher = 2
group by a.subject_id;
