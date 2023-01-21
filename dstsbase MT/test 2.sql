test 1

insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (1,'mouse',10,500,1);
insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (2,'keyboard',5,450,3);
insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (3,'modem',10,1200,2);
insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (4,'memory',100,1500,5);
insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (5,'headphone',50,750,4);
insert into tbi_stock(pk_int_stock_id,vchr_name,int_quantity,int_price,fk_int_supplier) values (6,'memory',2,3500,4);


test=# select * from tbi_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |       500 |               1
               2 | keyboard  |            5 |       450 |               3
               3 | modem     |           10 |      1200 |               2
               4 | memory    |          100 |      1500 |               5
               5 | headphone |           50 |       750 |               4
               6 | memory    |            2 |      3500 |               4

test 2

UPDATE tbi_stock SET int_price = 501.5 WHERE pk_int_stock_id = 1;
UPDATE tbi_stock SET int_price = 451.5 WHERE pk_int_stock_id = 2;
UPDATE tbi_stock SET int_price = 1201.5 WHERE pk_int_stock_id = 3;
UPDATE tbi_stock SET int_price = 1501.5 WHERE pk_int_stock_id = 4;
UPDATE tbi_stock SET int_price = 751.5 WHERE pk_int_stock_id = 5;
UPDATE tbi_stock SET int_price = 3501.5 WHERE pk_int_stock_id = 6; 


test=# select * from tbi_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4
(6 rows)


test 3 

select * from tbi_stock WHERE int_price >= 1000;

test=# select * from tbi_stock WHERE int_price >= 1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
               6 | memory    |            2 |    3501.5 |               4



test 4

select * from tbi_stock order by vchr_name asc;


test=# select * from tbi_stock order by vchr_name asc;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keyboard  |            5 |     451.5 |               3
               4 | memory    |          100 |    1501.5 |               5
               6 | memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2
               1 | mouse     |           10 |     501.5 |               1
(6 rows)


test 5

select * from tbi_stock order by vchr_name asc fetch first 3 rows only;


 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keyboard  |            5 |     451.5 |               3
               4 | memory    |          100 |    1501.5 |               5
(3 rows)


test 6


select * from tbi_stock order by vchr_name desc limit 3;


test=# select * from tbi_stock order by vchr_name desc limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
(3 rows)


test 7

select vchr_name, int_quantity*int_price as int_quantityint_price from tbi_stock;


 vchr_name | int_quantityint_price
-----------+-----------------------
 mouse     |                  5015
 keyboard  |                2257.5
 modem     |                 12015
 memory    |                150150
 headphone |                 37575
 memory    |                  7003
(6 rows)


test 8 


delete from tbi_stock where pk_int_stock_id = 4;


 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4
(5 rows)

test 9 

insert into tbl_dept(pk_int_dept_id,vchr_dept_name,vchr_dept_description) values (1,'computer science','cs');
insert into tbl_dept(pk_int_dept_id,vchr_dept_name,vchr_dept_description) values (2,'electronics','ec');
insert into tbl_dept(pk_int_dept_id,vchr_dept_name,vchr_dept_description) values (3,'commerce','cc');
insert into tbl_dept(pk_int_dept_id,vchr_dept_name,vchr_dept_description) values (4,'arts','ar');


est=# select * from tbl_dept;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | computer science | cs
              2 | electronics      | ec
              3 | commerce         | cc
              4 | arts             | ar
(4 rows)

select vchr_name, int_quantity*int_price as total_price from tbi_stock;
