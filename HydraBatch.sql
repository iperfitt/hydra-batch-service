/*******************************************************************************
   101 Database - Version 1.0
   Script: HydraBatch.sql
   Description: Creates and populates the HydraBatch database.
   DB Server: Oracle
   Author: Bobby McGetrick
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP USER HydraBatch CASCADE;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE USER HydraBatch
IDENTIFIED BY p4ssw0rd
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 10M ON users;

GRANT connect to HydraBatch;
GRANT resource to HydraBatch;
GRANT create session TO HydraBatch;
GRANT create table TO HydraBatch;
GRANT create view TO HydraBatch;
GRANT create job TO HydraBatch;



conn HydraBatch/p4ssw0rd


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE batch
(
    resource_id NUMBER,
    training_name VARCHAR2(200),
    trainer_id NUMBER,
    cotrainer_id NUMBER,
    skill_type VARCHAR2(200),
    training_type VARCHAR2(200),
    start_date TIMESTAMP NULL,
    end_date TIMESTAMP NULL,
    location VARCHAR2(200),
    curriculum VARCHAR2(200),
    batch_id NUMBER PRIMARY KEY
);

/*******************************************************************************
   Create Junction Tables
********************************************************************************/

/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
/**
* batch_trainee
**/
ALTER TABLE batch_trainee ADD CONSTRAINT batch_id_fk
    FOREIGN KEY (batch_id) REFERENCES batch (batch_id) ON DELETE CASCADE;

/*******************************************************************************
   Create Sequences
********************************************************************************/
CREATE SEQUENCE batch_id_seq;

/*******************************************************************************
   Create Triggers
********************************************************************************/

/*******************************************************************************
   Create Stored Procedures
********************************************************************************/

/*******************************************************************************
   Create Functions
********************************************************************************/

/*******************************************************************************
   Create Jobs
********************************************************************************/

/*******************************************************************************
   Initialize Tables
********************************************************************************/

/*******************************************************************************
   Commit changes and exit
*******************************************************************************/
COMMIT;
EXIT;