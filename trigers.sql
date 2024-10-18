CREATE TABLE IF NOT EXISTS university.student_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
action VARCHAR(255),
timestamp DATETIME,
FOREIGN KEY (student_id) REFERENCES university.student(id) ON DELETE CASCADE
);

CREATE OR REPLACE TRIGGER AfterStudentStatusChange
    AFTER UPDATE ON university.student
    FOR EACH ROW
BEGIN
    -- Check if the isActive status has changed
    IF OLD.isActive != NEW.isActive THEN
        -- Log the change in a separate log table (optional)
        INSERT INTO university.student_log (student_id, action, timestamp)
        VALUES (NEW.id,
                CASE
                    WHEN NEW.isActive = 1 THEN 'ACTIVATED'
                    ELSE 'DEACTIVATED'
                    END,
                NOW());
    END IF;
END;

