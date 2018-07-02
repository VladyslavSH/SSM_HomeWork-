create database TransportFirm;
use TransportFirm;

create table Client(
id int primary key identity,
FirstName varchar(25) not null,
LastName varchar(25) not null,
NumberPhone int not null
);

create table Flight(
id int primary key identity,
numberFlight int not null
);

create table Manager(
id int primary key identity,
FirstName varchar(25) not null,
LastName varchar(25) not null,
Position varchar(25) not null
);

create table Cargo(
id int primary key identity,
Mass decimal not null
);

create table Transporter(
id int primary key identity,
FirstName varchar(25) not null,
LastName varchar(25) not null
);

create table Calculation(
id int primary key identity,
[Sum] decimal not null,
[Date] datetime not null,
id_Cargo int not null,
id_Transporter int not null,
id_Flight int not null,
foreign key (id_Flight) references Flight(id),
foreign key (id_Transporter) references Transporter(id),
foreign key (id_Cargo) references Cargo(id)
);

drop table Calculation;
select * from Calculation;