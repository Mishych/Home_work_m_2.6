SELECT g.group_name, avg(a.assessment) as averageAss
FROM students_table_1 AS s
INNER JOIN group_table_1 AS g ON g.group_id = s.group_id
INNER JOIN assessment_table_1 AS a ON a.student_id = s.student_id
WHERE a.subject_id = 2
GROUP BY g.group_name 
ORDER BY averageAss DESC; 

