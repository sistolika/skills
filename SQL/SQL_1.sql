USE SQL

/*Создание таблицы types
 - id_type. INT NOT NULL PRIMARY KEY IDENTITY(0,1),
 - type_name. VARCHAR (50) NOT NULL
 Заполнение таблицы значениями.
*/

CREATE TABLE product_types (
	id_type INT NOT NULL PRIMARY KEY IDENTITY(0,1),
	name_type VARCHAR (50) NOT NULL,
);

INSERT INTO product_types (name_type) VALUES 
('Браслет'),
('Брошь'),
('Колье'),
('Серьги');

/*Создание таблицы masters
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
('Мышкина Ольга Сергеевна', 12000, 'Санкт-Петербург'),
('Сергеев Дмитрий Викторович', 15000, 'Москва'),
('Нечаева Ольга Сергеевна', 21000, 'Рязань'),
('Черепанова Анастасия Евгеньевна', 10000, 'Санкт-Петербург'),
('Задеба Денис Александрович', 19000, 'Омск'),
('Дмитриев Андрей Викторович', 19000, 'Омск');

/*Создание таблицы products
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
(0 , 0 , 'Суккулент синий', 2800, 20, 10),
(0 , 0 , 'Суккулент фиолетовый', 2800, 20, 10),
(0 , 0 , 'Суккулент зелёный', 2800, 15, 5),
(0 , 0 , 'Суккулент розовый', 2800, 20, 6),
(0 , 1 , 'Лиса', 3000, 10, 7),
(0 , 1 , 'Енот', 3000, 5, 1),
(0 , 1 , 'Волк', 3000, 5, 0),
(0 , 1 , 'Бык', 3000, 9, 0),
(0 , 1 , 'Тигр', 3000, 5, 0),
(0 , 1 , 'Сокол', 2800, 20, 7),
(1 , 2 , 'Морозное сияние', 4000, 30, 10),
(1 , 2 , 'Блики солнца', 1000, 10, 4),
(1 , 2 , 'Вишневый цвет', 8000, 10, 1),
(1 , 2 , 'Дуновение ветра', 1200, 5, 0),
(1 , 2 , 'Зеленый луг', 12000, 1, 2),
(1 , 3 , 'Зима', 5000, 20, 1),
(1 , 3 , 'Весна', 5800, 20, 2),
(1 , 3 , 'Лето', 5800, 20, 0),
(1 , 3 , 'Осень', 5800, 20, 0),
(2 , 4 , 'Жемчуг', 3600, 20, 1),
(2 , 4 , 'Агат', 9500, 20, 0),
(2 , 4 , 'Топаз', 10300, 20, 1),
(2 , 4 , 'Аметист', 12800, 20, 0),
(3 , 4 , 'Изумрудные капли', 22800, 2, 1),
(3 , 5 , 'Рубин между строк', 19990, 1, 0),
(3 , 5 , 'Турмалиновый контраст', 20000, 20, 0),
(3 , 5 , 'Небесный аквамарин', 19990, 3, 1);