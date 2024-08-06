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