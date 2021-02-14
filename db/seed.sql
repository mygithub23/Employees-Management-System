

-- INSERT INTO users(user_name) VALUES ('Ali_Alaoui');
-- commit;
-- select * from users;

/*Data for the table roles */
USE `employee` ;
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Public Accountant',11,4200.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Accounting Manager',11,8200.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Administration Assistant',1,3000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('President',9,20000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Administration Vice President',9,15000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Accountant',11,4200.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Finance Manager',10,8200.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Human Resources Representative',4,4000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Programmer',6,4000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Marketing Manager',2,9000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Marketing Representative',2,4000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Public Relations Representative',2,4500.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Purchasing Clerk',8,2500.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Purchasing Manager',8,8000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Sales Manager',8,10000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Sales Representative',8,6000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Shipping Clerk',5,2500.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Stock Clerk',3,2000.00);
INSERT INTO roles(role_title,dept_id,role_salary) VALUES ('Stock Manager',3,5500.00);



/*Data for the table departments */

INSERT INTO departments(dept_name) VALUES ('Administration');
INSERT INTO departments(dept_name) VALUES ('Marketing');
INSERT INTO departments(dept_name) VALUES ('Purchasing');
INSERT INTO departments(dept_name) VALUES ('Human Resources');
INSERT INTO departments(dept_name) VALUES ('Shipping');
INSERT INTO departments(dept_name) VALUES ('IT');
INSERT INTO departments(dept_name) VALUES ('Public Relations');
INSERT INTO departments(dept_name) VALUES ('Sales');
INSERT INTO departments(dept_name) VALUES ('Executive');
INSERT INTO departments(dept_name) VALUES ('Finance');
INSERT INTO departments(dept_name) VALUES ('Accounting');



/*Data for the table employees */

INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('ALI','ALAOUI',4,5,1); 
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Neena','Kochhar',6,6,1); 
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Lex','De Haan',8,2,3);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Alexander','Hunold',8,7,3);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Bruce','Ernst',5,10,10);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('David','Austin',5,11,10);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Valli','Pataballa',5,10,10);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Diana','Lorentz',10,3,5);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Nancy','Greenberg',10,11,10);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Daniel','Favie',15,3,2);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('John','Chen',16,3,4);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Ismael','Sciarra',8,2,6);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Jose Manuel','Urman',9,2,6);
INSERT INTO employees(first_name,last_name,role_id,dept_id,manager_id) VALUES ('Luis','Popp',13,2,9);
commit;
