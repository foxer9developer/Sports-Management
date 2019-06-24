create database student2;
use student2;

create table Personal(Roll_No int NOT NULL PRIMARY KEY, Name varchar(20), Phone_no int);
insert into Personal values(01, "Haffu", 23657443);
insert into Personal values(02, "vikku", 54758550);
insert into Personal values(03, "dara", 25654466);
insert into Personal values(04, "ankit", 77335550);
insert into Personal values(05, "sectry", 45375820);

create table Course(Course_ID int NOT NULL PRIMARY KEY, Name varchar(20));
insert into Course values(100, "DBMS");
insert into Course values(106, "Computer Arch");
insert into Course values(102, "Algorithm");
insert into Course values(103, "Operating Systems");
insert into Course values(104, "Ethics");

create table CStud(Roll_No int, Course_ID int, FOREIGN KEY (Roll_No) REFERENCES Personal(Roll_No), FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID));
insert into CStud values(01, 103);
insert into CStud values(02, 100);
insert into CStud values(03, 104);
insert into CStud values(05, 102);
insert into CStud values(04, 106);

create table Fac(Faculty_Name varchar(20), Fac_ID int NOT NULL PRIMARY KEY, Salary int);
insert into Fac values("raju", 168, 20000);
insert into Fac values("fagu", 145, 25000);
insert into Fac values("ajay", 156, 30000);
insert into Fac values("samita", 123, 35000);
insert into Fac values("bandana", 134, 40000);

create table FCourse(Fac_ID int, FOREIGN KEY (Fac_ID) REFERENCES Fac(Fac_ID), course_ID int, FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID));
insert into FCourse values(168, 100);
insert into FCourse values(145, 103);
insert into FCourse values(156, 106);
insert into FCourse values(123, 102);
insert into FCourse values(134, 104);

select Name from Personal;

select Personal.Name from Personal inner join CStud on Personal.Roll_No=CStud.Roll_No inner join Course on CStud.Course_ID=Course.Course_ID where Course.Name='DBMS';

select Personal.Phone_no from Personal inner join CStud on Personal.Roll_No=CStud.Roll_No inner join Course on CStud.Course_ID=Course.Course_ID where Course.Course_ID=102; 

select * from CStud;

select * from Personal where name like "A%";

SELECT MAX(salary), MIN(salary) FROM Fac;

select Name from Personal ORDER BY name asc;

SELECT MAX(SALARY) FROM Fac WHERE SALARY < (SELECT MAX(SALARY) FROM Fac);
SELECT Faculty_Name, Salary FROM Fac ORDER BY `Fac`.`salary` asc LIMIT 1 , 1;
SELECT Faculty_Name, Salary FROM Fac ORDER BY `Fac`.`salary` desc LIMIT 1 , 1;

SELECT SUM(Salary) from Fac;

select max(Course_id) from Course;

select a.Course_ID, a.Fac_ID from FCourse a, Course b having a.Course_ID = a.Course_ID;

select count(s.Course_ID) from Course s where s.Course_ID =
(select Course_ID from FCourse where Fac_ID=(select Fac_ID from
Fac where Faculty_Name=(select Faculty_Name from Fac order by
Salary asc limit 1,1))) ;

ALTER TABLE Personal ADD City varchar(25);
select City from Personal;

select Name from Personal order by City asc; 

select distinct a.Name from Personal a,Course b group by b.Course_ID;

select Name from Personal a , Course b group by b.Roll_No having count(distinct b.Roll_No)>0;