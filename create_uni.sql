CREATE TABLE IF NOT EXISTS university.faculty (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`departments` INT
);

CREATE TABLE IF NOT EXISTS university.department (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`faculty_id` INT,
FOREIGN KEY (`faculty_id`) REFERENCES university.faculty (`id`)
);

CREATE TABLE IF NOT EXISTS university.major (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`department` INT,
FOREIGN KEY (`department`) REFERENCES university.department (`id`)
);

CREATE TABLE IF NOT EXISTS university.tutor (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`email` VARCHAR(255),
`gender` CHAR(1),
`department` INT,
`isActive` BOOLEAN,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
`hireDate` DATETIME,
FOREIGN KEY (`department`) REFERENCES university.department (`id`)
);

CREATE TABLE IF NOT EXISTS university.exam (
`id` INT PRIMARY KEY,
`grade` INT,
`TutorCouncil` INT,
`room` VARCHAR(255),
`date` DATE,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
FOREIGN KEY (`TutorCouncil`) REFERENCES university.tutor (`id`)
);

CREATE TABLE IF NOT EXISTS university.credit (
`id` INT PRIMARY KEY,
`status` VARCHAR(255),
`TutorCouncil` INT,
`room` VARCHAR(255),
`date` DATE,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
FOREIGN KEY (`TutorCouncil`) REFERENCES university.tutor (`id`)
);

CREATE TABLE IF NOT EXISTS university.gradeList (
`id` INT PRIMARY KEY,
`subjectName` VARCHAR(255),
`exams` INT,
`credits` INT,
FOREIGN KEY (`exams`) REFERENCES university.exam (`id`),
FOREIGN KEY (`credits`) REFERENCES university.credit (`id`)
);

CREATE TABLE IF NOT EXISTS university.schedule (
`id` INT PRIMARY KEY,
`room_id` INT,
`classTime` VARCHAR(255),
`daysOfWeek` VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS university.academicRecords (
`id` INT PRIMARY KEY,
`currentGrades` INT,
`schedule` INT,
FOREIGN KEY (`currentGrades`) REFERENCES university.gradeList (`id`),
FOREIGN KEY (`schedule`) REFERENCES university.schedule (`id`)
);

CREATE TABLE IF NOT EXISTS university.student (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`email` VARCHAR(255),
`gender` CHAR(1),
`isActive` BOOLEAN,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
`AcademicAchievements` INT,
`previousGrades` INT,
FOREIGN KEY (`AcademicAchievements`) REFERENCES university.academicRecords (`id`),
FOREIGN KEY (`previousGrades`) REFERENCES university.schedule (`id`)
);

CREATE TABLE IF NOT EXISTS university.group (
`id` INT PRIMARY KEY,
`students` INT REFERENCES university.student (`id`),
`major` INT,
`academicYear` INT,
`isActive` BOOLEAN,
FOREIGN KEY (`major`) REFERENCES university.major (`id`)
);

CREATE TABLE IF NOT EXISTS university.course (
`id` INT PRIMARY KEY,
`name` VARCHAR(255),
`description` VARCHAR(255),
`startDate` DATETIME,
`finishDate` DATETIME,
`majors` INT,
FOREIGN KEY (`majors`) REFERENCES university.major (`id`)
);

CREATE TABLE IF NOT EXISTS university.dayTimetable (
`id` INT PRIMARY KEY,
`day` VARCHAR(255),
`startTime` VARCHAR(255),
`finishTime` VARCHAR(255),
`lectures` INT,
`labs` INT
);

CREATE TABLE IF NOT EXISTS university.lecture (
`id` INT PRIMARY KEY,
`topic` VARCHAR(255),
`group` INT,
`description` VARCHAR(255),
`lectureDate` DATETIME,
`room` INT,
FOREIGN KEY (`group`) REFERENCES university.group (`id`)
);

CREATE TABLE IF NOT EXISTS university.lab (
`id` INT PRIMARY KEY,
`course_id` INT,
`subgroups` INT,
`labName` VARCHAR(255),
`description` VARCHAR(255),
FOREIGN KEY (`course_id`) REFERENCES university.course (`id`)
);

CREATE TABLE IF NOT EXISTS university.feedback (
`id` INT PRIMARY KEY,
`score` INT,
`student_id` INT,
`tutor_id` INT,
`comment` VARCHAR(255),
`datePosted` DATETIME,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
FOREIGN KEY (`student_id`) REFERENCES university.student (`id`),
FOREIGN KEY (`tutor_id`) REFERENCES university.tutor (`id`)
);

CREATE TABLE IF NOT EXISTS university.homework (
`id` INT PRIMARY KEY,
`feedback` INT,
`assignmentDetail` VARCHAR(255),
`dueDate` DATETIME,
`assignedDate` DATETIME,
`isCompleted` BOOLEAN,
`lastModified` DATETIME,
`whoModified` VARCHAR(255),
FOREIGN KEY (`feedback`) REFERENCES university.feedback (`id`)
);

CREATE TABLE IF NOT EXISTS university.subgroup (
`id` INT PRIMARY KEY,
`practiceTutor_id` INT,
`room` INT,
`students_id` INT,
`homework` INT,
FOREIGN KEY (`practiceTutor_id`) REFERENCES university.tutor (`id`),
FOREIGN KEY (`homework`) REFERENCES university.homework (`id`),
FOREIGN KEY (`students_id`) REFERENCES university.student (`id`)
);

CREATE TABLE IF NOT EXISTS university.libraryResource (
`id` INT PRIMARY KEY,
`title` VARCHAR(255),
`author` VARCHAR(255),
`ISBN` VARCHAR(255),
`availableCopies` INT
);

CREATE TABLE IF NOT EXISTS university.library (
`id` INT PRIMARY KEY,
`resource_id` INT,
`student_id` INT,
`issueDate` DATETIME,
`dueDate` DATETIME,
FOREIGN KEY (`resource_id`) REFERENCES university.libraryResource (`id`),
FOREIGN KEY (`student_id`) REFERENCES university.student (`id`)
);