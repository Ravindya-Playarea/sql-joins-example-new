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
                       FOREIGN KEY (program_id) REFERENCES Program(id)

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
                               CONSTRAINT fk_program FOREIGN KEY (program_id) REFERENCES program (id),
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
INSERT INTO enrolment (student_id, batch_id) VALUES ('S006', 'B006');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S007', 'B007');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S008', 'B008');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S009', 'B009');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S010', 'B010');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S011', 'B011');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S012', 'B012');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S013', 'B013');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S014', 'B014');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S015', 'B015');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S016', 'B016');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S017', 'B017');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S018', 'B018');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S019', 'B019');
INSERT INTO enrolment (student_id, batch_id) VALUES ('S020', 'B020');

CREATE TABLE student_exam(
                             student_id VARCHAR(10) NOT NULL,
                             batch_id VARCHAR(10) NOT NULL ,
                             exam_code VARCHAR(10) NOT NULL CONSTRAINT fk_exam REFERENCES exam(code),
                             marks INT NOT NULL ,
                             CONSTRAINT pk_student_exam PRIMARY KEY (student, exam_code),
                             CONSTRAINT fk_enrolment FOREIGN KEY (student_id, btach_id) REFERENCES enrolment (student_id, batch_number) ,
);

INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S001', 'B001', 'EX-001', 85);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S002', 'B002', 'EX-002', 78);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S003', 'B003', 'EX-003', 90);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S004', 'B004', 'EX-004', 87);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S005', 'B005', 'EX-005', 92);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S006', 'B006', 'EX-006', 74);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S007', 'B007', 'EX-007', 81);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S008', 'B008', 'EX-008', 88);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S009', 'B009', 'EX-009', 93);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S010', 'B010', 'EX-010', 76);

INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S001', 'B001', 'EX-002', 79);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S002', 'B002', 'EX-003', 82);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S003', 'B003', 'EX-004', 89);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S004', 'B004', 'EX-005', 95);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S005', 'B005', 'EX-006', 77);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S006', 'B006', 'EX-007', 84);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S007', 'B007', 'EX-008', 91);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S008', 'B008', 'EX-009', 86);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S009', 'B009', 'EX-010', 94);
INSERT INTO student_exam (student_id, batch_id, exam_code, marks) VALUES ('S010', 'B010', 'EX-001', 75);

INSERT INTO module (id, name, credits, program_id) VALUES
                                                       ('M001', 'java', '70','DEP'),
                                                       ('M002', 'sql', '89','CMJD'),
                                                       ('M003', 'c#', '45','GDSE'),
                                                       ('M004', '.Net', '78','DEP'),
                                                       ('M005', 'Mongodb', '90','DEP'),
                                                       ('M006', 'git', '89','CMJD'),
                                                       ('M007', 'postgre sql', '90','CMJD'),
                                                       ('M008', 'postman', '56','GDSE'),
                                                       ('M009', 'docker', '89','GDSE'),
                                                       ('M010', 'firebase', '78','DEP');






INSERT INTO batch(batch_id,batch_number,program_id)VALUES
                                              ('B001','1','DEP'),
                                              ('B002','2','DEP'),
                                              ('B003','102','CMJD'),
                                              ('B004','97','GDSE'),
                                              ('B005','103','CMJD');