-- MySQL Script generated by MySQL Workbench
-- Thu Feb 11 00:45:33 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema employee_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employee_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employee_test` DEFAULT CHARACTER SET utf8 ;
USE `employee_test` ;

-- -----------------------------------------------------
-- Table `employee_test`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_test`.`users` ;

CREATE TABLE IF NOT EXISTS `employee_test`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `date_created` TIMESTAMP NULL DEFAULT NULL,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_user_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_USER_USER`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_USER_USER_idx` ON `employee_test`.`users` (`user_user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `employee_test`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_test`.`departments` ;

CREATE TABLE IF NOT EXISTS `employee_test`.`departments` (
  `dept_id` INT NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(45) NOT NULL,
  `date_created` TIMESTAMP NULL DEFAULT NULL,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NOT NULL DEFAULT 1,
  `modified_by` INT NULL DEFAULT 1,
  PRIMARY KEY (`dept_id`),
  CONSTRAINT `fk_DEPARTMENT_USER_C`
    FOREIGN KEY (`created_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DEPARTMENT_USER_M`
    FOREIGN KEY (`modified_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- CREATE INDEX `fk_DEPARTMENT_USER1_idx` ON `employee_test`.`departments` (`created_by` ASC) VISIBLE;
-- CREATE INDEX `fk_DEPARTMENT_USER_M_idx` ON `employee_test`.`departments` (`modified_by` ASC) VISIBLE;
CREATE INDEX `fk_USER_DEPARTMENT_idx` ON `employee_test`.`departments` (`dept_name` ASC) VISIBLE;
CREATE INDEX `fk_DEPARTMENT_USER_M_idx` ON `employee_test`.`departments` (`modified_by` ASC) VISIBLE;




-- -----------------------------------------------------
-- Table `employee_test`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_test`.`roles` ;

CREATE TABLE IF NOT EXISTS `employee_test`.`roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_title` VARCHAR(45) NOT NULL,
  `role_salary` DECIMAL(8,2) NOT NULL,
  `date_created` TIMESTAMP NULL DEFAULT NULL,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`role_id`),
  CONSTRAINT `fk_ROLE_USER_C`
    FOREIGN KEY (`created_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ROLE_USER_M`
    FOREIGN KEY (`modified_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ROLE_USER1_idx` ON `employee_test`.`roles` (`created_by` ASC) VISIBLE;

CREATE INDEX `fk_ROLE_USER_M_idx` ON `employee_test`.`roles` (`modified_by` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `employee_test`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee_test`.`employees` ;

CREATE TABLE IF NOT EXISTS `employee_test`.`employees` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  `manager_id` INT,
  `date_created` TIMESTAMP NULL DEFAULT NULL,
  `date_modified` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
  `created_by` INT NOT NULL DEFAULT 1,
  `modified_by` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `fk_EMPLOYEE_DEPARTMENT`
    FOREIGN KEY (`dept_id`)
    REFERENCES `employee_test`.`departments` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_USER_C`
    FOREIGN KEY (`created_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_ROLE`
    FOREIGN KEY (`role_id`)
    REFERENCES `employee_test`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_EMPLOYEE`
    FOREIGN KEY (`manager_id`)
    REFERENCES `employee_test`.`employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_USER_M`
    FOREIGN KEY (`modified_by`)
    REFERENCES `employee_test`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_EMPLOYEE_DEPARTMENT1_idx` ON `employee_test`.`employees` (`dept_id` ASC) VISIBLE;

CREATE INDEX `fk_EMPLOYEE_USER1_idx` ON `employee_test`.`employees` (`created_by` ASC) VISIBLE;

CREATE INDEX `fk_EMPLOYEE_ROLE1_idx` ON `employee_test`.`employees` (`role_id` ASC) VISIBLE;

CREATE INDEX `fk_EMPLOYEE_EMPLOYEE2_idx` ON `employee_test`.`employees` (`manager_id` ASC) VISIBLE;

CREATE INDEX `fk_EMPLOYEE_USER_M_idx` ON `employee_test`.`employees` (`modified_by` ASC) VISIBLE;


ALTER TABLE employee_test.employees ADD UNIQUE `unique_index`(`first_name`, `last_name`, `dept_id`, `role_id`);
ALTER TABLE employee_test.roles ADD UNIQUE `unique_index`(`role_title`);
ALTER TABLE employee_test.departments ADD UNIQUE `unique_index`(`dept_name`);


USE `employee_test` ;

-- -----------------------------------------------------
-- Placeholder table for view `employee_test`.`employees`
-- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `employee_test`.`employees` (`first_name` INT, `last_name` INT, `dept_name` INT, `role_title` INT, `role_salary` INT, `date_created` INT, `date_modified` INT, `modified_by` INT);

-- -----------------------------------------------------
-- View `employee_test`.`employees`
-- -----------------------------------------------------
USE `employee_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`departments_view` AS select `employee_test`.`departments`.`dept_id` AS `ID`,`employee_test`.`departments`.`dept_name` AS `Department Name`,date_format(cast(`employee_test`.`departments`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from (`employee_test`.`departments` join `employee_test`.`users` on((`employee_test`.`departments`.`user_id` = `employee_test`.`users`.`user_id`))) order by `employee_test`.`departments`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`deptsalaryinsights_view` AS select `employee_test`.`employees_view1`.`dept_name` AS `dept_name`,concat('$',format(sum(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept total Salary`,concat('$',format(avg(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Avg Salary`,concat('$',format(max(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Max Salary`,concat('$',format(min(`employee_test`.`employees_view1`.`role_salary`),2)) AS `Dept Min Salary` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`empcountbydept_view` AS select `employee_test`.`employees_view1`.`dept_name` AS `dept_name`,count(0) AS `Total Employees` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`dept_name` order by count(0);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`empcountbyrole_view` AS select `employee_test`.`employees_view1`.`role_title` AS `Role Name`,count(0) AS `Total Employees` from `employee_test`.`employees_view1` group by `employee_test`.`employees_view1`.`role_title` order by count(0);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employeelistbyrole_view` AS select `employee_test`.`employees_view`.`Role Title` AS `Role Title`,`employee_test`.`employees_view`.`Employee Name` AS `Employee Name` from `employee_test`.`employees_view` order by `employee_test`.`employees_view`.`Role Title`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employees_view` AS select `e`.`emp_id` AS `ID`,concat(`e`.`last_name`,', ',`e`.`first_name`) AS `Employee Name`,`employee_test`.`departments`.`dept_name` AS `Department Name`,`employee_test`.`roles`.`role_title` AS `Role Title`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Employee Salary`,date_format(cast(`e`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified by` from (((`employee_test`.`employees` `e` join `employee_test`.`departments` on((`e`.`dept_id` = `employee_test`.`departments`.`dept_id`))) join `employee_test`.`roles` on((`e`.`role_id` = `employee_test`.`roles`.`role_id`))) join `employee_test`.`users` on((`e`.`user_id` = `employee_test`.`users`.`user_id`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employees_view1` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`employee_test`.`departments`.`dept_name` AS `dept_name`,`employee_test`.`roles`.`role_title` AS `role_title`,`employee_test`.`roles`.`role_salary` AS `role_salary`,date_format(cast(`e`.`date_created` as date),'%Y-%b-%d') AS `date_created`,date_format(cast(`e`.`date_modified` as date),'%Y-%b-%d') AS `date_modified`,`employee_test`.`users`.`user_name` AS `user_name` from (((`employee_test`.`employees` `e` join `employee_test`.`departments` on((`e`.`dept_id` = `employee_test`.`departments`.`dept_id`))) join `employee_test`.`roles` on((`e`.`role_id` = `employee_test`.`roles`.`role_id`))) join `employee_test`.`users` on((`e`.`user_id` = `employee_test`.`users`.`user_id`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`employesslistbymanager_view` AS select concat(`v2`.`last_name`,', ',`v2`.`first_name`) AS `Manager Name`,concat(`v1`.`last_name`,', ',`v1`.`first_name`) AS `Employee Name` from (`employee_test`.`employees` `v1` join `employee_test`.`employees` `v2` on((`v1`.`emp_id` = `v2`.`manager_id`))) order by `v2`.`last_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`emplyeeslistbydept_view` AS select `employee_test`.`employees_view`.`Department Name` AS `Department Name`,`employee_test`.`employees_view`.`Employee Name` AS `Employee Name` from `employee_test`.`employees_view` order by `employee_test`.`employees_view`.`Department Name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`roles_view` AS select `employee_test`.`roles`.`role_id` AS `ID`,`employee_test`.`roles`.`role_title` AS `Role Title`,`employee_test`.`departments`.`dept_name` AS `Department Name`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Role Salary`,date_format(cast(`employee_test`.`roles`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from ((`employee_test`.`roles` join `employee_test`.`users` on((`employee_test`.`roles`.`user_id` = `employee_test`.`users`.`user_id`))) join `employee_test`.`departments` on((`employee_test`.`roles`.`dept_id` = `employee_test`.`departments`.`dept_id`))) order by `employee_test`.`departments`.`dept_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_test`.`unfulfilledroles_view` AS select `employee_test`.`roles`.`role_id` AS `ID`,`employee_test`.`roles`.`role_title` AS `Role Title`,`employee_test`.`departments`.`dept_name` AS `Department Name`,concat('$',format(`employee_test`.`roles`.`role_salary`,2)) AS `Role Salary`,date_format(cast(`employee_test`.`roles`.`date_modified` as date),'%Y-%b-%d') AS `Date Modified`,`employee_test`.`users`.`user_name` AS `Modified By` from ((`employee_test`.`roles` join `employee_test`.`users` on((`employee_test`.`roles`.`user_id` = `employee_test`.`users`.`user_id`))) join `employee_test`.`departments` on((`employee_test`.`roles`.`dept_id` = `employee_test`.`departments`.`dept_id`))) where trim(`employee_test`.`roles`.`role_title`) in (select trim(`employee_test`.`employees_view`.`Role Title`) from `employee_test`.`employees_view`) is false order by `employee_test`.`roles`.`role_title`;

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `employee_test`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `employee_test`;
INSERT INTO `employee_test`.`users` (`user_name`, `user_user_id`) VALUES ('ALI_ALAOUI', DEFAULT);

-- show indexes FROM employees;
-- show indexes FROM roles;
-- show indexes FROM departments;

COMMIT;


