
-- "deletes" Alice Johnson by setting isActive to false
CALL SoftDeleteTutor(3, 'admin1');
SELECT * FROM active_tutors;

-- "restores" Alice Johnson by setting isActive to true
CALL RecoverTutor(3, 'admin');
SELECT * FROM active_tutors;

-- renew eliminated previously student
CALL RenewStudent(4, 1, 2023);

-- "deletes" Alice Johnson by setting isActive to false
CALL SoftDeleteStudent(1, 'admin1');
SELECT * FROM active_students;

-- check homework and return feedback
SELECT * FROM homework_feedback;
CALL ResetHomeworkAndFeedback(2);
CALL MarkHomeworkAsDone(2, 90, 'Great job!', 2, 2);
SELECT * FROM homework_feedback;

-- get students' average score
SELECT CalculateStudentAverage(1) AS average_score;
SELECT CalculateStudentAverage(2) AS average_score;
SELECT CalculateStudentAverage(3) AS average_score;

SELECT
    s.id AS student_id,
    s.name AS student_name,
    CalculateStudentAverage(s.id) AS average_score
FROM
    university.student s;

-- resetting renew process & homework
CALL ResetStudent(4, 4);
CALL ResetHomeworkAndFeedback(2);

-- "restores" Alice Johnson by setting isActive to true
CALL RecoverStudent(1, 'admin');
SELECT * FROM active_students;