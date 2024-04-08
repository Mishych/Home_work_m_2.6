select g.group_name, s.name_student
from students_table_1 as s
inner join group_table_1 as g
on g.group_id = s.group_id
where s.group_id = 2;