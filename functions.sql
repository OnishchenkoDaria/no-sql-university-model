CREATE FUNCTION CalculateStudentAverage(studentId INT)
    RETURNS DECIMAL(5, 2)
    DETERMINISTIC
BEGIN
    DECLARE avgExamGrade DECIMAL(5, 2);
    DECLARE avgCreditGrade DECIMAL(5, 2);
    DECLARE totalAverage DECIMAL(5, 2);

    -- Calculate the average exam grade for the student
    SELECT AVG(e.grade) INTO avgExamGrade
    FROM university.exam e
             JOIN university.gradelist g ON e.id = g.exams
             JOIN university.student s ON s.previousGrades = g.id OR s.AcademicAchievements = g.id
    WHERE s.id = studentId;

    -- Calculate the average credit status for the student (assuming 'Passed' is 100, 'Pending' is 50, and 'Failed' is 0)
    SELECT AVG(CASE
                   WHEN c.status = 'Passed' THEN 100
                   WHEN c.status = 'Pending' THEN 50
                   WHEN c.status = 'Failed' THEN 0
        END) INTO avgCreditGrade
    FROM university.credit c
             JOIN university.gradelist g ON c.id = g.credits
             JOIN university.student s ON s.previousGrades = g.id OR s.AcademicAchievements = g.id
    WHERE s.id = studentId;

    -- Calculate the overall average
    SET totalAverage = (avgExamGrade + avgCreditGrade) / 2;

    RETURN totalAverage;
END