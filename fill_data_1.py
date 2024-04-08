from datetime import datetime
import faker
from random import randint, choice, randrange
import sqlite3


NUMBER_STUDENTS = 30
NUMBER_TEACHERS = 4
NUMBER_SUBJECT = 7
NUMBER_ASSESSMENTS = 15

GROUPS = ["CB-101", "CB-102","CB-103"]


def generate_fake_data(number_students, number_teachers, number_subject) -> tuple():
    
    fake_students = []  # тут зберігатимемо студентів
    fake_teachers = []  # тут зберігатимемо викладачів
    fake_subject = []
    
    fake_data = faker.Faker("uk_UA")

    for _ in range(number_students):
        fake_students.append(fake_data.name())
        
    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())
        
    for _ in range(number_subject):
        fake_subject.append(fake_data.word())
        
    return fake_students, fake_teachers, fake_subject # fake_assessments


def prepare_data(students, teachers, groups, subjects) -> tuple():
    
    for_students = []
    for_assessment = []
    for_teachers = []
    for_groups = []
    for_subject = []
    
    for student in students:
        id_group = randint(1, len(GROUPS))
        for_students.append((student, id_group))
        
    
    for student_id in range(1, len(students) + 1):
        
        for subject_id in range(1, len(subjects) + 1):
             
            month = 1 
            year = 2024
               
            for _ in range(randint(1, NUMBER_ASSESSMENTS)):
                assessment = randint(1, 12)
    
                if month == 13:
                    month = 1
                    year =+ 1
                    
                date_get_assessment = datetime(year, month, randint(10, 20)).date()
                month += 1
                
                for_assessment.append((student_id, subject_id, assessment, date_get_assessment))
                

    for teacher in teachers:
        for_teachers.append((teacher, ))
    
       
    for group in groups:
        for_groups.append((group, ))
        
    
    for sub in subjects:
        id_teacher = randint(1, NUMBER_TEACHERS)
        for_subject.append((sub, id_teacher))

    return for_students, for_teachers, for_groups, for_subject, for_assessment #, for_assessments


def insert_data_to_db(students, teachers, groups, subject, assessment) -> None:
    # Створимо з'єднання з нашою БД та отримаємо об'єкт курсору для маніпуляцій з даними

    with sqlite3.connect('univer_1.db') as con:

        cur = con.cursor()

        sql_to_students = """INSERT INTO students_table_1(name_student, group_id)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_students, students)

        sql_to_teachers = """INSERT INTO teacher_table_1(name_teacher)
                               VALUES (?)"""

        cur.executemany(sql_to_teachers, teachers)

        sql_to_groups = """INSERT INTO group_table_1(group_name)
                              VALUES (?)"""

        cur.executemany(sql_to_groups, groups)
        
        sql_to_teachers = """INSERT INTO subject_table_1(name_subject, teacher_id)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_teachers, subject)
        
        sql_to_assessment = """INSERT INTO assessment_table_1(student_id, subject_id, assessment, date_of)
                               VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_assessment, assessment)

        # Фіксуємо наші зміни в БД

        con.commit()


if __name__ == "__main__":
    
    student, teacher, subject = generate_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_SUBJECT)
    
    students, teachers, groups, subjects, assessments = prepare_data(student, teacher, GROUPS, subject)
    # print(assissments)
    insert_data_to_db(students, teachers, groups, subjects, assessments)
