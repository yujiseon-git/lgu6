-- ���� ������ ���̽� Ȯ��
SELECT DB_NAME(); 

-- �����ͺ��̽� > table (pandas ������������)
-- �����ͺ��̽��ȿ� �ִ� ��
---- ���̺� �ܿ���, view, ���ν���, Ʈ����, ����� ���� �Լ� �� ����
-- SQL, SQEL : E - English
-- ������ ���� ������ �ſ� �����
-- ǥ�� SQL, 99% ���, 1% �ٸ� ==> ������Ÿ���� �� ���̰� �� ����(DB ��������)


-- ������ Ȯ��
USE lily_book
SELECT * FROM staff;
SELECT * FROM lily_book.dbo.staff;


USE Bikestores;
SELECT * FROM production.brands;

-- �����ͺм��� ��� ��
-- SELECL, FROM
-- FROM A pandas dataframe SELECT column
-- P.42 SELECT���� FROM��
USE lily_book;
SELECT 
	employee_id
	, employee_name
	, birth_date 
FROM staff
; -- �ش� ���� �ڵ� �ۼ� �Ϸ�

SELECT * FROM staff;
SELECT employee_name, employee_id FROM staff; --��ȸ �� �÷� ���� �а� ����

-- �÷� ��Ī
-- �÷��� ���� �� ���� ���� ���� ==> ������ ���Ǽ� ����
-- ALIAS (AS)

SELECT employee_id, birth_date
FROM staff
;

SELECT employee_id, birth_date AS "���� ����"
FROM staff
;

-- DISTINCT �ߺ��� ����
SELECT gender FROM staff;

SELECT DISTINCT gender FROM staff;


SELECT employee_name, gender, position FROM staff;
SELECT DISTINCT position, employee_name, gender FROM staff;
-- �ϳ��� �÷��� ������ ���� ���ϸ� DISTINCT ��� �Ұ����� ��ü �����Ͱ� ��ȸ��

-- ���ڿ� �Լ� : �ٸ� DBMS�� ���� ����
SELECT * FROM apparel_product_info;

-- LEFT �Լ� Ȯ��
SELECT product_id, LEFT(product_id, 2) AS ���
FROM apparel_product_info;

-- SUBSTRING ���ڿ� �߰� N��° �ڸ����� N���� ���
-- SUBSTRING(�÷���, ����(N start), ����(N end))
-- ���̽�, �ٸ� ���α׷��� ���� �ε����� 0��°���� ���� MS-SQL�� 1��������
SELECT product_id, SUBSTRING(product_id, 6, 2) AS ���
FROM apparel_product_info;

--CONCCAT ���ڿ��� ���ڿ� �̾ ���
SELECT CONCAT(category1, '>', category2, '=', '��', price) AS �׽�Ʈ
FROM apparel_product_info;

-- REPLACE : ���ڿ����� Ư�� ���� ����
-- p58
SELECT product_id, REPLACE(product_id, 'F', 'A') AS ���
FROM apparel_product_info;


-- ISNULL �߿���
-- WHERE���� �Բ� ���� �� ���� Ȱ��Ǵ� ���
-- �����ͻ� ����ġ�� ���� �Ҷ� ��, �ʿ��� �Լ�
SELECT *
FROM apparel_product_info
;


-- �����Լ� : ABS, CEILING, FLOOR, ROUND, POWER, SQRT
SELECT ROUND (CAST(748.58 AS DECIMAL(6,2)), -3);


-- CEILING: Ư�� ���ڸ� �ø� ó��
SELECT * FROM sales;
SELECT 
	sales_amount_usd
	, CEILING(sales_amount_usd) AS ���
FROM sales;

-- ��¥�Լ� : ���Ĺ���, ������ ����
-- GETDATE : ���Ĺ��� ����
-- DATEADD : ���Ĺ��� ����
-- DATEDIFF : p255 �籸���� ���� �� �� ����.
SELECT
	order_date
	, DATEADD(YEAR, -1, order_date) AS ���1
	, DATEADD(YEAR, +2, order_date) AS ���2
	, DATEADD(DAY, +2, order_date) AS ���2
FROM sales
;

-- DATEDIFF (p72)
SELECT
	order_date
	, DATEDIFF(MONTH, order_date, '2025-04-22') �Լ�������1
	, DATEDIFF(DAY, order_date, '2025-04-22') �Լ�������1
FROM sales

SELECT DATEDIFF(DAY, '2023-06-30', '2025-05-30');

-- �����Լ� (p74) == ������ �Լ� ==> ��¦ ������
-- RANK : 
SELECT * FROM student_math_score;
SELECT
	�л�
	, ��������
	, RANK() OVER(ORDER BY �������� DESC) AS rank���
	, DENSE_RANK() OVER(ORDER BY �������� DESC) AS dense_rank���
	, ROW_NUMBER() OVER(ORDER BY �������� DESC) AS row_number���
FROM student_math_score
;

-- PARTITION BY
-- OVER (ORDER BY) : ��ü �߿��� �� ��
-- OVER(PARTITION BY class ORDER BY) : �� ���� ������ �� �ݿ��� �� ��?

SELECT
	�л�
	, Class
	, ��������
	, DENSE_RANK() OVER(ORDER BY �������� DESC) AS �������
	, DENSE_RANK() OVER(PARTITION BY Class 
						ORDER BY �������� DESC) AS �ݵ��
FROM student_math_score
;

-- CASE��, ���ǹ� (IF�� ��� ��� X)
-- SELECT�� �ۼ� ��, ��ȸ��
-- PL/SQL ����쿡��, IF�� ��� ����

-- ���� 0���� �۴ٸ� 'ȯ�Ұŷ�', 0���� ũ�ٸ� '����ŷ�'�� �з�
SELECT 
	sales_amount
	, CASE WHEN sales_amount < 0 THEN 'ȯ�Ұŷ�'
           WHEN sales_amount > 0 THEN '����ŷ�'
	END AS ������
FROM sales
;

-- �����Լ�



-- �ǽ�
SELECT * FROM customer
SELECT CONCAT(last_name, first_name) AS fullname
FROM customer
;

SELECT
	ISNULL (phone_number,email) AS contact_info
FROM customer
;

SELECT 2025-YEAR(date_of_birth) AS age
FROM customer
;

SELECT 
	CASE WHEN 2025-YEAR(date_of_birth) BETWEEN 20 AND 29 THEN '20��'
	     WHEN 2025-YEAR(date_of_birth) BETWEEN 30 AND 39 THEN '30��'
		 WHEN 2025-YEAR(date_of_birth) BETWEEN 40 AND 49 THEN '40��'
		 END AS ageband
FROM customer
;

SELECT
	customer_id
	, CONCAT (last_name, first_name) AS fullname
	, ISNULL (phone_number,email) AS contact_info
	, 2025- YEAR(date_of_birth) AS age
	, CASE WHEN 2025- YEAR(date_of_birth) BETWEEN 20 AND 29 THEN '20��'
	       WHEN 2025-YEAR(date_of_birth) BETWEEN 30 AND 39 THEN '30��'
		   WHEN 2025-YEAR(date_of_birth) BETWEEN 40 AND 49 THEN '40��'
	END AS ageband
FROM customer
;

USE Bikestores
SELECT * FROM sales.customers;
SELECT * FROM sales.customers WHERE state = 'CA';
SELECT 
	city
	, COUNT (*)
FROM sales.customers 
WHERE state = 'CA' 
GROUP BY city
HAVING COUNT (*) > 10
ORDER BY city
;

USE Bikestores
SELECT 
	first_name
	, last_name
FROM sales.customers
ORDER BY first_name DESC
;

SELECT 
	first_name
	,last_name
FROM sales.customers
ORDER BY 
	LEN(first_name)
;


SELECT 
	first_name
	,last_name
FROM sales.customers
ORDER BY 
	1,
	2
;

SELECT 
	product_name
	, list_price
FROM production.products
ORDER BY
	list_price DESC
	, product_name
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY
;

SELECT TOP 10 WITH TIES
	product_name
	, list_price
FROM production.products
ORDER BY list_price DESC
;
SELECT * FROM sales.customers;

SELECT 
	 DISTINCT city
	 , state
FROM sales.customers

;











