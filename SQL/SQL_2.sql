USE SQL 
/*1.Количество наименовай изделий*/
SELECT COUNT (*) AS "Количество наименований изделий" 
FROM products

/*2.Количество мастеров из Санкт-Петербурга и Омска*/
SELECT COUNT (*) AS "Количество мастеров из Санкт-Петербурга и Омска" 
FROM masters WHERE town = 'Санкт-Петербург' OR town = 'Омск'

/*3.Мастера из Омска*/
SELECT master_name AS "ФИО", salary AS "ЗП", town AS "Город" 
FROM masters WHERE town = 'Омск'

/*4.Сведения о всех мастерах*/
SELECT master_name, salary, town 
FROM masters

/*5. Фонд ЗП*/
SELECT SUM(salary) AS "Фонд ЗП" FROM masters

/*6. Мастер с максимальной и минимальной ЗП*/
SELECT master_name AS 'Мастер с максимальной ЗП', salary AS 'ЗП' 
FROM masters
WHERE salary = (SELECT MAX (salary) FROM masters)

SELECT master_name AS 'Мастер с минимальной ЗП', salary AS 'ЗП' 
FROM masters
WHERE salary = (SELECT MIN (salary) FROM masters)

/*7. Изделие с максимальной и минимальной смтоимостью*/
SELECT product_name AS 'Наименование изделия', price AS 'Цена' 
FROM products
WHERE price = (SELECT MAX (price) FROM products)
UNION ALL
SELECT product_name, price 
FROM products
WHERE price = (SELECT MIN (price) FROM products)

/*8. Название изделия, имя мастера*/
SELECT products.product_name AS 'Название изделия', masters.master_name AS 'Мастер' 
FROM masters LEFT JOIN products 
ON products.id_master = masters.id_master

/*Названия изделий произведенных в Омске и их стоимость*/
SELECT products.product_name AS 'Название изделия', products.price AS 'Стоимость' 
FROM products LEFT JOIN masters 
ON products.id_master = masters.id_master 
WHERE masters.town ='Омск'

/*Изделие с максимальной стоимостью*/
SELECT products.product_name AS 'Изделие с максимальной стоимостью', products.price AS 'Стоимость'
FROM products LEFT JOIN masters
ON products.id_master = masters.id_master
WHERE products.price = (SELECT MAX (products.price) FROM products)

/*9. Все изделия стоимостью меньше 3000 из Москвы*/
SELECT products.product_name AS 'Изделия стоимостью меньше 3000 из Москвы', products.price AS 'Стоимость', masters.town AS 'Город'
FROM products LEFT JOIN masters
ON products.id_master = masters.id_master
WHERE (products.price < 3000) AND (masters.town = 'Москва')


/*10. Все броши из Санкт-Петербурга*/
SELECT products.product_name AS 'Название изделия', products.price AS 'Стоимость', masters.master_name AS 'Мастер'
FROM products 
JOIN product_types
ON products.id_type = product_types.id_type
JOIN masters
ON products.id_master = masters.id_master
WHERE product_types.name_type = 'Брошь' AND masters.town = 'Санкт-Петербург'

/*11. Все Браслеты из Москвы*/
SELECT products.product_name AS 'Название изделия', products.price AS 'Стоимость', masters.master_name AS 'Мастер'
FROM products 
JOIN product_types
ON products.id_type = product_types.id_type
JOIN masters
ON products.id_master = masters.id_master
WHERE product_types.name_type = 'Браслет' AND masters.town = 'Москва'

/*12. Всего продано изделий*/
SELECT SUM(sales) AS 'Продажи' 
FROM products

/*13. Общая выручка*/
SELECT SUM(price * sales) AS 'Выручка' 
FROM products 

/*14. Выручка по городам*/
SELECT SUM(products.price * products.sales) AS 'Выручка' , masters.town AS 'Город'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = 'Москва' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , masters.town AS 'Город'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = 'Санкт-Петербург' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , masters.town AS 'Город'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = 'Омск' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , masters.town AS 'Город'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = 'Рязань' GROUP BY masters.town

/*15. Выручка по изделиям*/
SELECT SUM(products.price * products.sales) AS 'Выручка' , product_types.name_type AS 'Тип изделия'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = 'Браслет' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , product_types.name_type AS 'Тип изделия'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = 'Брошь' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , product_types.name_type AS 'Тип изделия'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = 'Колье' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS 'Выручка' , product_types.name_type AS 'Тип изделия'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = 'Серьги' GROUP BY product_types.name_type

/*16. Остаток изделий*/
SELECT product_name, amount - sales AS 'Остаток изделий' 
FROM products

/*17. Всего изделий осталось*/
SELECT SUM(amount - sales) AS 'Остаток изделий' FROM products

/*18. Средняя ЗП*/
SELECT AVG(salary) AS 'Средняя ЗП' 
FROM masters 

/*19. Средняя стоимость изделий*/
SELECT AVG(price) AS 'Средняя стоимость изделий' 
FROM products 

/*20. Изделия стоимость которых больше средней*/
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products)