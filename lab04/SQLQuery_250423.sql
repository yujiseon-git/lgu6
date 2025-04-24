-- ���� WHERE ��
-- ���ǰ� ��ġ�ϴ� ������ ��ȸ (���͸�)
-- pandas, iloc,loc, �񱳿����� �� ���� ���
-- P.94
USE lily_book;
SELECT 
	*
FROM customer
WHERE customer_id = 'c002'
;

-- ������ ���� ''���� ����ǥ�� ����
-- WHERE�� �ȿ��� �񱳿����� ���ؼ� ���͸�
-- <> != : �¿찡 ���� ���� ����
SELECT * 
FROM sales 
WHERE sales_amount > 0
;

-- �ٻ簪 �Է��ϱ�
SELECT * 
FROM sales 
WHERE sales_amount = 40000
;

-- �����Ͱ� �ƿ� ���� ����, NULL ���·� ���
-- ��ȸ�� �� ��, ��Ȯ�ϰ� �Է����� �ʾƵ� NULL ���·� ���

-- P100 BETWEEN ������ ���� ����
SELECT * 
FROM sales
WHERE sales_amount BETWEEN 35000 AND 40000
;

-- IN ������ �ſ�ſ� ���� ����
-- OR ������ �ݺ��ؼ� ���� �Ⱦ IN �����
SELECT * FROM sales WHERE product_name IN ('�Ź�', 'å')

-- Like ������ p.103
USE Bikestores;
-- lastname�� letter z�� �����ϴ� ��� ���� ���͸�
SELECT * 
FROM sales.customers
WHERE last_name LIKE 'z%'
;

SELECT * 
FROM sales.customers
WHERE last_name LIKE '%z'
;

SELECT * 
FROM sales.customers
WHERE last_name LIKE '%z%'
;

-- IS NULL ������ (�߿�)
-- �����Ͱ� NULL���� �ุ ���͸�
SELECT *
FROM sales.customers
WHERE phone IS NULL 
;

--p.109
-- AND ������ / OR ������
USE lily_book;
SELECT * FROM distribution_center
WHERE permission_date > '2022-05-01'
	AND permission_date < '2022-07-31'
;

-- OR ������
-- LIKE �����ڿ� ���� ������ ����
SELECT * FROM distribution_center
WHERE address LIKE '��⵵ ���ν�%'
	OR address LIKE '�����%'
;

-- ������ �켱 ���� : () > AND > ORL

-- ����������
-- IN, NOT IN ���� ����
-- IS NULL, IS NOT NULL 
SELECT *
FROM distribution_center
WHERE center_no NOT IN(1,2);

-- GROUP BY
SELECT ��¥, SUM(����) AS ����
FROM sales
GROUP BY ��¥
;

SELECT *
FROM sales
;

SELECT ��¥, ��ǰ��, SUM(����) AS ����, SUM(�ݾ�) AS �ݾ�
FROM sales
GROUP BY ��¥, ��ǰ��
;

-- (p.131)

USE lily_book;
SELECT * FROM distribution_center;

SELECT MONTH(permission_date) AS ��
FROM distribution_center
GROUP BY MONTH(permission_date)
;