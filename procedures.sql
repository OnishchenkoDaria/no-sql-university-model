-- soft delete for the student
CREATE OR REPLACE PROCEDURE SoftDeleteStudent(
    IN studentID INT,
    IN modifiedBy VARCHAR(255)
)
BEGIN
    UPDATE student
    SET isActive = FALSE, lastModified = NOW(), whoModified = modifiedBy
    WHERE id = studentID;
END;

-- recovering student
CREATE OR REPLACE PROCEDURE RecoverStudent(
    IN studentID INT,
    IN modifiedBy VARCHAR(255)
)
BEGIN
    UPDATE student
    SET isActive = TRUE, lastModified = NOW(), whoModified = modifiedBy
    WHERE id = studentID;
END;

-- soft delete for the tutor
CREATE OR REPLACE PROCEDURE SoftDeleteTutor(
    IN tutorID INT,
    IN modifiedBy VARCHAR(255)
)
BEGIN
    UPDATE tutor
    SET isActive = FALSE, lastModified = NOW(), whoModified = modifiedBy
    WHERE id = tutorID;
END;

-- recovery for tutor
CREATE OR REPLACE PROCEDURE RecoverTutor(
    IN tutorID INT,
    IN modifiedBy VARCHAR(255)
)
BEGIN
    UPDATE tutor
    SET isActive = TRUE, lastModified = NOW(), whoModified = modifiedBy
    WHERE id = tutorID;
END;

-- renew eliminated student
CREATE OR REPLACE PROCEDURE RenewStudent(
    IN studentId INT,
    IN newGroupId INT,
    IN currentAcademicYear INT
)
BEGIN
    -- Update the student to make them active
    UPDATE university.student
    SET isActive = TRUE,
        lastModified = NOW(),
        whoModified = 'admin'
        /*previousGrades = NULL*/
    WHERE id = studentId;

    -- Update the group assignment
    UPDATE university.`group`
    SET students = studentId,
        academicYear = currentAcademicYear,
        isActive = TRUE
    WHERE id = newGroupId;
END;

-- resetting student's renew process
CREATE OR REPLACE PROCEDURE ResetStudent(IN studentId INT, IN previousGroupId INT)
BEGIN
    -- Reset the student to inactive
    UPDATE university.student
    SET isActive = FALSE,
        lastModified = NOW(),
        whoModified = 'admin'
    WHERE id = studentId;

    -- Optionally reset the group assignment
    UPDATE university.`group`
    SET students = NULL,
        isActive = FALSE
    WHERE id = previousGroupId;
END;

CREATE OR REPLACE PROCEDURE MarkHomeworkAsDone(
    IN homeworkId INT,
    IN feedbackScore INT,
    IN feedbackComment VARCHAR(255),
    IN studentId INT,
    IN tutorId INT
)
BEGIN
    DECLARE lastFeedbackId INT DEFAULT 0;

    -- Get the last feedback id to insert the next feedback record with the next available ID
    SELECT IFNULL(MAX(id), 0) + 1 INTO lastFeedbackId FROM university.feedback;

    -- Mark the homework as completed
    UPDATE university.homework
    SET isCompleted = TRUE,
        lastModified = NOW(),
        whoModified = 'system'
    WHERE id = homeworkId;

    -- Insert the feedback for the homework
    INSERT INTO university.feedback (id, score, student_id, tutor_id, comment, datePosted, lastModified, whoModified)
    VALUES (lastFeedbackId, feedbackScore, studentId, tutorId, feedbackComment, NOW(), NOW(), 'system');

    -- Update the feedback reference in the homework table
    UPDATE university.homework
    SET feedback = lastFeedbackId
    WHERE id = homeworkId;
END;

-- resetting homework check
CREATE OR REPLACE PROCEDURE ResetHomeworkAndFeedback(
    IN homeworkId INT
)
BEGIN
    DECLARE feedbackId INT;

    -- Get the feedback ID related to the homework
    SELECT feedback INTO feedbackId FROM university.homework WHERE id = homeworkId;

    -- Reset the homework
    UPDATE university.homework
    SET isCompleted = FALSE,
        lastModified = NOW(),
        whoModified = 'system',
        feedback = NULL
    WHERE id = homeworkId;

    -- Delete the feedback if it exists
    IF feedbackId IS NOT NULL THEN
        DELETE FROM university.feedback WHERE id = feedbackId;
    END IF;
END;
