USE SQL

/*�������� ������� types
 - id_type. INT NOT NULL PRIMARY KEY IDENTITY(0,1),
 - type_name. VARCHAR (50) NOT NULL
 ���������� ������� ����������.
*/

CREATE TABLE product_types (
	id_type INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	name_type VARCHAR (50) NOT NULL,
);

INSERT INTO product_types (name_type) VALUES 
('�������'),
('�����'),
('�����'),
('������');

/*�������� ������� masters
	- id_master. INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	- master_name. VARCHAR (100) NOT NULL,
	- salary. INT NOT NULL,
	- town. VARCHAR (50)
*/

CREATE TABLE masters (
	id_master INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	master_name VARCHAR (100) NOT NULL,
	salary INT NOT NULL,
	town VARCHAR (100) NOT NULL,
);

INSERT INTO masters (master_name, salary, town) VALUES 
('������� ����� ���������', 12000, '�����-���������'),
('������� ������� ����������', 15000, '������'),
('������� ����� ���������', 21000, '������'),
('���������� ��������� ����������', 10000, '�����-���������'),
('������ ����� �������������', 19000, '����'),
('�������� ������ ����������', 19000, '����');

/*�������� ������� products
	- id_product. INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	- id_type. INT NOT NULL,
	- id_master. INT NOT NULL,
	- product_name. VARCHAR (100),
	- price. INT NOT NULL,
	- amount. INT NOT NULL,
	- sales. INT,
*/

CREATE TABLE products (
	id_product INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	id_type INT NOT NULL,
	id_master INT NOT NULL,
	product_name VARCHAR (100),
	price INT NOT NULL,
	amount INT NOT NULL,
	sales INT,
);

INSERT INTO products (id_type, id_master, product_name, price, amount, sales) VALUES 
(0 , 0 , '��������� �����', 2800, 20, 10),
(0 , 0 , '��������� ����������', 2800, 20, 10),
(0 , 0 , '��������� ������', 2800, 15, 5),
(0 , 0 , '��������� �������', 2800, 20, 6),
(0 , 1 , '����', 3000, 10, 7),
(0 , 1 , '����', 3000, 5, 1),
(0 , 1 , '����', 3000, 5, 0),
(0 , 1 , '���', 3000, 9, 0),
(0 , 1 , '����', 3000, 5, 0),
(0 , 1 , '�����', 2800, 20, 7),
(1 , 2 , '�������� ������', 4000, 30, 10),
(1 , 2 , '����� ������', 1000, 10, 4),
(1 , 2 , '�������� ����', 8000, 10, 1),
(1 , 2 , '��������� �����', 1200, 5, 0),
(1 , 2 , '������� ���', 12000, 1, 2),
(1 , 3 , '����', 5000, 20, 1),
(1 , 3 , '�����', 5800, 20, 2),
(1 , 3 , '����', 5800, 20, 0),
(1 , 3 , '�����', 5800, 20, 0),
(2 , 4 , '������', 3600, 20, 1),
(2 , 4 , '����', 9500, 20, 0),
(2 , 4 , '�����', 10300, 20, 1),
(2 , 4 , '�������', 12800, 20, 0),
(3 , 4 , '���������� �����', 22800, 2, 1),
(3 , 5 , '����� ����� �����', 19990, 1, 0),
(3 , 5 , '������������ ��������', 20000, 20, 0),
(3 , 5 , '�������� ���������', 19990, 3, 1);