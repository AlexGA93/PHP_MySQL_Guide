-- Database creation
CREATE DATABASE myFirstDatabase;

-- Display databases
SHOW DATABASES;

-- Access to our database
USE myFirstDatabase;

-- First Table Creation
CREATE TABLE Students (
    -- id
    id int,
    name varchar(255),
    second_name varchar(255),
    age int,

    -- defining id as primary key
    PRIMARY KEY (id)
);
-- rename table
-- RENAME TABLE Students TO HonorStudents

-- In this case we want to modify an existing table because we want that our table's id must be auto increment
ALTER TABLE Students MODIFY COLUMN id int AUTO_INCREMENT;
-- Or if we want to add a new column
ALTER TABLE Students ADD emal varchar(255); -- This is a intentioned error, we'll correct it later
ALTER TABLE Students ADD role varchar(255);
-- If we are entered a invalid column name and we want to correct it:
ALTER TABLE Students RENAME COLUMN emal TO email;

-- Insert element in our table
INSERT INTO Students (name, second_name, age) VALUES ('John', 'Doe', 29);
INSERT INTO Students (name, second_name, age, email) VALUES ('Jane', 'Doe', 19, 'janeDoe@mail.com');
INSERT INTO Students (name, second_name, age, email, role) VALUES ('Jane', 'Doe', 19, 'janeDoe@protonmail.com', 'student');

-- If we want to obtain the sql command that created a table:
-- SHOW CREATE TABLE Students;

-- List all the table's elements
SELECT * FROM Students;
-- Or we can list our table's element with a condition
SELECT * FROM Students WHERE id = 1;
SELECT * FROM Students WHERE email IS NOT NULL;
SELECT * FROM Students WHERE email IS NULL;
SELECT * FROM Students WHERE age < 25;
SELECT * FROM Students WHERE age>25 AND email='nicoOrtega@mail.com';
SELECT * FROM Students WHERE age>25 OR email='nicoOrtega@mail.com';
SELECT * FROM Students WHERE email!='nicoOrtega@mail.com';
SELECT * FROM Students WHERE age BETWEEN 20 AND 30;
-- search for a user's email that contains a substring
SELECT * FROM Students WHERE email LIKE '%protonmail%';
-- Order by
SELECT * FROM Students ORDER BY age ASC;
SELECT * FROM Students ORDER BY age DESC;
-- select max or min value
SELECT max(age) as max_age FROM Students;
SELECT min(age) as min_age FROM Students;
-- To limit the number of results in the display
SELECT * FROM Students limit 3;
-- Select columns that we only want to obtain
SELECT id, name as frist_name, age FROM Students;

-- Update table's content
UPDATE Students SET email='johnDoe@mail.com' WHERE name='John';
UPDATE Students SET role='student' WHERE second_name='Doe';

-- Delete table's content
DELETE FROM Students WHERE id=2;
-- Usualy when we use UPDATE or Delete queries, we must specify the id, or maybe the system will notify us with an error



-- RELATIONSHIPS
--  we need to create another table
CREATE TABLE Subjects (
    id int AUTO_INCREMENT, 
    subject_name varchar(255) not null, 
    qualification float not null, 
    primary key(id)
);

-- insert into Subjects(subject_name, qualification) values('Maths',7.8);
-- insert into Subjects(subject_name, qualification) values('English',8.9);
-- insert into Subjects(subject_name, qualification) values('P.E',9);
-- insert into Subjects(subject_name, qualification) values('Chemistry',4.9);
-- insert into Subjects(subject_name, qualification) values('History',2.9);

insert into Subjects (subject_name, qualification) values('Maths',7.8),('English',8.9),('P.E',9),('Chemistry',4.9),('History',2.9);

-- We want to modify our Student's table to link Subjects to every Student
ALTER TABLE Students ADD subjects int; -- we add a new column
ALTER TABLE Students ADD CONSTRAINT FK_student_subjects FOREIGN KEY(subjects) REFERENCES Subjects(id);

-- If we wanted to define this column as foreign key at the beginning, we could define or table like this:
/*
CREATE TABLE Students (
    id int,
    name varchar(255),
    second_name varchar(255),
    age int,
    subjects int NOT NULL,

    PRIMARY KEY (id),
    
    FOREIGN KEY(subjects) references Subjects(id)
);
*/