-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/schema/JWPArWPkl0O6_810gYrFOQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Table structure for table `class`
CREATE TABLE `class` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `class_code` string(7)  NOT NULL ,
    `name` string(50)  NOT NULL ,
    `description` string(100)  NOT NULL ,
    `professor_id_FK` int(11)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `professor`
CREATE TABLE `professor` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `name` string(50)  NOT NULL ,
    `department` enum('science','humanities','music','journalism','history','medicine')  NOT NULL ,
    `tenure` tinyint(1)  NOT NULL ,
    `joining_date` date  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `student`
CREATE TABLE `student` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `name` string(50)  NOT NULL ,
    `date_of_birth` date  NOT NULL ,
    `registration_date` timestamp  NOT NULL DEFAULT current_timestamp,
    `status` enum('Enrolled','Leave','Graduate','Drop')  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

-- Table structure for table `student_class`
CREATE TABLE `student_class` (
    `id` int(11) AUTO_INCREMENT NOT NULL ,
    `student_id_FK` int(11)  NOT NULL ,
    `class_id_FK` int(11)  NOT NULL ,
    `professor_id_FK` int  NOT NULL ,
    `start_class` date  NOT NULL ,
    `end_date` date  NOT NULL ,
    `grade` tinyint(3)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `class` ADD CONSTRAINT `fk_class_professor_id_FK` FOREIGN KEY(`professor_id_FK`)
REFERENCES `professor` (`id`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_student_id_FK` FOREIGN KEY(`student_id_FK`)
REFERENCES `student` (`id`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_class_id_FK` FOREIGN KEY(`class_id_FK`)
REFERENCES `class` (`id`);

ALTER TABLE `student_class` ADD CONSTRAINT `fk_student_class_professor_id_FK` FOREIGN KEY(`professor_id_FK`)
REFERENCES `professor` (`id`);

