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