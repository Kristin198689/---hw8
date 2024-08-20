


--Найти самого старшего студента:


USE students;
USE Students;
SELECT name, MAX(age) AS age
FROM students;


--Найти самого старшего преподавателя:


SELECT name, MAX(age) AS age
FROM Teachers;


--Вывести список преподавателей с количеством компетенций у каждого:


SELECT t.name, COUNT(c.skill_id) AS skill_count
FROM Teachers t
LEFT JOIN competencies c ON t.id = c.teacher_id
GROUP BY t.name;  


--Вывести список курсов с количеством студентов в каждом:


SELECT c.course_name, COUNT(sc.student_id) AS student_count
FROM courses c
LEFT JOIN student_courses sc ON c.id = sc.course_id
GROUP BY c.course_name;


--Вывести список студентов с количеством курсов, посещаемых каждым студентом:

SELECT s.name, COUNT(sc.course_id) AS course_count
FROM students s
LEFT JOIN student_courses sc ON s.id = sc.student_id
GROUP BY s.name;subject; 
