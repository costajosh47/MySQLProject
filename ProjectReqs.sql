use sql_project_two;

-- The average grade that is given by each professor
select avg(grade_score), grade_professor_id
from grades
group by grade_professor_id;

-- The top grades for each student
select max(grade_score), grade_student_id
from grades
group by grade_student_id;

-- Group students by the courses that they are enrolled in
select course_name, student_name, grade_score
from courses c
join grades g
on c.course_id = g.grade_course_id
join students s
on s.student_id = g.grade_student_id
order by course_name;

-- Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course
select course_name, avg(grade_score)
from courses c 
join grades g
on c.course_id = g.grade_course_id
group by course_id
order by avg(grade_score);

-- Finding which student and professor have the most courses in common
SELECT count(*), professor_name, student_name
FROM grades g
JOIN professors p
ON g.grade_professor_id = p.professor_id
JOIN students s
on g.grade_student_id = s.student_id
GROUP BY professor_id, student_id
ORDER BY count(*);