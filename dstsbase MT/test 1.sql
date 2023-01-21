create table test 1;

create table tbi_stock(
    pk_int_stock_id serial primary key,
    vchr_name varchar(20),
    int_quantity int,
    int_price int
);

                                              Table "public.tbi_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbi_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | integer               |           |          |
Indexes:
    "tbi_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)



test 2


alter table tbi_stock alter Column int_price type float;

                                              Table "public.tbi_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbi_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
Indexes:
    "tbi_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)

test 3

create table tbl_supplier(
    pk_int_supplier_id serial primary key,
    vchr_supplier_name varchar(25)
);

                                                 Table "public.tbl_supplier"
       Column       |         Type          | Collation | Nullable |                         Default
--------------------+-----------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer               |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(25) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)


test 4


alter table tbi_stock add Column fk_int_supplier int;


                                              Table "public.tbi_stock"
     Column      |         Type          | Collation | Nullable |                      Default
-----------------+-----------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer               |           | not null | nextval('tbi_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(20) |           |          |
 int_quantity    | integer               |           |          |
 int_price       | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "tbi_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)

test 5

alter table tbi_stock add foreign key (fk_int_supplier) references tbl_supplier(pk_int_supplier_id)on delete cascade on update cascade;

Foreign-key constraints:
    "tbi_stock_fk_int_supplier_fkey" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id) ON UPDATE CASCADE ON DELETE CASCADE


test 6

create table tbl_dept(
    pk_int_dept_id serial primary key,
    vchr_dept_name varchar(25)
)

                                             Table "public.tbl_dept"
     Column     |         Type          | Collation | Nullable |                     Default
----------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name | character varying(25) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)

test 7 

create table tbl_classes(
    pk_int_class_id serial primary key,
    vchr_class_name varchar(20),
    fk_int_dept_id int,
    foreign key (fk_int_dept_id) references tbl_dept(pk_int_dept_id)on delete cascade on update cascade
);

                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE



test 8

create table tbl_enrollment(
    pk_int_enrollment_id serial primary key,
    int_count int,
    fk_int_class_id int,
    foreign key (fk_int_class_id) references tbl_classes(pk_int_class_id)on delete cascade on update cascade
);

                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


test 9

ALTER TABLE tbl_classes
ADD UNIQUE (vchr_class_name);

                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(20) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE


test 10

 alter table tbl_dept add column vchr_dept_description varchar(20);



                                                Table "public.tbl_dept"
        Column         |         Type          | Collation | Nullable |                     Default
-----------------------+-----------------------+-----------+----------+--------------------------------------------------
 pk_int_dept_id        | integer               |           | not null | nextval('tbl_dept_pk_int_dept_id_seq'::regclass)
 vchr_dept_name        | character varying(25) |           |          |
 vchr_dept_description | character varying(20) |           |          |
Indexes:


test 11

insert into  tbl_supplier (pk_int_supplier_id,vchr_supplier_name)  values (1,'amal');
insert into  tbl_supplier (pk_int_supplier_id,vchr_supplier_name)  values (2,'binshad');
insert into  tbl_supplier (pk_int_supplier_id,vchr_supplier_name)  values (3,'irshad');
insert into  tbl_supplier (pk_int_supplier_id,vchr_supplier_name)  values (4,'rohith');
insert into  tbl_supplier (pk_int_supplier_id,vchr_supplier_name)  values (5,'prashob');


 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | amal
                  2 | binshad
                  3 | irshad
                  4 | rohith
                  5 | prashob