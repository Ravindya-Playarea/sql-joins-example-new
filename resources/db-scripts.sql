CREATE TABLE student(
                        id VARCHAR(10) PRIMARY KEY,
                        name VARCHAR(100) NOT NULL
);

CREATE TABLE enrolment(
                          student_id VARCHAR(10) NOT NULL,
                          batch_id VARCHAR(10) NOT NULL ,
                          CONSTRAINT pk_enrolment PRIMARY KEY (student_id,batch_id),
                          CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student (id),
                          CONSTRAINT fk_batch FOREIGN KEY (batch_id) REFERENCES batch (id)
);

CREATE TABLE batch(
                      id VARCHAR(10) PRIMARY KEY ,
                      batch_number VARCHAR(10),
                      program_id VARCHAR(10)NOT NULL
);

CREATE TABLE module(
                       id VARCHAR(10) PRIMARY KEY,
                       name VARCHAR(100) NOT NULL,
                       credits INT NOT NULL,
                       program_id VARCHAR(10),
                       FOREIGN KEY (program_id) REFERENCES Program(program_id)

);

CREATE TABLE program
(
    program_id   VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE program_module(
                               program_id VARCHAR(10) NOT NULL,
                               module_id VARCHAR(10) NOT NULL ,
                               CONSTRAINT pk_program_module PRIMARY KEY (program_id, module_id),
                               CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES program (program_id),
                               CONSTRAINT fk_module FOREIGN KEY (module_id) REFERENCES module (id)
);
CREATE TABLE exam(
                     exam_code VARCHAR(10) PRIMARY KEY ,
                     passing_score INT NOT NULL ,
                     module_id VARCHAR(10) NOT NULL ,
                     CONSTRAINT fk_exam FOREIGN KEY (module_id) REFERENCES module(id)
);

INSERT INTO program (program_id, name) VALUES
('P001', 'DEP'),
            ('P002', 'CMJD'),
            ('P003', 'GDSE');

INSERT INTO enrolment (student_id, batch_id) VALUES ('S001', 'B001');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S002', 'B002');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S003', 'B003');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S004', 'B004');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S005', 'B005');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S006', 'B004');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S007', 'B005');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S008', 'B005');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S009', 'B002');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S010', 'B004');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S001', 'B003');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S002', 'B004');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S003', 'B005');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S004', 'B001');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S005', 'B001');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S006', 'B002');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S007', 'B003');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S008', 'B004');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S009', 'B005');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S010', 'B002');

CREATE TABLE student_exam(
                             student_id VARCHAR(10) NOT NULL,
                             batch_id VARCHAR(10) NOT NULL ,
                             exam_code VARCHAR(10) NOT NULL,
                             marks INT NOT NULL ,
                             CONSTRAINT pk_student_exam PRIMARY KEY (student_id, exam_code),
                             CONSTRAINT fk_enrolment FOREIGN KEY (student_id, batch_id) REFERENCES enrolment (student_id, batch_id)
);

INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S001', 'B001', 'EX-001', 85);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S002', 'B002', 'EX-002', 78);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S003', 'B003', 'EX-003', 90);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S004', 'B004', 'EX-004', 87);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S005', 'B005', 'EX-005', 92);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S006', 'B002', 'EX-006', 74);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S007', 'B003', 'EX-007', 81);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S008', 'B004', 'EX-008', 88);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S009', 'B005', 'EX-009', 93);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S010', 'B002', 'EX-010', 76);

INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S001', 'B001', 'EX-002', 79);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S002', 'B002', 'EX-003', 82);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S003', 'B003', 'EX-004', 89);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S004', 'B004', 'EX-005', 95);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S005', 'B005', 'EX-006', 77);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S006', 'B004', 'EX-007', 84);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S007', 'B003', 'EX-008', 91);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S008', 'B005', 'EX-009', 86);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S009', 'B002', 'EX-010', 94);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S010', 'B004', 'EX-001', 75);

INSERT INTO module (id, name, credits, program_id) VALUES
                                                       ('M001', 'java', '70','P001'),
                                                       ('M002', 'sql', '89','P002'),
                                                       ('M003', 'c#', '45','P003'),
                                                       ('M004', '.Net', '78','P001'),
                                                       ('M005', 'Mongodb', '90','P001'),
                                                       ('M006', 'git', '89','P002'),
                                                       ('M007', 'postgre sql', '90','P002'),
                                                       ('M008', 'postman', '56','P003'),
                                                       ('M009', 'docker', '89','P002'),
                                                       ('M010', 'firebase', '78','P001');






INSERT INTO batch(id,batch_number,program_id)VALUES
                                              ('B001','1','DEP'),
                                              ('B002','2','DEP'),
                                              ('B003','102','CMJD'),
                                              ('B004','97','GDSE'),
                                              ('B005','103','CMJD');


INSERT INTO program_module(program_id, module_id) VALUES
                                                      ('P002', 'M001'),
                                                      ('P002', 'M002'),
                                                      ('P002', 'M003'),
                                                      ('P002', 'M004'),
                                                      ('P002', 'M005'),
                                                      ('P002', 'M006'),
                                                      ('P002', 'M007'),
                                                      ('P002', 'M008'),
                                                      ('P002', 'M009'),
                                                      ('P002', 'M010'),
                                                      ('P001', 'M001'),
                                                      ('P001', 'M002'),
                                                      ('P001', 'M003'),
                                                      ('P001', 'M004'),
                                                      ('P001', 'M005'),
                                                      ('P001', 'M006'),
                                                      ('P001', 'M007'),
                                                      ('P001', 'M008'),
                                                      ('P001', 'M009'),
                                                      ('P001', 'M010'),
                                                      ('P003', 'M001'),
                                                      ('P003', 'M002'),
                                                      ('P003', 'M003'),
                                                      ('P003', 'M004'),
                                                      ('P003', 'M005'),
                                                      ('P003', 'M006'),
                                                      ('P003', 'M007'),
                                                      ('P003', 'M008'),
                                                      ('P003', 'M009'),
                                                      ('P003', 'M010');


INSERT INTO exam(exam_code, passing_score,module_id) VALUES
                                                         ('EX-001',75,'M001'),
                                                         ('EX-002',75,'M002'),
                                                         ('EX-003',75,'M003'),
                                                         ('EX-004',75,'M004'),
                                                         ('EX-005',75,'M005'),
                                                         ('EX-006',75,'M006'),
                                                         ('EX-007',75,'M007'),
                                                         ('EX-008',75,'M008'),
                                                         ('EX-009',75,'M009'),
                                                         ('EX-010',75,'M010');

INSERT INTO student (id, name) VALUES
                                   ('S001','Buddika'),
                                   ('S002','Shanuka'),
                                   ('S003','Tharindu'),
                                   ('S004','Ruvindaya'),
                                   ('S005','Kasun'),
                                   ('S006','Asiri'),
                                   ('S007','Waruna'),
                                   ('S008','Hiron'),
                                   ('S009','Imantha'),
                                   ('S010','Ruwan');
