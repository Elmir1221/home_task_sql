use CourseDatabase

create table Teachers(
[Id] int primary key identity(1,1),
[name] nvarchar (100),
[Surname] nvarchar (100),
[Email] nvarchar (100) unique,
[Age] int
)

create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar (100),
[Adress] nvarchar (100),
[Age] int
)


insert into Teachers([Name],[Surname],[Email],[Age])
Values('Resad', 'Agayev','Rasdd@gmail.com',21),
      ('Sahil',' Hajiyev','Sahil@gmail.com',19),
      ('Behruz',' Eliyev','Behruz@gmail.edu.az',37),
      ('Ilgar' , 'Shriyev','Ilgar@gmail.ru',26),
	  ('Hajixan', 'Hajixanov','Resad@gmail.com',19)

insert into Students([FullName],[Adress],[age])
Values('Resad Agayev','Neftciler',21),
      ('Sahil Hajiyev','Yasamal',19),
      ('Behruz Eliyev','Yasamal',37),
      ('Ilgar Shriyev','kurdexani',26),
	  ('Hajixan Hajixanov','Zaqatala',19)

select * from Teachers
select * from Students

select Count(*) as 'student count' from Students

select [Name],[Surname] from  Teachers where Age >20

select * from Teachers where [Email] like '%c%'

select  SUBSTRING ([Email],1,CHARINDEX('@', [Email])-1) from Teachers
select  SUBSTRING ([Email],CHARINDEX('@', [Email])+1, LEN([Email])) from Teachers

select * from Students

delete from Students

truncate table  Students

Alter table Students

add SoftDelete bit default 0;

select * from Students where [SoftDeleted] = 'true'

select * from Students where [SoftDeleted] = 'true'

update students
set [SoftDeleted] = 1 
where [Id]>2

create table Countries(
[Id] int primary key identity(1,1),
[name] nvarchar (50)
)

create table Cities(
[Id] int primary key identity(1,1),
[name] nvarchar (50)
[CountryId] int,
foreign key ([CountryId]) references Countries(Id)
)
select * from Cities

insert into Countries ([Name])
Values('Azebaijan'),
      ('Turkiye'),
      ('Ingland'),
      ('Japan')
	
select * from Countries

insert into Cities([Name],[CountryId])
Values('Baku',1),
      ('Ankara',2),
      ('London',3),
      ('Pekin',4),
	  ('Ganja',1)

select * from Cities

Select *  from Cities where [CountryID] = 1

create table Books(
[Id] int primary key identity(1,1),
[name] nvarchar (50)
)
create table Autors(
[Id] int primary key identity(1,1),
[name] nvarchar (50)
[email] nvarchar(100)
)

create table BookAutors(
[Id] int primary key identity(1,1),
[BookId] int, 
[AutorsId] int,
foreign key ([BookId]) references Books(Id),
foreign key ([AutorsId]) references Autors(Id)
)

select * from Books
select * from Autors
select * from BookAutors

insert into Books ([Name])
Values('ali ve nino'),
      ('7 gozel'),
      ('isgendername')


insert into Autors ([Name],[email])
Values('Autor1','Autor@gmail.com'),
      ('Autor2','Autor@gmail.com'),
      ('Autor3','Autor@gmail.com')

insert into BookAutors ([BookId],[AutorsId])
Values(1,1),
      (1,2),
      (2,1)



select * from Cities
select * from Countries

select Cities.name as 'City', ctr.name 'Country' from Cities ct 
join Countries ctr
on ct.CountryId = ctr.Id 