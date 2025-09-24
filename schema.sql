-- Drop and recreate database
DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE school_db;

-- =========================
-- Students table
-- =========================
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================
-- Courses table
-- =========================
CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    course_description TEXT,
    credits INT DEFAULT 3,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- =========================
-- Enrollments table (junction table for many-to-many)
-- =========================
CREATE TABLE IF NOT EXISTS enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    final_grade DECIMAL(3,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT unique_student_course UNIQUE (student_id, course_id)
) ENGINE=InnoDB;

-- =========================
-- Seed Students
-- =========================
INSERT INTO students (first_name, last_name, email, phone_number, date_of_birth) VALUES
('John', 'Doe', 'john.doe@example.com', '+254711111111', '2000-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '+254722222222', '1999-05-22'),
('Alice', 'Johnson', 'alice.johnson@example.com', '+254733333333', '2001-03-10'),
('Bob', 'Williams', 'bob.williams@example.com', '+254744444444', '1998-07-30'),
('Charlie', 'Brown', 'charlie.brown@example.com', '+254755555555', '2002-11-05'),
('Diana', 'Prince', 'diana.prince@example.com', '+254766666666', '2000-09-18'),
('Ethan', 'Hunt', 'ethan.hunt@example.com', '+254777777777', '1997-12-25'),
('Fiona', 'Clark', 'fiona.clark@example.com', '+254788888888', '2001-04-12'),
('George', 'Miller', 'george.miller@example.com', '+254799999999', '1999-08-02'),
('Hannah', 'Davis', 'hannah.davis@example.com', '+254700000000', '2000-06-14');

-- =========================
-- Seed Courses
-- =========================
INSERT INTO courses (code, course_name, start_date, end_date, course_description, credits) VALUES
('CS101', 'Intro to Computer Science', '2025-01-10', '2025-05-20', 'Basic concepts of CS', 4),
('MATH201', 'Calculus I', '2025-01-15', '2025-05-25', 'Differential and integral calculus', 3),
('PHY150', 'Physics Fundamentals', '2025-01-20', '2025-05-30', 'Introductory physics course', 4),
('ENG101', 'English Literature', '2025-01-12', '2025-05-22', 'Study of classic English literature', 2),
('HIS210', 'World History', '2025-01-18', '2025-05-28', 'Survey of world history topics', 3);

-- =========================
-- Seed Enrollments
-- =========================
INSERT INTO enrollments (student_id, course_id, enrollment_date, final_grade) VALUES
(1, 1, '2025-01-12', 3.50),
(2, 1, '2025-01-13', 3.80),
(3, 2, '2025-01-16', 3.20),
(4, 2, '2025-01-16', 2.90),
(5, 3, '2025-01-21', 3.75),
(6, 3, '2025-01-22', 3.60),
(7, 4, '2025-01-14', 3.95),
(8, 4, '2025-01-14', 3.10),
(9, 5, '2025-01-19', 2.80),
(10, 5, '2025-01-20', 3.40);
