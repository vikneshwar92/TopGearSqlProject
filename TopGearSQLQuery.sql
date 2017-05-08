Create table Shipper(ShipperID int not null identity(1001,1) constraint pk_Shipper primary key,
                     ShipperName Varchar(20),Country varchar(20))

select * from Shipper

Create table Orders(OrderID int not null identity(2001,1) Constraint pk_oders primary key,
                    CustomerID int not null Constraint fk_Customer foreign key references Customer(CustomerID),
					EmpID int not null Constraint fk_emp foreign key references Employee(EmpID),
					OrderDate Date not null,
					ShipperID int not null Constraint fk_Shipper foreign key references Shipper(ShipperID))

Select * from Orders

Create table Employee(EmpID int not null identity(3001,1) constraint pk_emp primary key,
                      EmpName varchar(20))

Select * from Employee

Create table Customer(CustomerID int not null identity(4001,1) Constraint pk_customer primary key,
                      CustomerName varchar(20),Country varchar(20))

Select * from Customer

Select * from INFORMATION_SCHEMA.TABLES

insert into Employee values('Vijay'),('Sachin'),('Sathish')
insert into Customer values ('vijay','India'),('sachin','India'),('sathish','India')

alter table Employee add age int ,Emp_Status varchar(10),LastAccessed date
alter table Employee add Salary int 

update Employee set age=24,Emp_Status='Active',LastAccessed=GETDATE() where EmpID=3001
update Employee set age=60,Emp_status='Active',LastAccessed=GETDATE() where EmpID=3002
update Employee set age=61,Emp_status='Active',LastAccessed='2017-02-07' where EmpID=3003
update Employee set Salary=30000 where EmpID=3001
update Employee set Salary=60000 where EmpID=3002
update Employee set Salary=62000 where EmpID=3003

Select Salary from Employee where Salary > (Select min(salary) from Employee where Salary 
                                         > (Select min(salary) from Employee where salary
                                         > (select min(salary) from Employee))) order by Salary desc

select * from Customer
Select * from Employee
Select * from Shipper
Select * from Orders

insert into Customer values ('Pranob','America')
insert into Shipper values('Smith','Australia'),('Mike','America'),('Naveen Kumar','India')
insert into Orders values (4001,3001,GETDATE(),1003),(4002,3002,'2017-05-01',1003),(4004,3006,GETDATE(),1002)
insert into Orders values (4004,3006,'2017-05-02',1002)

--Select Query Basics
Select * from Employee
select EmpID,EmpName,Emp_Status from Employee where EmpName like 'S%'
select * from Employee where EmpName like '%n'
Select * from Employee where EmpID=3001
Select * from Employee where Salary > 25000
select * from INFORMATION_SCHEMA.TABLES

--Select Query using GROUP BY clause
Select S.ShipperName, COUNT(O.OrderID) as Number_of_orders from Orders as O join Shipper as S 
on s.ShipperID=O.ShipperID group by s.ShipperName 

--Select Query using HAVING clause
Select S.ShipperName, COUNT(O.OrderID) as Number_of_orders from Orders as O join Shipper as S 
on s.ShipperID=O.ShipperID group by s.ShipperName having ShipperName='Mike'

--Using a sub-query inside a select query
select * from Employee where Salary > (Select AVG(Salary) from Employee)

--select query using self join
Select a.EmpID,b.EmpName,a.Salary from Employee as a,Employee as b where a.Salary < b.Salary

--Select query using left outer join
Select S.ShipperID,S.ShipperName,O.OrderID from Shipper as S left outer join Orders as O on S.ShipperID=O.ShipperID 

--Select query using inner join
Select S.ShipperID,S.ShipperName,O.OrderID from Shipper as S inner join Orders as O on S.ShipperID=O.ShipperID 

--Insert statement - insert values to sql table using insert script statement
insert into Employee values ('Sampath',24,'Active',GETDATE(),32000),
                            ('Suriya',23,'Active','2017-01-08',25000),
							('Pranob',40,'Active','2017-04-08',40000)
insert into Employee values ('Ashwin',34,'Active',GETDATE(),10000)

--Using Aggregate function in select query
Select COUNT(EmpID) as Number_of_Employees from Employee
Select AVG(Salary) as Avg_Salary from Employee
Select max(Salary) as max_salary from Employee
Select Min(Salary) as Min_salary from Employee

--Finding 3rd maximum salary from Employee table using select query
Select max(Salary) as '3rd_max_salary' From Employee where Salary 
                                              < (select max(salary) from Employee where Salary
                                              < (select max(salary) from Employee))

--Alter table basics - Alter a column datatype from varchar to nvarchar using alter statement
alter table Shipper alter column Country nvarchar(20)

--Update query basics - Update Employee table by setting Employee Status='inactive' for employees above age 60
update Employee set Emp_Status='inactive' where age >= 60

--Delete query basics - Delete from Employee table where Employee status='inactive' 
--and not accessed for last 90 days
Delete from Employee where Emp_Status='inactive' and
 LastAccessed <= (select DATEADD(day, -90, convert(date, GETDATE())))


