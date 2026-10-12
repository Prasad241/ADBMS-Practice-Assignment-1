/*1. Create a database named CompanyDB.*/
create database companyDB1;
use companyDB1;

/*2. Create a table Employees with the following columns:
Employees (EmpID (Integer, Primary Key), EmpName, Salary, JoinDate )*/
CREATE TABLE EMPLOYEES(
EMPID INT PRIMARY KEY, 
EMPNAME VARCHAR(20), 
SALARY INT, 
JOINDATE DATE);

DESC EMPLOYEES;

/*3. Create a table Departments with:
Departments (DeptID (Integer, Primary Key), DeptName)*/
CREATE TABLE DEPARTMENTS
(DEPTID INT PRIMARY KEY, DEPTNAME VARCHAR(20));

/*4. Add a column Email (VARCHAR(100)) to the Employees table*/
ALTER TABLE EMPLOYEES ADD COLUMN EMAIL VARCHAR (100);

/*5. Add a column dept_location to the Departments table.*/
ALTER TABLE DEPARTMENTS ADD COLUMN DEPT_LOCATION VARCHAR(50);

/*6. Add a NOT NULL Constraint to the Phone column*/
ALTER TABLE EMPLOYEES ADD PHONE INT NOT NULL; 

/*7. Change the size of the EmpName column from VARCHAR (50) to
VARCHAR (100).*/
ALTER TABLE EMPLOYEES MODIFY COLUMN EMPNAME VARCHAR (100);

/*8. Drop the primary key Constraint from Departments*/
ALTER TABLE EMPLOYEES DROP PRIMARY KEY;
DESC EMPLOYEES;

/*9. Create a foreign key constraint between two tables*/
ALTER TABLE EMPLOYEES ADD COLUMN DEPTID INT;
ALTER TABLE EMPLOYEES ADD FOREIGN KEY (DEPTID) REFERENCES DEPARTMENTS (DEPTID);

/*10.Rename the column EmpName to EmployeeName.*/
ALTER TABLE EMPLOYEES RENAME COLUMN EMPNAME TO EMPLOYEENAME;

/*11.Apply a CHECK constraint on the Age and Salary columns.*/
ALTER TABLE EMPLOYEES ADD AGE INT CHECK (AGE>18);
ALTER TABLE EMPLOYEES ADD CONSTRAINT CHK_SALARY CHECK (SALARY>50000);

/*12.Remove the Phone column from the Employees table*/
ALTER TABLE EMPLOYEES DROP COLUMN PHONE;

/*13. Rename the table Employees to EmployeeDetails.*/
RENAME TABLE EMPLOYEES TO EMPLOYEEDETAILS;

/*14. Drop the CHECK constraints.*/
ALTER TABLE EMPLOYEEDETAILS DROP CHECK EMPLOYEEDETAILS_CHK_1;
ALTER TABLE EMPLOYEEDETAILS DROP CHECK CHK_SALARY;
DESC EMPLOYEEDETAILS;
SHOW CREATE TABLE EMPLOYEEDETAILS; -- TO DISPLAY CONSTRAINTS 

/*15. Delete the Departments table permanently.*/
DROP TABLE EMPLOYEEDETAILS;
DROP TABLE DEPARTMENTS;

/*16. Drop Database*/
DROP DATABASE COMPANYDB1;
