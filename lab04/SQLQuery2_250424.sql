-- HAVING�� 
-- HAVING vs WHERE : ���͸�
-- WHERE : ���� �����͸� �������� ���͸�
-- HAVING : �׷�ȭ ����� ���� ���ĸ� �������� ���͸�

SELECT * FROM sales_ch5 ;
SELECT 
	customer_id
	, SUM(sales_amount) AS ����
FROM sales_ch5
GROUP BY customer_id 
HAVING SUM(sales_amount) > 20000
;

-- MS-SQL, Oracle ���� ��� ������ ������ ��
-- MYSQL, postgreSQL

--ORDER BY��
-- DESC : �������� 
-- ASC, ����Ʈ : ��������

SELECT 
	customer_id
	, SUM(sales_amount) AS ����
FROM sales_ch5
GROUP BY customer_id 
ORDER BY ���� ASC
;

-- DB�� �����͸� ó���ϴ� ����
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELCET -> ORDER BY

-- ��������

SELECT * FROM product_info;
SELECT * FROM category_info;
SELECT * FROM event_info;


p.161
-- ��ǰ ������ �ִ� product_info
-- ��ǰ ī�װ��� �ִ� category_info
-- �̺�Ʈ ��ǰ�� ���� ���� event_info

-- ���� �ٸ� ���̺� -> ���̺� ���� (�Ϲ����� ���)


SELECT 
	product_id
	, product_name
	, category_id
	, (SELECT category_name FROM category_info c WHERE c.category_id = p.category_id) AS '��ǰ ī�װ�'
FROM product_info p; --�Ϲ������� ���̺� ���� ���̺��� �̸��� ALIAS ó��

-- JOIN��
SELECT 
    p.product_id,
    p.product_name,
    p.category_id,
    c.category_name AS '��ǰ ī�װ�'
FROM product_info p
JOIN category_info c ON p.category_id = c.category_id;

-- FROM�� ��������
-- data1 = data.����
-- data2 = data1.����
-- SELECT FROM (SELECT FROM(SELECT FROM))


-- product_info ���̺�, ī�װ����� ��ǰ�� ������ 5�� �̻��� ī�װ��� ���
SELECT *
FROM (
	SELECT 
		category_id
		, COUNT(product_id) AS count_of_product
	FROM product_info
	GROUP BY category_id
)P
WHERE count_of_product >= 5
;

-- WHERE�� ��������
-- ���������� �� �ϰ� ���� : ��Ȱ �� ��ġ��
-- ���������� �������� ��Ȱ�ؼ� ó��

-- product_info T, ���� ��ǰ ī�װ��� ���


SELECT * FROM product_info WHERE category_id = (
	SELECT category_id FROM category_info WHERE category_name = '������ǰ'
);

-- p168
-- product_info T, evant_id �÷��� e2�� ���Ե� ��ǰ�� ������ ���
--��������
SELECT * FROM product_info;
SELECT * FROM event_info WHERE event_id = 'e2' ;

SELECT * FROM product_info WHERE product_id IN (
	SELECT product_id FROM event_info WHERE event_id = 'e2'
);


-- ���̺��� ����
-- LEFT JOIN, RIGHT JOIN, OUTER JOIN(FULL JOIN), INNER JOIN
-- LEFT OUTER JOIN, RIGHT OUTER JOIN
SELECT * FROM product_info
SELECT * FROM category_info

SELECT *
FROM product_info pi
LEFT
JOIN category_info ci ON pi.category_id = ci.category_id
;

-- UNION ������ : ���̺� �Ʒ��� ���̱�
-- UNION(�ߺ��� ����) vs UNION ALL (�ߺ� �� ���� X)
SELECT * 
FROM sales_2023


-- �������� �߰� ����
USE Bikestores;


-- ���̺�
SELECT * FROM sales.orders;
-- ���� 2017�⿡ ���� ���� �ֹ��� ó���� ������ ó���� ��� �ֹ� ��ȸ
-- 1. ��� �ֹ� ���� ǥ��
-- 2. WHERE �������� ����ؼ� 2017�� �ִ� �ֹ� ó�� ���� ã��
-- 3. TOP1 �� GROUPBY ���
-- 4. Ȱ���Լ� : YEAR, COUNT(*)
SELECT *
FROM sales.orders
WHERE staff_id = (
	SELECT TOP 1 staff_id
	FROM sales.orders 
	WHERE YEAR(order_date) = 2017
	GROUP BY staff_id
	ORDER BY count(*) DESC
);


-- ���̺� 2��
SELECT * FROM production.products;
SELECT * FROM sales.order_items;

SELECT * 
FROM production.products
WHERE product_id NOT IN  (
SELECT DISTINCT product_id
FROM sales.order_items
);
