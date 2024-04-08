SELECT s.name_student, avg(a.assessment) as averageAss
FROM assessment_table_1 AS a
INNER JOIN students_table_1 AS s ON s.student_id = a.student_id
WHERE a.subject_id = 3
GROUP BY s.student_id
ORDER BY averageAss DESC
LIMIT 1;
