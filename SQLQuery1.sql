------- Greate DB -------
create database TransportFirm;
use TransportFirm;

----- Greate Tables -------
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
	[Date] datetime not null,
	id_Cargo int not null,
	id_Transporter int not null,
	id_Flight int not null,
	id_Client int not null,
	id_Manager int not null,
	foreign key (id_Client) references Client(id),
	foreign key (id_Manager) references Manager(id),
	foreign key (id_Flight) references Flight(id),
	foreign key (id_Transporter) references Transporter(id),
	foreign key (id_Cargo) references Cargo(id)
);

------ Changed -------
drop table Calculation;

drop table Client;

drop table Flight;

drop table Cargo;

alter table Flight
	add FinalPath varchar(50) not null;

alter table Flight
	add TimeOfTransfer datetime not null;

alter table Flight
	drop column TimeToGo;

alter table Cargo
	add [Type] varchar(25) not null;

alter table Client
	alter column NumberPhone varchar(15) not null;

alter table Cargo
	add Freight decimal not null;

----- Insert to table--------
insert into Client(FirstName, LastName, NumberPhone)values
	('Petro', 'Poroh','387412359145'),
	('Oleg', 'Liaho','387414566145'),
	('Yulia', 'Timoha','387416666145');

insert into Manager(FirstName, LastName, Position)values
	('Jecka', 'Semenov', 'Senior Manager'),
	('Stepan', 'Tuskli', 'Junior manager'),
	('Tania', 'Prusikina', 'Middle Manager');

insert into Transporter(FirstName, LastName)values
	('Jason', 'Statem'),
	('Alex', 'Besheni');

insert into Flight values
	(1, 'Paragvai', GETDATE()),
	(6, 'Spanish', GETDATE()),
	(5, 'Italy', GETDATE());

insert into Cargo values
	(56.1, 250, 'Glass'),
	(100.5, 750, 'Tree');

insert into Calculation values
	(GETDATE(),1,1,1,1,1),
	(GETDATE(),2,2,2,2,2);

select * from Client;
select * from Manager;
select * from Transporter;
select * from Flight;
select * from Cargo;

select Client.LastName as[Клиент] , Transporter.LastName as[Перевозчик], Cargo.[Type], Cargo.Freight, Manager.LastName as [Менеджер], Calculation.[Date] 
from Calculation, Client, Transporter, Cargo, Manager
where Calculation.id_Client = Client.id
and		Calculation.id_Transporter = Transporter.id
and		Calculation.id_Cargo = Cargo.id
and		Calculation.id_Manager = Manager.id; 


