-- Подключитесь к базе данных Students (которая находится на удаленном сервере).
USE Students; 
-- Найдите самого старшего студента
SELECT first_name, age
FROM Students
ORDER BY age ASC
LIMIT 1;

-- Найдите самого старшего преподавателя

SELECT name, age
FROM Teachers
ORDER BY age ASC
LIMIT 1;


-- Выведите список преподавателей с количеством компетенций у каждого
select *
from Teachers;
select *
from Teachers2Competencies;

SELECT 
    t.name AS teacher_name, 
    COUNT(tc.id) AS teacher_competencies_count,
    GROUP_CONCAT(c.title ORDER BY c.title ASC SEPARATOR ', ') AS competencies_list
FROM 
    Teachers t
LEFT JOIN 
    Teachers2Competencies tc ON t.id = tc.teacher_id
LEFT JOIN 
    Competencies c ON tc.competencies_id = c.id
GROUP BY 
    t.name;

SELECT t.name, COUNT(tc.id) AS teacher_competncies
FROM Teachers t
LEFT JOIN Teachers2Competencies tc ON t.id = tc.teacher_id
GROUP BY t.name;

-- Выведите список курсов с количеством студентов в каждом

SELECT c.title AS course_name, COUNT(sc.student_id) AS student_count
FROM Courses c
LEFT JOIN Students2Courses sc ON c.id = sc.course_id
GROUP BY c.title;

-- Выведите список студентов, с количеством курсов, посещаемых каждым студентом.
SELECT s.first_name , COUNT(sc.course_id) AS course_count
FROM Students s
LEFT JOIN Students2Courses sc ON s.id = sc.student_id
GROUP BY s.first_name;
