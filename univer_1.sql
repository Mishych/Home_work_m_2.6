-- Table: group_table
DROP TABLE IF EXISTS group_table;
CREATE TABLE group_table_1 (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(255) UNIQUE NOT NULL
);


-- Table: students_table
DROP TABLE IF EXISTS students_table;
CREATE TABLE students_table_1 (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_student VARCHAR(120) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES group_table (group_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


-- Table: teacher_table
DROP TABLE IF EXISTS teacher_table;
CREATE TABLE teacher_table_1 (
    id_teacher INTEGER PRIMARY KEY AUTOINCREMENT,
    name_teacher VARCHAR(120) NOT NULL
);


-- Table: subject_table
DROP TABLE IF EXISTS subject_table;
CREATE TABLE subject_table_1 (
    subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_subject VARCHAR(120) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teacher_table (teacher_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


-- Table: assessment_table
DROP TABLE IF EXISTS assessment_table;
CREATE TABLE assessment_table_1 (
    student_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    assessment INTEGER,
    date_of DATE,
    FOREIGN KEY (student_id) REFERENCES students_table (student_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject_table (subject_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


SELECT student_id, count(student_id) as averageAss
FROM assessment_table_1;


SELECT student_id, avg(assessment) as averageAss
FROM assessment_table_1
GROUP BY student_id
ORDER BY averageAss DESC
LIMIT 5;


SELECT student_id, avg(assessment) as averageAss
FROM assessment_table_1 WHERE subject_id = 3
GROUP BY student_id
ORDER BY averageAss DESC;

SELECT 

SELECT AVG(assessment) FROM assessment_table_1;


