/*BEGIN;

--or

START TRANSACION; -- To execute multiple statements as a single transaction, we must explicitly start the transaction.

COMMIT:- Saves all changes made during the transaction.
ROLLBACK:- Undoes all changes made during the transaction
SAVEPOINT:- Sets a savepoint within a transaction to roll back to later.
ROLLBACK TO SAVEPOINT:- Rolls back to a specific savepoint 
*/
CREATE DATABASE TCL;
USE TCL;

CREATE TABLE ORDERS(
ORDER_ID INT PRIMARY KEY,
CUSTOMER_NAME VARCHAR(100),
STATUS VARCHAR(50)
);

DESC ORDERS;
-- Start the transaction--

SET AUTOCOMMIT=0; /*in mysql auto commit mode is enabled by default which means whenever we execute
any sql statement is automatically commited*/
/*so in such cases succeded transactions are automatically commited.
to disable the auto commit mode we are using this also we can not disable the auto commit mode of
DDL commands.
In many DBMS it is disabled by default*/
-- Start transaction;

BEGIN;

INSERT INTO ORDERS VALUES(101, 'Geet', 'Pending');
INSERT INTO ORDERS VALUES(102, 'Bob', 'Pending');

truncate table orders;
SELECT * FROM ORDERS;
rollback;
commit;

-- for commit
INSERT INTO ORDERS VALUES (101,'Alice', 'Pending');
INSERT INTO ORDERS VALUES (102,'Bob', 'Pending');
select * from Orders;
commit;

Update orders set customer_name='Raj' where order_id=102;
rollback;

-- Step 1: Insert a few orders

INSERT INTO ORDERS VALUES (103, 'Om', 'Pending');
INSERT INTO ORDERS VALUES (104, 'Sahil', 'Pending');
DELETE FROM ORDERS WHERE ORDER_ID=103;
SAVEPOINT SP1;
SELECT * FROM ORDERS;

-- Step 2: Update one order
UPDATE ORDERS SET STATUS = 'Shipped' WHERE ORDER_ID = 103;
SAVEPOINT SP2;
ROLLBACK TO SAVEPOINT SP1;

-- Step 3: Delete another order
DELETE FROM ORDERS WHERE ORDER_ID=102;
SAVEPOINT SP3;

-- We want to undo the delete but keep the update 
ROLLBACK TO SAVEPOINT SP1;
SELECT * FROM ORDERS;
ROLLBACK;