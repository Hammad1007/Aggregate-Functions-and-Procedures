drop database Meow7
go
create database Meow7
go
use Meow7
go

-- create department id
create table dept (
did int primary key,
[dname] varchar(10)
);

-- insert into department
insert into [dept] values(1, 'CS')
insert into [dept] values(2, 'MGT')
insert into [dept] values(3, 'BIOTECH')
insert into [dept] values(4, 'CV')
insert into [dept] values(5, 'BOT')
insert into [dept] values(6, 'SS')

Select * from dept

-- create employee table
create table Emp (
id int primary key,
[name] varchar(100),
age int,
gender char check(gender IN('M', 'F')),
d_ID int,
foreign key(d_id) references dept(did)
);

-- insertions into employee table
insert into [emp] values(10, 'Hammad Rashid', 20, 'M', 1)
insert into [emp] values(20, 'Zarin Taufique', 21, 'F', 1)
insert into [emp] values(30, 'Zainab Dogar', 21, 'F', 4)
insert into [emp] values(40, 'Harris Rashid', 18, 'M', 3)
insert into [emp] values(50, 'Omer Rehman', 29, 'M', 2)
insert into [emp] values(60, 'Ammariya Rehman', 26, 'F', 3)
insert into [emp] values(70, 'Zuhaa Nazir', 18, 'F', 2)
insert into [emp] values(80, 'Zain Taufique', 28, 'M', 2)
insert into [emp] values(90, 'Fatima Bhutta', 20, 'F', 1)
insert into [emp] values(100, 'Salman Arshad', 22, 'M', 4)

-- Displaying the info on screen
Select * from Emp

-- Simple procedures without any parameters
Create Procedure spdept1emp
AS
BEGIN
	Select * from Emp e 
	where e.d_ID = 1
END

Create Procedure spdept2emp
AS
BEGIN
	Select * from Emp e 
	where e.d_ID = 2
END

Create Procedure spdept3emp
AS
BEGIN
	Select * from Emp e 
	where e.d_ID = 3
END

Create Procedure spdept4emp
AS
BEGIN
	Select * from Emp e 
	where e.d_ID = 4
END

Execute spdept1emp
Execute spdept2emp
Execute spdept3emp
Execute spdept4emp

-- procedures further with a paramter
-- this prcodeure takes gender as input and then prints all the employees of the gender chosen
Create Procedure spgenderemp
@gender char
AS
BEGIN
	Select * from Emp e
	where e.gender = @gender
END

-- Female and Male employees displayed on the screen
Execute spgenderemp 'F'
Execute spgenderemp 'M'

-- Create a procedure which return count of employees according to their gender
Create Procedure spcountofemployeesongender
@gender char,
@employee_count int OUTPUT
AS
BEGIN
	Select @employee_count = count(e.id) from Emp e
	where e.gender = @gender
END

-- Displaying the female employees in the company
DECLARE @Emp_Total_Female int
EXECUTE spcountofemployeesongender 'F', @Emp_Total_Female OUTPUT
PRINT('TOTAL COUNT OF FEMALE EMPLOYEES IS:')
PRINT @Emp_Total_Female

-- Displaying the male emloyees in the company
DECLARE @Emp_Total_Male int
EXECUTE spcountofemployeesongender 'M', @Emp_Total_Male OUTPUT
PRINT('TOTAL COUNT OF MALE EMPLOYEES IS:')
PRINT @Emp_Total_Male

-- CREATE PROCEDURE Procedure_Name
-- AS
-- BEGIN  working   END

-- To alter the procedure, replace create with alter
-- To delete the procedure, DELETE PROCEDURE Procedure_Name

-- PRINT statement to print details

-- All employees who have a as a second letter in their name
Select * from emp e
where e.name LIKE '_a%'

-- All employees in dept CS
Select * from emp e
where e.d_ID = 1;

-- All employees who are above 20
Select * from emp e
where e.age > 20
order by e.name

-- All the matching rows of both the tables are displayed
Select * from emp e join dept d on e.d_ID = d.did

-- Displays the total number of male and female employees
Select e.gender, count(*)
From Emp e Group by e.gender

-- Counts the number of employees in each department
Select e.d_ID, count(e.d_ID) AS [Students in Dept]
From emp e group by e.d_ID

-- Displays the total number of employees, max age, min age, average age
Select count(*) AS [Total Employees], max(e.age) AS [Max Age], min(e.age) AS [Min Age], avg(e.age) AS [Avg Age] From Emp e

--- All employees who have a as a second letter in their names and their dept id and dname
Select *  From Emp e JOIN dept d on e.d_ID = d.did where e.name LIKE('_a%') Order by e.d_ID asc

-- Displays dept having no employees
-- IS NULL WALI EXAMPLE
Select * 
From Emp e FULL OUTER JOIN Dept d on e.d_ID = d.did
WHERE e.d_ID IS NULL
order by e.d_ID desc

-- Procedure finds total employees in each dept
CREATE Procedure spstudsindept
AS
BEGIN
	Select d.did, d.dname, count(*) AS [Total Students in Dept]
	From Emp e JOIN Dept d on e.d_ID = d.did
	Group by  d.did, d.dname
END

-- Execute the procedure
EXECUTE spstudsindept

create table Student (
ID int primary key,
Name varchar(100),
Age int,
Gender char check(gender IN('M', 'F')),
D_ID int,
T_ID int,
Foreign key(D_ID) references dept(did),
Foreign key(T_ID) references emp(id)
);

-- insert into student table
insert into [Student] values(100, 'Hashim Khan', 10, 'M', 3, 40)
insert into [Student] values(200, 'Aliha Hussain', 12, 'F', 3, 60)
insert into [Student] values(300, 'Aslam Khan', 13, 'M', 1, 90)
insert into [Student] values(400, 'Shoaib Akhtar', 12, 'M', 4, 30)
insert into [Student] values(500, 'Sara Khan', 11, 'F', 1, 10)
insert into [Student] values(600, 'Insharah Nazir', 12, 'F', 1, 10)
insert into [Student] values(700, 'Ali Nazir', 10, 'M', 2, 50)
insert into [Student] values(800, 'Bobby Deol', 10, 'M', 4, 100)
insert into [Student] values(900, 'Arjit Singh', 14, 'M', 2, 80)
insert into [Student] values(1000, 'Anna Hathway', 9, 'F', 1, 20)
insert into [Student] values(1100, 'Rashmika Mandanna', 18, 'F', 1, 10)
insert into [Student] values(1200, 'Lana Del Rey', 19, 'F', 1, 20)
insert into [Student] values(1300, 'Hashim Ijaz', 16, 'M', 3, 40)
insert into [Student] values(1400, 'Sarim Baig', 13, 'M', 3, 60)
insert into [Student] values(1500, 'Hamna Khan', 13, 'F', 3, 40)

-- Display the student table info
Select * from Student

-- Display students with id less than 1000
Select * from Student s 
where s.ID < 1000

-- Dipslay students whose age is not 10
Select * from Student s
where s.Age != 10

-- Display students in department 1
Select * from Student s
where s.D_ID = 1
Order by gender 

-- Display all the detail of students along with their departments and teacher details
Select * from Student s JOIN Emp e on s.T_ID = e.id JOIN Dept d on e.d_ID = d.did

-- Display students being taught by either Hammad Rashid or Zarin Taufique
Select * from 
Student s JOIN Emp e on s.T_ID = e.id
where e.name IN('Hammad Rashid', 'Zarin Taufique')
Order by e.gender asc

-- Count the students and display them according to their genders
Select s.Gender, count(*) AS [Total Students]
From Student s 
Group by s.Gender

-- Displaying Age and count of students in that age bracket
Select s.Age, count(*) AS [Count of Students]
From Student s
Group by s.Age

-- Displaying age and count of students
Select e.age, count(*) AS [Count of Students]
From Emp e
Group by e.age

