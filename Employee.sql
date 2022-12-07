create database employee;
use employee;
create table dept(
	deptNo int,
	dName varchar(20),
	dLoc varchar(10),
	primary key (deptNo)
);
select * from dept;

create table project(
	pNo int,
	pLoc varchar(20),
	pName varchar(20),
	primary key (pNo)
);
select * from project;

create table employee(
	empNo int,
	eName varchar(20),
	mgrNo int,
	hireDate date,
	sal int,
	deptNo int,
	primary key (empNo),
	foreign key (deptNo) references dept (deptNo)
);
select * from employee;

create table incentives(
	empNo int,
	incentiveDate date,
	incentiveAmount int,
	primary key (empNo, incentiveDate),
	foreign key (empNo) references employee(empNo)
);
select * from incentives;

create table assignedTo(
	empNo int,
	pNo int,
	jobRole varchar(20),
	primary key(empNo,pNo),
	foreign key(empNo) references employee(empNo),
	foreign key(pNo) references project(pNo)
);
select * from assignedTo;

insert into dept values(1,'Management','Bangalore');
insert into dept values(2,'Marketing','Vizag');
insert into dept values(3,'Web Development','Mysore');
insert into dept values(4,'web Design','Chennai');
insert into dept values(5,'Coding','Delhi');

insert into project values(1,'Bangalore', 'proman');
insert into project values(2,'Vizag', 'promart');
insert into project values(3,'Mysore', 'prosite');
insert into project values(4,'Chennai', 'prodesign');
insert into project values(5,'Delhi', 'code.io');

insert into employee values(101,'Avinash',2310,'2021-10-09',56000,1);
insert into employee values(102,'Dinesh',3210,'2021-06-06',76000,1);
insert into employee values(103,'Mridul',1230,'2021-12-05',12000,2);
insert into employee values(104,'Manish',6530,'2021-08-10',54000,2);
insert into employee values(105,'Karthik',1430,'2021-09-20',65000,3);
insert into employee values(106,'Kirthan',2300,'2021-11-21',98000,4);

insert into incentives values(101,'2021-10-09',6000);
insert into incentives values(102,'2021-06-06',6000);
insert into incentives values(103,'2021-12-05',2000);
insert into incentives values(104,'2021-08-10',4000);
insert into incentives values(105,'2021-09-20',5000);

insert into assignedTo values(101, 1, 'Management');
insert into assignedTo values(102, 2, 'Marketing');
insert into assignedTo values(103, 3, 'Web development');
insert into assignedTo values(104, 4, 'Web design');
insert into assignedTo values(105, 5, 'Coding');

select a.empNo from assignedTo a, project p
where a.pNo = p.pNo and p.pLoc in ('Hyderabad','Mysore','Bangalore');

select e.empNo from employee e
where e.empNo not in (select empNo from incentives);

select e.eName, e.empNo, d.dName, a.jobRole, d.dLoc, p.pLoc from dept d, employee e, assignedTo a, project p
where e.empNo = a.empNo and a.pNo = p.pNo and e.deptNo = d.deptNo and d.dLoc = p.pLoc;