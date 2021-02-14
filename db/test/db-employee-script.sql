
CREATE DATABASE `employee` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `fk_USER_USER_nameu` (`user_name`),
  KEY `fk_USER_USER_idx` (`modified_by`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_USER_USER` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_title` varchar(45) NOT NULL,
  `role_salary` decimal(8,2) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '1',
  `dept_id` int NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `ROLE_TITLE_uidx` (`role_title`),
  KEY `fk_ROLE_USER_C_idx` (`created_by`) /*!80000 INVISIBLE */,
  KEY `fk_ROLE_USER_M_idx` (`user_id`),
  KEY `ROLE_USER_idx` (`role_id`) /*!80000 INVISIBLE */,
  KEY `ROLE_USER_titlex` (`role_title`) /*!80000 INVISIBLE */,
  KEY `fk_roles_departments1_idx` (`dept_id`),
  CONSTRAINT `fk_ROLE_USER_C` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_ROLE_USER_M` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_roles_departments` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE `departments` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int NOT NULL DEFAULT '1',
  `user_id` int DEFAULT '1',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `DEPT_NAME_uidx` (`dept_name`),
  KEY `fk_DEPARTMENT_USER_C_idx` (`created_by`),
  KEY `fk_DEPARTMENT_USER_M_idx` (`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_DEPARTMENT_USER_C` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_DEPARTMENT_USER_M` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dept_id` int NOT NULL,
  `created_by` int NOT NULL DEFAULT '1',
  `role_id` int NOT NULL,
  `manager_id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `EMPLOYEE_REC_uidx` (`first_name`,`last_name`,`dept_id`,`role_id`),
  KEY `fk_EMPLOYEE_DEPARTMENT_idx` (`dept_id`),
  KEY `fk_EMPLOYEE_USERS_C_idx` (`created_by`),
  KEY `fk_EMPLOYEE_ROLE_idx` (`role_id`),
  KEY `fk_EMPLOYEE_MANAGER_idx` (`manager_id`),
  KEY `fk_EMPLOYEE_USERS_M_idx` (`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_EMPLOYEE_DEPARTMENT` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`),
  CONSTRAINT `fk_EMPLOYEE_EMPLOYEE` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`emp_id`),
  CONSTRAINT `fk_EMPLOYEE_ROLE` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `fk_EMPLOYEE_USER_C` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_EMPLOYEE_USER_M` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

