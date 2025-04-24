USE BikeStores;

-- 1. sales.customers ���̺��� first_name�� 'Debra'�̰� last_name�� 'Burks'�� ���� ��� ������ ��ȸ�Ͻÿ�.
SELECT * 
FROM sales.customers
WHERE first_name = 'Debra'
	AND last_name = 'Burks'
;

-- 2. sales.orders ���̺��� 2016�⿡ �ֹ��� �ֹ����� order_id, customer_id, order_status�� ��ȸ�Ͻÿ�.
SELECT 
	order_id
	, customer_id
	, order_status
FROM sales.orders
WHERE YEAR(order_date) = '2016' 
;

-- 3. production.products ���̺��� ������ $500 �̻��̰� $1000 �̸��� �����ŵ��� ��ǰ��� ������ ��ȸ�Ͻÿ�.
SELECT 
	product_name
	, list_price
FROM production.products
WHERE list_price >= '500'
	AND list_price < '1000'
;

-- 4. sales.staffs ���̺��� store_id�� 2�� �������� �̸�(first_name, last_name)�� �̸����� ��ȸ�Ͻÿ�.
SELECT 
	first_name
	, last_name
	, email
FROM sales.staffs
WHERE store_id = 2
;

-- 5. production.brands ���̺��� �귣��� 'H/h'�� ���Ե� �귣����� ��� ������ ��ȸ�Ͻÿ�.
SELECT *
FROM production.brands
WHERE brand_name LIKE '%h%'
;

-- 6. sales.customers ���̺��� ���� �̸��� �ּҿ��� '@' ���� �κи� �����Ͽ� �̸��� �Բ� ��ȸ�Ͻÿ�.
-- SUBSTRING() & CHARINDEX() Ȱ��
SELECT 
	SUBSTRING(email, 1, CHARINDEX('@',email)-1) AS email_id
	, first_name
	,last_name
FROM sales.customers
;

-- 7. sales.orders ���̺��� �ֹ���(order_date)�� �����(shipped_date) ������ �ҿ� �ϼ��� ����Ͻÿ�.
-- DATEDIFF(), ISNULL(), GETDATE() Ȱ��
SELECT order_id, order_date, shipped_date, 
       DATEDIFF(day, order_date, ISNULL(shipped_date, GETDATE())) AS days_to_ship
FROM sales.orders;
;

-- 8. sales.orders ���̺��� �ֹ� ����(order_status)�� ������ ���� ��ȯ�Ͽ� ��ȸ�Ͻÿ�:
-- 1: 'Pending', 2: 'Processing', 3: 'Rejected', 4: 'Completed', ELSE 'Unknown'
-- CASE WHEN Ȱ��
SELECT order_id, 
	CASE order_status 
	WHEN 1 THEN 'Pending'
	WHEN 2 THEN 'Processing'
	WHEN 3 THEN 'Rejected'
	WHEN 4 THEN 'Completed'
	ELSE 'Unknown'
	END AS status_description
FROM sales.orders
;

-- 9. sales.customers ���̺��� phone�� NULL�� ��� 'No Phone'���� ǥ���Ͽ� ��ȸ�Ͻÿ�.
-- ISNULL() Ȱ��
SELECT customer_id, first_name, last_name, 
       ISNULL(phone, 'No Phone') AS contact_number
FROM sales.customers;

-- 10. production.products ���̺��� ��ǰ���� NULL�� �ƴϰ� ������ 0���� ū ��ǰ�鸸 ��ȸ�Ͻÿ�.
SELECT *
FROM production.products
WHERE product_name IS NOT NULL
	AND list_price > '0'
;


