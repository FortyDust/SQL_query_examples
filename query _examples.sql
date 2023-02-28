							-- ***********SELECT запросы***********
							
							
-- Вывод данных из таблицы которые попадают по запрашиваемые значения
SELECT *
FROM student
WHERE level = 'Beginner ' AND education_form = 'group';

/*Beginner */

-- Вывод таблицы subject
SELECT *
FROM subject;

-- Вывод таблицы users
SELECT *
FROM users;

-- Проверка вывода различных данных
SELECT user_email,
		subject_title
FROM users, subject; 
-- WHERE user_email = 'igorpetrov@mail.ru';
-- WHERE subject_title = 'Economics';

-- Созадние Alias
SELECT user_id,
		user_email AS email
FROM users;

/* В таблице students определите количество учеников с 
уровнем 'Upper-Intermediate', занимающихся в группе. */
SELECT COUNT(*)
FROM student
WHERE level = 'Upper-Intermediate' AND education_form = 'group';

/*В таблице users определите количество учеников, 
занимающихся по предмету 'Английский язык'(subject_id = 1) */
SELECT COUNT(*)
FROM users
WHERE subject_id = 1;

/* Определите id предмета (subject_id), 
который изучает наименьшее количество пользователей. 
Таблица для запроса - users.*/
SELECT subject_id,
		COUNT(*)
FROM users
GROUP BY subject_id
ORDER BY COUNT;

/*Определите наиболее распространенный уровень владения английским языком 
(level) среди учеников, изучающих английский язык. 
Таблица для запроса - student. */
SELECT level,
		COUNT(*)
FROM student
GROUP BY level
ORDER BY COUNT;

/*Определите наиболее распространенный уровень владения английским языком (level) 
среди учеников, изучающих английский язык в группе (education_form = 'group')
Таблица для запроса - student.  */
SELECT level,
		COUNT(*)
FROM student
WHERE education_form = 'group'
GROUP BY level
ORDER BY COUNT;

/*Напишите id группы, в которой наибольшее количество учеников.
Таблица для запроса - group_student. */
SELECT group_id,
		COUNT(*)
FROM group_student
GROUP BY group_id
ORDER BY COUNT DESC;

-- В какие группы входит студент с определенным id
SELECT *
FROM group_student
WHERE user_id = '14982';

							-- ***********JOIN запросы***********


/*Определите id учеников, которые занимаются в группе у преподавателя с teacher_id = 30239.
Таблицы для запроса: group_student и teacher. */
SELECT group_student.user_id,
	   teacher.teacher_id
FROM group_student
JOIN teacher
ON group_student.group_id = teacher.group_id
WHERE teacher_id = 30239;

/*Определите email преподавателя группы, в которой занимается ученик с user_id = 11527. 
Таблицы для запроса: group_student и teacher. */
SELECT group_student.user_id,
	   teacher.teacher_id,
	   teacher.email
FROM group_student
JOIN teacher
ON group_student.group_id = teacher.group_id
WHERE user_id = 11527;

/*Определите id преподавателя группы, в которой занимается наибольшее количество учеников. 
Таблицы для запроса: group_student и teacher. */
SELECT teacher.teacher_id,
	   COUNT(*)
FROM group_student
JOIN teacher
ON group_student.group_id = teacher.group_id
GROUP BY teacher_id
ORDER BY COUNT DESC;