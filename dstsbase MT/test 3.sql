test 1 

select sum (int_quantity * int_price) as totalcost from tbi_stock;

 totalcost
-----------
   63865.5
(1 row)

test 2

select sum (int_quantity) as totalcost from tbi_stock;

test=# select sum (int_quantity) as totalcost from tbi_stock;
 totalcost
-----------
        77
(1 row)


test 3

select upper(vchr_name) from tbi_stock;


   upper
-----------
 MOUSE
 KEYBOARD
 MODEM
 HEADPHONE
 MEMORY
(5 rows)

select round (int_price) from tbi_stock;


 round
-------
   502
   452
  1202
   752
  3502
(5 rows)

test 4


select count (vchr_name) from tbi_stock;

 count
-------
     5
(1 row)


test 5

select max (int_price) from tbi_stock;

  max
--------
 3501.5
(1 row)

test 6

insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (1,40);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (2,15);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (3,10);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (4,12);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (5,60);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (6,14);
insert into tbl_enrollment ( pk_int_enrollment_id, int_count) values (7,200);


select sum (int_count) from tbl_enrollment;

 sum
-----
 351
(1 row)

test 7

insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (1,'CS100',1);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (2,'CS101',1);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (3,'CS102',1);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (4,'CS103',1);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (5,'CS200',2);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (6,'CS300',3);
insert into tbl_classes (pk_int_class_id,vchr_class_name,fk_int_dept_id) values (7,'CS400',4);


test 8

select count (pk_int_class_id) from tbl_classes;

 count
-------
     7
(1 row)


delete from tbi_stock where pk_int_stock_id = 4;


test 8

 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4
(5 rows)


test 9

select concat (vchr_name,int_price) from tbi_stock;


     concat
----------------
 mouse501.5
 keyboard451.5
 modem1201.5
 headphone751.5
 memory3501.5
(5 rows)

test 10

create table tbl_student(
   enrl_no varchar(10),
   roll_no serial primary key,
   s_name varchar(25),
   city varchar(25),
   mobile varchar(25),
   dob date
);

create table tbl_grade(
   roll_no int,
   foreign key (roll_no) references tbl_student(roll_no)on delete cascade on update cascade,
   course varchar(25),
   grade varchar(10)
);

insert into tbl_student (enrl_no,roll_no,s_name,city,mobile,dob) values (11,2,'akhil','delhi',98756579,'12/01/1986');
insert into tbl_student (enrl_no,roll_no,s_name,city,mobile,dob) values (6,4,'maya','bangalore',98734534,'12-11-1987');
insert into tbl_student (enrl_no,roll_no,s_name,city,mobile,dob) values (1,8,'anoop','bangalore',93456535,'22-12-1990');
insert into tbl_student (enrl_no,roll_no,s_name,city,mobile,dob) values (20,1,'paul','cochin',96754555,'13-03-1991');
insert into tbl_student (enrl_no,roll_no,s_name,city,mobile,dob) values (3,5,'asndeep','delhi',84865644,'14-06-1993');

insert into tbl_grade (roll_no,course,grade) values (2,'c','A');
insert into tbl_grade (roll_no,course,grade) values (2,'java','B');
insert into tbl_grade (roll_no,course,grade) values (1,'c','B');
insert into tbl_grade (roll_no,course,grade) values (1,'java','A');
insert into tbl_grade (roll_no,course,grade) values (4,'php','A');
insert into tbl_grade (roll_no,course,grade) values (4,'java','A');
insert into tbl_grade (roll_no,course,grade) values (4,'c','B');
insert into tbl_grade (roll_no,course,grade) values (8,'java','B');
insert into tbl_grade (roll_no,course,grade) values (5,'php','A');
insert into tbl_grade (roll_no,course,grade) values (5,'java','D');


select s_name,course from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no where grade = 'A';

 s_name  | course
---------+--------
 akhil   | c
 maya    | java
 maya    | php
 paul    | java
 asndeep | php
(5 rows)

test 11

select s_name, enrl_no from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no where grade = 'B';

 s_name | enrl_no
--------+---------
 akhil  | 11
 maya   | 6
 anoop  | 1
 paul   | 20
(4 rows)

 enrl_no
---------
 11
 6
 6
 20
 3
(5 rows)


test 12

select s_name,enrl_no from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no where course = 'c';

 s_name | enrl_no
--------+---------
 akhil  | 11
 maya   | 6
 paul   | 20

test 13


select * from tbl_student where city ='bangalore' and roll_no in (select roll_no from tbl_grade where course = 'java');

 enrl_no | roll_no | s_name |   city    |  mobile  |    dob
---------+---------+--------+-----------+----------+------------
 6       |       4 | maya   | bangalore | 98734534 | 1987-11-12
 1       |       8 | anoop  | bangalore | 93456535 | 1990-12-22
(2 rows)

test 14


select s_name,course from tbl_student inner join tbl_grade on tbl_student.roll_no = tbl_grade.roll_no where s_name like 'a%';

 s_name  | course
---------+--------
 akhil   | java
 anoop   | java
 asndeep | php
 asndeep | java
 akhil   | c
(5 rows)

test 15

select s_name, to_char("dob",'DD/MM/YYYY') from tbl_student;

 s_name  |  to_char
---------+------------
 akhil   | 12/01/1986
 maya    | 12/11/1987
 anoop   | 22/12/1990
 paul    | 13/03/1991
 asndeep | 14/06/1993


test 16

select s_name, to_char("dob",'DD-Mon-YYYY') from tbl_student;


 s_name  |   to_char
---------+-------------
 akhil   | 12-Jan-1986
 maya    | 12-Nov-1987
 anoop   | 22-Dec-1990
 paul    | 13-Mar-1991
 asndeep | 14-Jun-1993