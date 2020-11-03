/* UC 1: created a database named payroll_service*/
create database payroll_service;
use payroll_service;

/*UC 2: Adding a table named rmployee_payroll containing the details of the 
employees in the database payroll_service*/
create table employee_payroll
(
	id int not null identity(1,1) primary key,
	name varchar(150) not null,
	salary float not null,
	start date not null
);

/*UC 3: Adding data into the employee_payroll table*/
insert into employee_payroll (name, salary, start) values
	('Bill', 1000000.00, '2018-01-03'),
    ('Terisa', 2000000.00, '2019-11-13'),
    ('Charlie', 3000000.00, '2020-05-21');

--UC 4:Retrieving all the data from the payroll_service database
select * from employee_payroll;

--UC 5:Retieving specific data from the employee_payroll table
select salary from employee_payroll where name = 'Bill';
select * from employee_payroll where start between cast('2018-01-01' as date) and cast(GETDATE() as date);

--UC 6: Adding the gender column and then updating the gender column
alter table employee_payroll add gender char(1);
update employee_payroll set gender = 'F' where name = 'Terisa';
update employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
select * from employee_payroll;

--UC 7: Fiding sum and avg salaries and number of male and female employees
select sum(salary) as 'Total Salary' from employee_payroll;
select sum(salary) as 'Total Salary Female' from employee_payroll where gender = 'F' group by gender;
select sum(salary) as 'Total Salary Male' from employee_payroll where gender = 'M' group by gender;
select avg(salary) as 'Average Salary' from employee_payroll;
select avg(salary) as 'Average Salary Female' from employee_payroll where gender = 'F' group by gender;
select avg(salary) as 'Average Salary Male' from employee_payroll where gender = 'M' group by gender;
select max(salary) as 'Maximum Salary', count(salary) as 'Number of Females'from employee_payroll where gender = 'F' group by gender;
select max(salary) as 'Maximum Salary', count(salary) as 'Number of Males'from employee_payroll where gender = 'M' group by gender;

--UC 8: Extending the employee_payroll table to contain phone no, address and department as columns
alter table employee_payroll add mobileNo bigint, department varchar, officeAddress varchar(50) default 'Delhi';
select * from employee_payroll;

--UC 9: Extending the columns to have fields like basic pay, taxable pay, deductions, Income tax, Net Pay.....
alter table employee_payroll add taxable_pay float, income_tax float, deductions float, net_pay float;
select * from employee_payroll;

--UC 10: Making Terisa as a part of two departments
insert into employee_payroll(name,