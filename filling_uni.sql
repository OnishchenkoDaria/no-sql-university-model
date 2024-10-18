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
(3, 75, 3, 'Room 303', '2023-06-01', NOW(), 'admin'),
(4, 80, 1, 'Room 101', '2023-05-10', NOW(), 'admin'),
(5, 88, 2, 'Room 202', '2023-05-12', NOW(), 'admin');

-- filling with data Credit table
INSERT INTO university.credit (id, status, TutorCouncil, room, date, lastModified, whoModified) VALUES
(1, 'Passed', 1, 'Room 101', '2023-05-11', NOW(), 'admin'),
(2, 'Pending', 2, 'Room 202', '2023-05-13', NOW(), 'admin'),
(3, 'Failed', 3, 'Room 303', '2023-06-02', NOW(), 'admin'),
(4, 'Passed', 1, 'Room 101', '2023-05-11', NOW(), 'admin'),
(5, 'Passed', 2, 'Room 202', '2023-05-13', NOW(), 'admin');

-- filling with data GradeList table
INSERT INTO university.gradelist (id, subjectName, exams, credits) VALUES
(1, 'Advanced Mathematics', 1, 1),
(2, 'Robotics Fundamentals', 2, 2),
(3, 'Classical Mechanics', 3, 3),
(4, 'Data Structures', 1, 1),
(5, 'Control Systems', 2, 2);

-- filling with data AcademicRecords table
INSERT INTO university.academicrecords (id, currentGrades, schedule) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 1);

-- filling with data Student table
INSERT INTO university.student (id, name, email, gender, isActive, lastModified, whoModified, AcademicAchievements, previousGrades) VALUES
(1, 'Alice Johnson', 'alice.j@university.com', 'F', TRUE, NOW(), 'admin', 1, 1),
(2, 'Bob Lee', 'bob.lee@university.com', 'M', TRUE, NOW(), 'admin', 2, 2),
(3, 'Charlie Brown', 'charlie.b@university.com', 'M', FALSE, NOW(), 'admin', 3, 3),
(4, 'David Smith', 'david.s@university.com', 'M', FALSE, NOW(), 'admin', 1, 1);

-- filling with data Group table
INSERT INTO university.`group` (id, students, major, academicYear, isActive) VALUES
(1, 1, 1, 2023, TRUE),
(2, 2, 2, 2023, TRUE),
(3, 3, 3, 2022, TRUE),
(4, 4, 1, 2022, FALSE);

-- filling with data Course table
INSERT INTO university.course (id, name, description, startDate, finishDate, majors) VALUES
(1, 'Introduction to Software Engineering', 'Basic concepts of software development', '2023-09-01', '2023-12-20', 1),
(2, 'Robotics Principles', 'Fundamentals of robotics and automation', '2023-09-01', '2023-12-20', 2);

-- Filling with data DayTimetable table
INSERT INTO university.daytimetable (id, day, startTime, finishTime, lectures, labs) VALUES
 (1, 'Monday', '08:00', '10:00', 1, 1),
 (2, 'Wednesday', '10:00', '12:00', 2, 2),
 (3, 'Friday', '13:00', '15:00', 3, 1);

-- Filling with data Lab table
INSERT INTO university.lab (id, course_id, subgroups, labName, description) VALUES
(1, 1, 1, 'Software Engineering Lab', 'Practical lab for software engineering'),
(2, 2, 2, 'Robotics Lab', 'Hands-on activities with robotics equipment');

-- Filling with data Lecture table
INSERT INTO university.lecture (id, topic, `group`, description, lectureDate, room) VALUES
(1, 'Introduction to Software Development', 1, 'Overview of software engineering principles', '2023-09-04', 101),
(2, 'Robotics Sensors and Actuators', 2, 'Understanding sensors in robotics', '2023-09-05', 202),
(3, 'Classical Mechanics: Newton\'s Laws', 3, 'In-depth study of classical mechanics', '2023-09-06', 303);

-- Filling with data Feedback table
INSERT INTO university.feedback (id, score, student_id, tutor_id, comment, datePosted, lastModified, whoModified) VALUES
(1, 90, 1, 1, 'Great job on the assignment!', '2023-09-15', NOW(), 'admin'),
(2, 85, 2, 2, 'Needs improvement on coding practices.', '2023-09-16', NOW(), 'admin'),
(3, 70, 3, 3, 'Good understanding of the theory.', '2023-09-17', NOW(), 'admin');

-- Filling with data Homework table
INSERT INTO university.homework (id, feedback, assignmentDetail, dueDate, assignedDate, isCompleted, lastModified, whoModified) VALUES
(1, 1, 'Complete the first software engineering assignment', '2023-09-20', '2023-09-10', TRUE, NOW(), 'admin'),
(2, 2, 'Build a simple robotic arm', '2023-09-21', '2023-09-11', FALSE, NOW(), 'admin'),
(3, 3, 'Solve problems on Newton\'s laws', '2023-09-22', '2023-09-12', TRUE, NOW(), 'admin');

-- Filling with data Subgroup table
INSERT INTO university.subgroup (id, practiceTutor_id, room, students_id, homework) VALUES
(1, 1, 101, 1, 1),
(2, 2, 202, 2, 2),
(3, 3, 303, 3, 3);

-- Filling with data LibraryResource table
INSERT INTO university.libraryresource (id, title, author, ISBN, availableCopies) VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', '9780262033848', 3),
(2, 'Robotics: Control, Sensing, Vision, and Intelligence', 'K.S. Fu', '9780070226252', 2),
(3, 'Classical Mechanics', 'John R. Taylor', '9781891389221', 5);

-- Filling with data Library table
INSERT INTO university.library (id, resource_id, student_id, issueDate, dueDate) VALUES
(1, 1, 1, '2023-09-05', '2023-09-15'),
(2, 2, 2, '2023-09-06', '2023-09-16'),
(3, 3, 3, '2023-09-07', '2023-09-17');

