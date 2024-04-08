SELECT s.name_subject, t.name_teacher  
FROM subject_table_1 AS s
INNER JOIN teacher_table_1 AS t
ON s.teacher_id = t.id_teacher
WHERE s.teacher_id  = 2;