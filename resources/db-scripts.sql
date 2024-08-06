CREATE TABLE student(
                        id VARCHAR(10) PRIMARY KEY,
                        name VARCHAR(100) NOT NULL
);

CREATE TABLE enrolment(
                          student_id VARCHAR(10) NOT NULL,
                          batch_number VARCHAR(10) NOT NULL ,
                          CONSTRAINT pk_enrolment PRIMARY KEY (student_id,batch_number),
                          CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES student (id),
                          CONSTRAINT fk_batch FOREIGN KEY (batch_number) REFERENCES batch (batch_number)
);

CREATE TABLE batch(
                      batch_number VARCHAR(10)PRIMARY KEY,
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

INSERT INTO program
('P001', 'DEP'),
            ('P002', 'CMJD'),
            ('P003', 'GDSE');

INSERT INTO enrolment (student_id, batch_number) VALUES ('S001', 'B001');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S002', 'B002');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S003', 'B003');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S004', 'B004');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S005', 'B005');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S006', 'B006');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S007', 'B007');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S008', 'B008');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S009', 'B009');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S010', 'B010');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S011', 'B011');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S012', 'B012');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S013', 'B013');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S014', 'B014');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S015', 'B015');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S016', 'B016');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S017', 'B017');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S018', 'B018');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S019', 'B019');
INSERT INTO enrolment (student_id, batch_number) VALUES ('S020', 'B020');

CREATE TABLE student_exam(
                             student_id VARCHAR(10) NOT NULL,
                             batch_id VARCHAR(10) NOT NULL ,
                             exam_code VARCHAR(10) NOT NULL CONSTRAINT fk_exam REFERENCES exam(code),
                             marks INT NOT NULL ,
                             CONSTRAINT pk_student_exam PRIMARY KEY (student, exam_code),
                             CONSTRAINT fk_enrolment FOREIGN KEY (student_id, btach_id) REFERENCES enrolment (student_id, batch_number) ,
);

INSERT INTO program_module(program_id, module_id) VALUES
                                                      ('CMJD', 'M001'),
                                                      ('CMJD', 'M002'),
                                                      ('CMJD', 'M003'),
                                                      ('CMJD', 'M004'),
                                                      ('CMJD', 'M005'),
                                                      ('CMJD', 'M006'),
                                                      ('CMJD', 'M007'),
                                                      ('CMJD', 'M008'),
                                                      ('CMJD', 'M009'),
                                                      ('CMJD', 'M010'),
                                                      ('DEP', 'M001'),
                                                      ('DEP', 'M002'),
                                                      ('DEP', 'M003'),
                                                      ('DEP', 'M004'),
                                                      ('DEP', 'M005'),
                                                      ('DEP', 'M006'),
                                                      ('DEP', 'M007'),
                                                      ('DEP', 'M008'),
                                                      ('DEP', 'M009'),
                                                      ('DEP', 'M010'),
                                                      ('GDSE', 'M001'),
                                                      ('GDSE', 'M002'),
                                                      ('GDSE', 'M003'),
                                                      ('GDSE', 'M004'),
                                                      ('GDSE', 'M005'),
                                                      ('GDSE', 'M006'),
                                                      ('GDSE', 'M007'),
                                                      ('GDSE', 'M008'),
                                                      ('GDSE', 'M009'),
                                                      ('GDSE', 'M010');
