create database QuanLySinhVien;
use QuanLySinhVien;
create table Class( 
	ClassId int not null auto_increment primary key,
    ClassName varchar(20) not null,
    StartDate datetime not null,
    status bit
);
create table Student(
	StudentId int not null auto_increment primary key,
    StudentName varchar(20) not null,
    Address varchar(20),
    Phone varchar(10),
    Status bit,
    ClassId int not null,
    foreign key (ClassId) references Class (ClassId)
);
create table Subject(
	SubId int not null auto_increment primary key,
    SubName varchar(20),
    Credit  tinyint   not null  default 1 check ( Credit >= 1 ),
    Status  bit                 default 1
);
create table Mark(
	MarkId    int not null auto_increment primary key,
    SubId     int not null,
    StudentId int not null,
    Mark      float   default 0 check ( Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (SubId, StudentId),
    foreign key (SubId) references Subject (SubId),
    foreign key (StudentId) references Student (StudentId)
);



