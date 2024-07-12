-- 1. Genders
CREATE TABLE Genders(
  id serial PRIMARY key,
  gender_name varchar(15) NOT NULL
);

-- 2. Customers
CREATE TABLE Customers(
id serial PRIMARY KEY,
fullname varchar(100) NOT NULL,
address varchar(100) NOT NULL,
phone varchar(15) NOT NULL,
gender_id int not null,
birth_date varchar NOT NULL,
age int NOT NULL,
FOREIGN KEY(gender_id) REFERENCES Genders(id)
);

-- 3. Account Types
CREATE TABLE Account_Types(
  id serial PRIMARY KEY,
  acc_level varchar(20) NOT null
 );

-- 4. Accounts
CREATE TABLE Accounts(
id serial PRIMARY KEY,
cust_id int NOT NULL,
acc_type_id int NOT NULL,
acc_name varchar(20) NOT NULL,
acc_numb varchar(20) UNIQUE NOT NULL,
acc_email varchar(50) UNIQUE NOT NULL,
acc_password varchar(50) UNIQUE NOT NULL,
balance int NOT NULL,
FOREIGN KEY(cust_id) REFERENCES Customers(id),
FOREIGN KEY(acc_type_id) REFERENCES Account_Types(id)
);

-- 5. Transaction Types
CREATE TABLE Transaction_Types(
id serial PRIMARY KEY,
type_trans varchar(20) NOT NULL
);

-- 6. Admin Fees
CREATE TABLE Admin_Fees(
id serial PRIMARY KEY,
amount int NOT NULL
);

-- 7. Transactions
CREATE TABLE Transactions(
id serial PRIMARY KEY,
acc_id int NOT NULL,
type_id int NOT NULL,
fee_id int NOT NULL,
amount int NOT NULL,
notes text,
FOREIGN KEY(acc_id) REFERENCES Accounts(id),
FOREIGN KEY(type_id) REFERENCES Transaction_Types(id),
FOREIGN KEY(fee_id) REFERENCES Admin_Fees(id) 
);


-- Database Index
CREATE INDEX idx_Accounts_acc_numb on Accounts(acc_numb);
CREATE INDEX idx_Accounts_balance on Accounts(balance);

------------------------------------ C R U D -----------------------------------------------

-- 1. CRUD Genders --------------------------
-- 1.1 Create
INSERT INTO Genders (gender_name) VALUES
('Laki-laki'), 
('Perempuan');

-- 1.2 Read
SELECT * FROM Genders;

-- 2. CRUD Account Types --------------------------
-- 2.1 Create
INSERT INTO Account_Types (acc_level) VALUES
('Silver'),
('Gold'),
('Platinum');

-- 2.2 Read
SELECT * FROM Account_Types;

-- 3. Transaction Types --------------------------
-- 3.1 Create
INSERT INTO Transaction_Types (type_trans) VALUES
('Debit'),
('Credit');

-- 3.2 Read
SELECT * FROM Transaction_Types;

-- 4. Admin Fees --------------------------
-- 4.1 Create
INSERT INTO Admin_Fees (amount) VALUES
(0),
(2000),
(6500);

-- 4.2 Read
SELECT * FROM Admin_Fees;

-- 5. CRUD Customers -------------------------------------------------------------------------------------------------
-- 5.1 Create
INSERT INTO Customers (fullname, address, phone, gender_id, birth_date, age) VALUES
('Afriansyah', 'tangerang', '089502252322', '1', '23-05-1999', '25'),
('Khairul', 'serang', '085283709368', '1', '27-07-1999', '25'),
('Lingga', 'cilegon', '083879138612', '1', '18-01-1999', '25'),
('Merlina', 'pandeglang', '083151743238', '2', '21-09-1998', '26'),
('Naida', 'rangkasbitung', '087780368891', '2', '27-04-1999', '25'),
('Aniendita', 'lebak', '089524554412', '2', '21-02-1999', '25'),
('Meisya', 'tangerang selatan', '087871363499', '2', '11-01-1999', '25'),
('Rabbani', 'serang', '085691443642', '1', '29-12-1999', '25'),
('Maritza', 'tangerang', '081210790095', '2', '05-08-1999', '25'),
('Tiara', 'pandelang', '087776030525', '2', '24-04-1999', '25');

-- 5.2 Read
SELECT * FROM Customers;

-- 5.3 Update
UPDATE Customers SET Address = 'pandeglang' WHERE id = 2;

-- 5.4 Delete
DELETE FROM Customers WHERE id = 1;

-- 6. CRUD Accounts -------------------------------------------------------------------------------------------------
-- 6.1 Create
INSERT INTO Accounts (cust_id, acc_type_id, acc_name, acc_numb, acc_email, acc_password, balance) VALUES
(2, 2, 'khairul22', '10790095' , 'khairul@gmail.com', 'khairul12345', 11000000),
(3, 3, 'linga33', '91443642', 'lingga@gmail.com', 'lingga12345', 21000000),
(4, 3, 'merlina44', '71363499', 'merlina@gmail.com', 'merlin12345', 25000000),
(5, 2, 'naida55', '24554412', 'naida@gmail.com', 'naida12345', 12000000),
(6, 1, 'aniendita66', '80368891', 'aniendita@gmail.com', 'aniendita12345', 5000000),
(7, 1, 'meisya77', '51743238', 'meisya@gmail.com', 'meisya12345', 8000000),
(8, 2, 'rabbani88', '79138612', 'rabbani@gmail.com', 'rabbani12345', 14000000),
(9, 3, 'maritza99', '83709368', 'maritza@gmail.com', 'maritza12345', 27000000),
(10, 3, 'tiara10', '02252322', 'tiara@gmail.com', 'tiara12345', 30000000);

-- 6.2 Read
SELECT * FROM Accounts;
SELECT * FROM Accounts WHERE id = 2;

-- 6.3 Update
UPDATE Accounts SET balance = 22000000 WHERE id = 2;

-- 6.4 Delete
DELETE FROM Accounts WHERE id = 5;

-- 7. CRUD Transactions -------------------------------------------------------------------------------------------------
-- 7.1 Create
INSERT INTO Transactions (acc_id, type_id, fee_id, amount) VALUES
(1, 2, 1, 1000000),
(3, 1, 3, 500000),
(4, 1, 3, 200000),
(6, 1, 2, 100000),
(7, 2, 1, 5000000),
(8, 2, 1, 2500000),
(9, 1, 3, 8000000);

-- 7.2 Read
SELECT * FROM Transactions;
SELECT * FROM Transactions WHERE acc_id = 8;

-- 7.3 Update
UPDATE Transactions SET amount = 4000000 WHERE acc_id = 7;
UPDATE Transactions SET notes = 'bayar arisan' WHERE acc_id = 3;
UPDATE Transactions SET notes = 'bayar sampah' WHERE acc_id = 4;
UPDATE Transactions SET notes = 'topup shopee' WHERE acc_id = 6;
UPDATE Transactions SET notes = 'beli iphone' WHERE acc_id = 9;

-- 7.4 Delete
DELETE FROM Transactions WHERE acc_id = 9;