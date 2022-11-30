create database iron;
use iron;

create table brannch(
	branch_name varchar(20),
    branch_city varchar(10),
    assets real,
    primary key(branch_name)
    );
    
create table bankccustomer(
	customer_name varchar(15),
    customer_street varchar(15),
    customer_city varchar(15),
    primary key(customer_name)
);

create table depositoor(
	customer_name varchar(15),
    account_number int,
    primary key(customer_name, account_number),
    foreign key(customer_name) references bankccustomer(customer_name)
);


create table bankaaccount(
	account_number int,
    branch_name varchar(20),
    balance real,
    primary key(account_number),
    foreign key(account_number) references depositoor(account_number),
    foreign key(branch_name) references brannch(branch_name)
);

create table looan(
	loan_number int,
    branch_name varchar(20),
    amount real,
    primary key(loan_number),
    foreign key(branch_name) references brannch(branch_name)
);

create table borrower(
	customer_name varchar(15),
    loan_number int,
    primary key(customer_name, loan_number),
    foreign key(customer_name) references bankccustomer(customer_name),
    foreign key(loan_number) references looan(loan_number)
    );
    

insert into brannch values('SBI_chamraj', 'Bangalore', 50000);
insert into brannch values('SBI_chamrajpet', 'Bangalore', 50000);
insert into brannch values('SBI_residencyroad', 'Bangalore', 10000);
insert into brannch values('SBI_shivajiroad', 'Bombay', 20000);
insert into brannch values('SBI_jantarmantar', 'Delhi', 10000);
insert into brannch values('SBI_parliment', 'Bangalore', 20000);
select * from brannch;

insert into bankccustomer values('Avinash', 'bull temle', 'Bangalore');
insert into bankccustomer values('Dinesh', 'Bannergatta', 'Bangalore');
insert into bankccustomer values('Mohan', 'Akbar', 'Delhi');
insert into bankccustomer values('Nikil', 'NationalCollege', 'Bangalore');
insert into bankccustomer values('Rvi', 'Prithviraj', 'Delhi');
insert into bankccustomer values('Prithvi', 'Raj road', 'Mumbai');
select * from bankccustomer;

insert into depositoor values('Avinash', 1);
insert into depositoor values('Dinesh', 2);
insert into depositoor values('Mohan', 3);
insert into depositoor values('Nikil', 4);
insert into depositoor values('Rvi', 5);
insert into depositoor values('Prithvi', 6);
select * from depositoor;

insert into bankaaccount values(1, 'SBI_chamraj', 1000);
insert into bankaaccount values(2, 'SBI_chamrajpet', 2000);
insert into bankaaccount values(3, 'SBI_residencyroad', 3000);
insert into bankaaccount values(4, 'SBI_shivajiroad', 4000);
insert into bankaaccount values(5, 'SBI_jantarmantar', 5000);
insert into bankaaccount values(6, 'SBI_parliment', 6000);
select * from bankaaccount;

insert into looan values(1, 'SBI_chamraj', 1000);
insert into looan values(2, 'SBI_chamrajpet', 2000);
insert into looan values(3, 'SBI_residencyroad', 3000);
insert into looan values(4, 'SBI_shivajiroad', 4000);
insert into looan values(5, 'SBI_jantarmantar', 5000);
insert into looan values(6, 'SBI_parliment', 6000);
select * from looan;

select branch_name, assets/100000 as assets_in_lakhs from  brannch; 
select d.customer_name from bankaaccount ba join depositoor d 
on ba.account_number = d.account_number 
where ba.branch_name='SBI_chamraj'
group by d.customer_name having count(*)>1;

create view sumloan as select sum(amount), branch_name from looan group by branch_name;
select * from sumloan;