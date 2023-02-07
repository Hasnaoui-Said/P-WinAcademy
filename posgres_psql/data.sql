
CREATE TABLE colleges(

	id SERIAL PRIMARY KEY,
	name VARCHAR(20)

);

CREATE TABLE departements(

	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	college_id INT REFERENCES colleges ON DELETE CASCADE

);

CREATE TABLE rooms(

	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	places INT,
	departement_id INT REFERENCES departements ON DELETE CASCADE

);

CREATE TABLE subjects(

	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	room_id INT REFERENCES rooms ON DELETE CASCADE

);

CREATE TABLE roles (

  id SERIAL PRIMARY KEY,
  name VARCHAR (20) UNIQUE

);

CREATE TABLE users(

	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	email VARCHAR(20),
	password VARCHAR(20),
    role_id INT REFERENCES roles ON DELETE CASCADE

);

CREATE TABLE admins(

	LIKE users INCLUDING INDEXES

) inherits (users);

CREATE TABLE teachers(

  LIKE users INCLUDING INDEXES,
	subject_id INT REFERENCES subjects ON DELETE CASCADE

)inherits(users);

CREATE TABLE students(

  LIKE users INCLUDING INDEXES, 
	cne VARCHAR(20)

)inherits(users);

CREATE TABLE classes(

	id SERIAL PRIMARY KEY,
	teacher_id INT REFERENCES teachers,
	student_id INT REFERENCES students

);

CREATE TABLE notes(

	id SERIAL PRIMARY KEY,
	student_id INT REFERENCES students,
	subject_id INT REFERENCES subjects,
  note INT

);

ALTER TABLE departements ADD COLUMN manager_id INT;
ALTER TABLE departements ADD FOREIGN KEY (manager_id) REFERENCES teachers(id);

-- INSRTING DATA INTO THE DATABASE

INSERT INTO colleges (name) VALUES ('Jawad Esskali');
INSERT INTO colleges (name) VALUES ('Ibne Zaydon');
INSERT INTO colleges (name) VALUES ('El Jahid');

INSERT INTO departements (name, college_id) VALUES ('A', 1);
INSERT INTO departements (name, college_id) VALUES ('B', 1);
INSERT INTO departements (name, college_id) VALUES ('C', 1);

INSERT INTO rooms (name, places, departement_id) VALUES ('R1', 20, 1);
INSERT INTO rooms (name, places, departement_id) VALUES ('R2', 20, 1);
INSERT INTO rooms (name, places, departement_id) VALUES ('R3', 20, 1);

INSERT INTO rooms (name, places, departement_id) VALUES ('R4', 20, 2);
INSERT INTO rooms (name, places, departement_id) VALUES ('R5', 20, 2);
INSERT INTO rooms (name, places, departement_id) VALUES ('R6', 20, 2);

INSERT INTO rooms (name, places, departement_id) VALUES ('R7', 20, 3);
INSERT INTO rooms (name, places, departement_id) VALUES ('R8', 20, 3);
INSERT INTO rooms (name, places, departement_id) VALUES ('R9', 20, 3);

INSERT INTO subjects (name, room_id) VALUES ('Math', 1);
INSERT INTO subjects (name, room_id) VALUES ('Physics', 2);
INSERT INTO subjects (name, room_id) VALUES ('Chimie', 3);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('teacher');
INSERT INTO roles (name) VALUES ('student');

INSERT INTO admins (name, email, password, role_id) VALUES ('Hassan', 'hassan@gmail.com', '123456', 1);

INSERT INTO teachers (name, email, password, role_id, subject_id) VALUES ('Teacher 1', 'teacher1@gmail.com', '123456', 2, 1);
INSERT INTO teachers (name, email, password, role_id, subject_id) VALUES ('Teacher 2', 'teacher2@gmail.com', '123456', 2, 2);
INSERT INTO teachers (name, email, password, role_id, subject_id) VALUES ('Teacher 3', 'teacher3@gmail.com', '123456', 2, 3);

INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 1', 'student1@gmail.com', '123456', 3, 'AZ2366');
INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 2', 'student2@gmail.com', '123456', 3, 'AZ9946');
INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 3', 'student3@gmail.com', '123456', 3, 'AZ1146');
INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 4', 'student4@gmail.com', '123456', 3, 'AZ6146');
INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 5', 'student5@gmail.com', '123456', 3, 'AZ1177');
INSERT INTO students (name, email, password, role_id, cne) VALUES ('Student 6', 'student6@gmail.com', '123456', 3, 'AZ1046');

UPDATE departements SET manager_id = 2 WHERE id = 1;
UPDATE departements SET manager_id = 3 WHERE id = 2;
UPDATE departements SET manager_id = 4 WHERE id = 3;

INSERT INTO classes (teacher_id, student_id) VALUES (2, 5);
INSERT INTO classes (teacher_id, student_id) VALUES (2, 6);
INSERT INTO classes (teacher_id, student_id) VALUES (2, 7);
INSERT INTO classes (teacher_id, student_id) VALUES (2, 8);
INSERT INTO classes (teacher_id, student_id) VALUES (2, 9);
INSERT INTO classes (teacher_id, student_id) VALUES (2, 10);

INSERT INTO classes (teacher_id, student_id) VALUES (3, 5);
INSERT INTO classes (teacher_id, student_id) VALUES (3, 6);
INSERT INTO classes (teacher_id, student_id) VALUES (3, 7);
INSERT INTO classes (teacher_id, student_id) VALUES (3, 8);
INSERT INTO classes (teacher_id, student_id) VALUES (3, 9);
INSERT INTO classes (teacher_id, student_id) VALUES (3, 10);

INSERT INTO classes (teacher_id, student_id) VALUES (4, 5);
INSERT INTO classes (teacher_id, student_id) VALUES (4, 6);
INSERT INTO classes (teacher_id, student_id) VALUES (4, 7);
INSERT INTO classes (teacher_id, student_id) VALUES (4, 8);
INSERT INTO classes (teacher_id, student_id) VALUES (4, 9);
INSERT INTO classes (teacher_id, student_id) VALUES (4, 10);

INSERT INTO notes (student_id, subject_id, note) VALUES (5, 1, 15);
INSERT INTO notes (student_id, subject_id, note) VALUES (5, 2, 13);
INSERT INTO notes (student_id, subject_id, note) VALUES (5, 3, 18);

INSERT INTO notes (student_id, subject_id, note) VALUES (6, 1, 12);
INSERT INTO notes (student_id, subject_id, note) VALUES (6, 2, 17);
INSERT INTO notes (student_id, subject_id, note) VALUES (6, 3, 13);

INSERT INTO notes (student_id, subject_id, note) VALUES (7, 1, 19);
INSERT INTO notes (student_id, subject_id, note) VALUES (7, 2, 14);
INSERT INTO notes (student_id, subject_id, note) VALUES (5, 3, 16);
