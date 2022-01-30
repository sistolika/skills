USE SQL 
/*1.���������� ���������� �������*/
SELECT COUNT (*) AS "���������� ������������ �������" 
FROM products

/*2.���������� �������� �� �����-���������� � �����*/
SELECT COUNT (*) AS "���������� �������� �� �����-���������� � �����" 
FROM masters WHERE town = '�����-���������' OR town = '����'

/*3.������� �� �����*/
SELECT master_name AS "���", salary AS "��", town AS "�����" 
FROM masters WHERE town = '����'

/*4.�������� � ���� ��������*/
SELECT master_name, salary, town 
FROM masters

/*5. ���� ��*/
SELECT SUM(salary) AS "���� ��" FROM masters

/*6. ������ � ������������ � ����������� ��*/
SELECT master_name AS '������ � ������������ ��', salary AS '��' 
FROM masters
WHERE salary = (SELECT MAX (salary) FROM masters)

SELECT master_name AS '������ � ����������� ��', salary AS '��' 
FROM masters
WHERE salary = (SELECT MIN (salary) FROM masters)

/*7. ������� � ������������ � ����������� �����������*/
SELECT product_name AS '������������ �������', price AS '����' 
FROM products
WHERE price = (SELECT MAX (price) FROM products)
UNION ALL
SELECT product_name, price 
FROM products
WHERE price = (SELECT MIN (price) FROM products)

/*8. �������� �������, ��� �������*/
SELECT products.product_name AS '�������� �������', masters.master_name AS '������' 
FROM masters LEFT JOIN products 
ON products.id_master = masters.id_master

/*�������� ������� ������������� � ����� � �� ���������*/
SELECT products.product_name AS '�������� �������', products.price AS '���������' 
FROM products LEFT JOIN masters 
ON products.id_master = masters.id_master 
WHERE masters.town ='����'

/*������� � ������������ ����������*/
SELECT products.product_name AS '������� � ������������ ����������', products.price AS '���������'
FROM products LEFT JOIN masters
ON products.id_master = masters.id_master
WHERE products.price = (SELECT MAX (products.price) FROM products)

/*9. ��� ������� ���������� ������ 3000 �� ������*/
SELECT products.product_name AS '������� ���������� ������ 3000 �� ������', products.price AS '���������', masters.town AS '�����'
FROM products LEFT JOIN masters
ON products.id_master = masters.id_master
WHERE (products.price < 3000) AND (masters.town = '������')


/*10. ��� ����� �� �����-����������*/
SELECT products.product_name AS '�������� �������', products.price AS '���������', masters.master_name AS '������'
FROM products 
JOIN product_types
ON products.id_type = product_types.id_type
JOIN masters
ON products.id_master = masters.id_master
WHERE product_types.name_type = '�����' AND masters.town = '�����-���������'

/*11. ��� �������� �� ������*/
SELECT products.product_name AS '�������� �������', products.price AS '���������', masters.master_name AS '������'
FROM products 
JOIN product_types
ON products.id_type = product_types.id_type
JOIN masters
ON products.id_master = masters.id_master
WHERE product_types.name_type = '�������' AND masters.town = '������'

/*12. ����� ������� �������*/
SELECT SUM(sales) AS '�������' 
FROM products

/*13. ����� �������*/
SELECT SUM(price * sales) AS '�������' 
FROM products 

/*14. ������� �� �������*/
SELECT SUM(products.price * products.sales) AS '�������' , masters.town AS '�����'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = '������' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , masters.town AS '�����'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = '�����-���������' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , masters.town AS '�����'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = '����' GROUP BY masters.town
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , masters.town AS '�����'
FROM products JOIN masters
ON products.id_master = masters.id_master
WHERE masters.town = '������' GROUP BY masters.town

/*15. ������� �� ��������*/
SELECT SUM(products.price * products.sales) AS '�������' , product_types.name_type AS '��� �������'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = '�������' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , product_types.name_type AS '��� �������'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = '�����' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , product_types.name_type AS '��� �������'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = '�����' GROUP BY product_types.name_type
UNION ALL
SELECT SUM(products.price * products.sales) AS '�������' , product_types.name_type AS '��� �������'
FROM products JOIN product_types
ON products.id_type = product_types.id_type
WHERE product_types.name_type = '������' GROUP BY product_types.name_type

/*16. ������� �������*/
SELECT product_name, amount - sales AS '������� �������' 
FROM products

/*17. ����� ������� ��������*/
SELECT SUM(amount - sales) AS '������� �������' FROM products

/*18. ������� ��*/
SELECT AVG(salary) AS '������� ��' 
FROM masters 

/*19. ������� ��������� �������*/
SELECT AVG(price) AS '������� ��������� �������' 
FROM products 

/*20. ������� ��������� ������� ������ �������*/
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products)