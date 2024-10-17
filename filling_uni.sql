-- filling with data Faculty table
INSERT INTO university.faculty (id, name, departments) VALUES
(1, 'Engineering', 3),
(2, 'Science', 2),
(3, 'Arts', 1);

-- filling with data Department table
INSERT INTO university.department (id, name, faculty_id) VALUES
(1, 'Computer Science', 1),
(2, 'Mechanical Engineering', 1),
(3, 'Physics', 2),
(4, 'Chemistry', 2),
(5, 'Philosophy', 3);

-- filling with data Major table
INSERT INTO university.major (id, name, department) VALUES
(1, 'Software Engineering', 1),
(2, 'Robotics', 2),
(3, 'Astrophysics', 3),
(4, 'Organic Chemistry', 4),
(5, 'Metaphysics', 5);

-- filling with data Tutor table
INSERT INTO university.tutor (id, name, email, gender, department, isActive, lastModified, whoModified, hireDate) VALUES
(1, 'Dr. John Smith', 'jsmith@university.com', 'M', 1, TRUE, NOW(), 'admin', '2018-08-01'),
(2, 'Dr. Jane Doe', 'jdoe@university.com', 'F', 2, TRUE, NOW(), 'admin', '2017-06-15'),
(3, 'Prof. Alan Turing', 'aturing@university.com', 'M', 3, TRUE, NOW(), 'admin', '2016-09-10'),
(4, 'Prof. Marie Curie', 'mcurie@university.com', 'F', 4, TRUE, NOW(), 'admin', '2015-05-20'),
(5, 'Dr. Aristotle', 'aristotle@university.com', 'M', 5, FALSE, NOW(), 'admin', '2010-03-12');

-- filling with data Schedule table
INSERT INTO university.schedule (id, room_id, classTime, daysOfWeek) VALUES
(1, 101, '08:00 - 10:00', 'Mon, Wed, Fri'),
(2, 202, '10:00 - 12:00', 'Tue, Thu'),
(3, 303, '13:00 - 15:00', 'Mon, Wed');

-- filling with data Exam table
INSERT INTO university.exam (id, grade, TutorCouncil, room, date, lastModified, whoModified) VALUES
(1, 85, 1, 'Room 101', '2023-05-10', NOW(), 'admin'),
(2, 90, 2, 'Room 202', '2023-05-12', NOW(), 'admin'),
(3, 75, 3, 'Room 303', '2023-06-01', NOW(), 'admin');

-- filling with data Credit table
INSERT INTO university.credit (id, status, TutorCouncil, room, date, lastModified, whoModified) VALUES
(1, 'Passed', 1, 'Room 101', '2023-05-11', NOW(), 'admin'),
(2, 'Pending', 2, 'Room 202', '2023-05-13', NOW(), 'admin'),
(3, 'Failed', 3, 'Room 303', '2023-06-02', NOW(), 'admin');

-- filling with data GradeList table
INSERT INTO university.gradelist (id, subjectName, exams, credits) VALUES
(1, 'Advanced Mathematics', 1, 1),
(2, 'Robotics Fundamentals', 2, 2),
(3, 'Classical Mechanics', 3, 3);

-- filling with data AcademicRecords table
INSERT INTO university.academicrecords (id, currentGrades, schedule) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- filling with data Student table
INSERT INTO university.student (id, name, email, gender, isActive, lastModified, whoModified, AcademicAchievements, previousGrades) VALUES
(1, 'Alice Johnson', 'alice.j@university.com', 'F', TRUE, NOW(), 'admin', 1, 1),
(2, 'Bob Lee', 'bob.lee@university.com', 'M', TRUE, NOW(), 'admin', 2, 2),
(3, 'Charlie Brown', 'charlie.b@university.com', 'M', FALSE, NOW(), 'admin', 3, 3);

-- filling with data Group table
INSERT INTO university.`group` (id, students, major, academicYear, isActive) VALUES
(1, 1, 1, 2023, TRUE),
(2, 2, 2, 2023, TRUE),
(3, 3, 3, 2022, TRUE);

-- filling with data Course table
INSERT INTO university.course (id, name, description, startDate, finishDate, majors) VALUES
(1, 'Introduction to Software Engineering', 'Basic concepts of software development', '2023-09-01', '2023-12-20', 1),
(2, 'Robotics Principles', 'Fundamentals of robotics and automation', '2023-09-01', '2023-12-20', 2);


