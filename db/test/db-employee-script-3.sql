DROP DATABASE IF EXISTS `employee_test`;

CREATE DATABASE `employee_test` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employee_test` ;
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


USE `employee_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employees_view` AS select `e`.`emp_id` AS `ID`,concat(`e`.`last_name`,', ',`e`.`first_name`) AS `Employee Name`,`employee_test`.`departments`.`dept_name` AS `Department Name`,`employee_test`.`roles`.`role_title` AS `Role Title`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Employee Salary`,date_format(cast(`e`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified by` from (((`employee_test`.`employees` `e` join `employee_test`.`departments` on((`e`.`dept_id` = `employee_test`.`departments`.`dept_id`))) join `employee_test`.`roles` on((`e`.`role_id` = `employee_test`.`roles`.`role_id`))) join `employee_test`.`users` on((`e`.`user_id` = `employee_test`.`users`.`user_id`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employees_view1` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`employee_test`.`departments`.`dept_name` AS `dept_name`,`employee_test`.`roles`.`role_title` AS `role_title`,`employee_test`.`roles`.`role_salary` AS `role_salary`,date_format(cast(`e`.`date_created` as date),'%Y-%b-%d') AS `date_created`,date_format(cast(`e`.`date_modified` as date),'%Y-%b-%d') AS `date_modified`,`employee_test`.`users`.`user_name` AS `user_name` from (((`employee_test`.`employees` `e` join `employee_test`.`departments` on((`e`.`dept_id` = `employee_test`.`departments`.`dept_id`))) join `employee_test`.`roles` on((`e`.`role_id` = `employee_test`.`roles`.`role_id`))) join `employee_test`.`users` on((`e`.`user_id` = `employee_test`.`users`.`user_id`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`departments_view` AS select `employee_test`.`departments`.`dept_id` AS `ID`,`employee_test`.`departments`.`dept_name` AS `Department Name`,date_format(cast(`employee_test`.`departments`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from (`employee_test`.`departments` join `employee_test`.`users` on((`employee_test`.`departments`.`user_id` = `employee_test`.`users`.`user_id`))) order by `employee_test`.`departments`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`deptsalaryinsights_view` AS select `employee_test`.`employees_view1`.`dept_name` AS `dept_name`,concat('$',format(sum(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept total Salary`,concat('$',format(avg(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Avg Salary`,concat('$',format(max(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Max Salary`,concat('$',format(min(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Min Salary` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`empcountbydept_view` AS select `employee_test`.`employees_view1`.`dept_name` AS `dept_name`,count(0) AS `Total Employees` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`dept_name` order by count(0);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`empcountbyrole_view` AS select `employee_test`.`employees_view1`.`role_title` AS `Role Name`,count(0) AS `Total Employees` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`role_title` order by count(0);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employeelistbyrole_view` AS select `employee_test`.`employees_view`.`Role Title` AS `Role Title`,`employee_test`.`employees_view`.`Employee Name` AS `Employee Name` from `employee_test`.`employees_view` order by `employee_test`.`employees_view`.`Role Title`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employesslistbymanager_view` AS select concat(`v2`.`last_name`,', ',`v2`.`first_name`) AS `Manager Name`,concat(`v1`.`last_name`,', ',`v1`.`first_name`) AS `Employee Name` from (`employee_test`.`employees` `v1` join `employee_test`.`employees` `v2` on((`v1`.`emp_id` = `v2`.`manager_id`))) order by `v2`.`last_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`emplyeeslistbydept_view` AS select `employee_test`.`employees_view`.`Department Name` AS `Department Name`,`employee_test`.`employees_view`.`Employee Name` AS `Employee Name` from `employee_test`.`employees_view` order by `employee_test`.`employees_view`.`Department Name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`roles_view` AS select `employee_test`.`roles`.`role_id` AS `ID`,`employee_test`.`roles`.`role_title` AS `Role Title`,`employee_test`.`departments`.`dept_name` AS `Department Name`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Role Salary`,date_format(cast(`employee_test`.`roles`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from ((`employee_test`.`roles` join `employee_test`.`users` on((`employee_test`.`roles`.`user_id` = `employee_test`.`users`.`user_id`))) join `employee_test`.`departments` on((`employee_test`.`roles`.`dept_id` = `employee_test`.`departments`.`dept_id`))) order by `employee_test`.`departments`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`unfulfilledroles_view` AS select `employee_test`.`roles`.`role_id` AS `ID`,`employee_test`.`roles`.`role_title` AS `Role Title`,`employee_test`.`departments`.`dept_name` AS `Department Name`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Role Salary`,date_format(cast(`employee_test`.`roles`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from ((`employee_test`.`roles` join `employee_test`.`users` on((`employee_test`.`roles`.`user_id` = `employee_test`.`users`.`user_id`))) join `employee_test`.`departments` on((`employee_test`.`roles`.`dept_id` = `employee_test`.`departments`.`dept_id`))) where trim(`employee_test`.`roles`.`role_title`) in (select trim(`employee_test`.`employees_view`.`Role Title`) from `employee_test`.`employees_view`) is false order by `employee_test`.`roles`.`role_title`;
