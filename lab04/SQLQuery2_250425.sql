-- Chapter 9�� 
-- �ǽ� ������ �Ұ� 
USE lily_book_test;

-- ���̺� Ȯ�� 
SELECT * FROM sales;
SELECT * FROM customer;

-- ���̺� �⺻���� Ȯ���ϴ� ��ɾ�
EXEC sp_help 'sales';

/***********************************************************
�� ���� Ʈ���� (p.203)
************************************************************/

-- �Ⱓ�� ���� ��Ȳ
-- Ʈ���� : �ð迭 �м��� ����
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT
	CONVERT (DATE,invoicedate) AS invoicedate
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, SUM(quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY CONVERT (DATE,invoicedate)
ORDER BY invoicedate
;

-- ������ ���� ��Ȳ
-- ��� �÷� : country, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT 
	country
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, SUM(quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY country
ORDER BY 1
;

-- ������ x ��ǰ�� ���� ��Ȳ 
-- ��� �÷� : country, stockcode, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT 
	country
	, stockcode
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, SUM(quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY country , stockcode
ORDER BY 1, 2                  -- ���ڴ� �÷� �ε��� ��ȣ
;

-- Ư�� ��ǰ ���� ��Ȳ
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615
SELECT 
	ROUND(SUM(unitprice*quantity), 2) AS �����
	, SUM(quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
WHERE stockcode = '21615'
;

-- Ư�� ��ǰ�� �Ⱓ�� ���� ��Ȳ 
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615, 21731
SELECT
	CONVERT (DATE,invoicedate) AS invoicedate
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, SUM(quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
WHERE stockcode IN ('21615','21731')
GROUP BY CONVERT (DATE,invoicedate)
ORDER BY invoicedate

/***********************************************************
�� �̺�Ʈ ȿ�� �м� (p.213)
************************************************************/

-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� �� 15�ϵ��� ������ �̺�Ʈ�� ���� Ȯ�� 
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)
SELECT 
    CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�񱳱Ⱓ'
    END AS �Ⱓ����
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
WHERE invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25'
GROUP BY CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�񱳱Ⱓ'
    END
;

-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� Ư�� ��ǰ�� �ǽ��� �̺�Ʈ�� ���� ���� Ȯ��
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)
-- ��ǰ�� : 17012A, 17012C, 17084N
SELECT 
    CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ'
    END AS �Ⱓ����
	, ROUND (SUM(unitprice*quantity),2) AS �����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
WHERE (CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' 
	OR CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25')
	AND StockCode in ('17012A', '17012C', '17084N')
GROUP BY CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̺�Ʈ �Ⱓ'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ'
    END
;

/***********************************************************
�� CRM �� Ÿ�� ��� (p.217)
************************************************************/

-- Ư�� ��ǰ ���� �� ����
-- ���� : 2010.12.1 - 2010.12.10�ϱ��� Ư�� ��ǰ ������ �� ���� ���
-- ��� �÷� : �� ID, �̸�, ����, �������, ���� ����, ���, ���� ä��
-- HINT : �ζ��� �� ��������, LEFT JOIN Ȱ��
-- Ȱ���Լ� : CONCAT()
-- �ڵ�� : 21730, 21615

-- ������ �Ҷ���, �⺻Ű�� �ܷ�Ű�� �׻� ����
-- ������ �Ǵ� ���̺��� �⺻Ű�� �ߺ����� ������ ����� ��
-- SALES �������� customerid �ߺ����� ��� �����ؼ� ��ġ �⺻Ű�� �����ϴ� ���̺� ���·� ����
SELECT *
FROM (
	SELECT DISTINCT customerid
	FROM sales
	WHERE stockcode IN ('21730', '21615') 
	AND CONVERT(DATE, invoicedate) BETWEEN '2010-12-01' AND '2010-12-10'
) s
LEFT
JOIN (
	SELECT 
		mem_no AS '�� ID'
		, CONCAT(last_name, first_name) AS �̸� 
		, gd AS ����
		, birth_dt AS �������
		, entr_dt AS '���� ����'
		, grade AS ���
		, sign_up_ch AS '���� ä��'
	FROM customer
) c
ON s.customerid = c.[�� ID]
;

-- �̱��� �� ���� Ȯ��
-- ���� : ��ü ����� ���� �� �߿��� ���� �̷��� ���� ���� ���� �̷��� �ִ� �� ���� ���� 
-- ��� �÷� : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- Ȱ���Լ� : CASE WHEN, IS NULL, 

-- CUSTOMER LEFT JOIN SALES


-- ��ü ������ �̱��� ���� ��� 
-- ��� �÷� : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- Ȱ�� �Լ� : COUNT(), IS NULL

-- ��Ʈ
SELECT 
	c.*
    , s.*
FROM customer c
LEFT JOIN sales s ON c.mem_no =s.Customerid
;

/***********************************************************
�� �� ��ǰ ���� ���� (p.227)
************************************************************/

-- ���� ��� ��ǥ Ȱ���ϱ� 
-- ���� �����ǥ ���� : ATV, AMV, Avg.Frq, Avg.Units
-- ���� : sales �������� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT()

-- ���� : ���� : ���� �� ���� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : ����, ��, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT(), YEAR, MONTH

/***********************************************************
�� �� ��ǰ ���� ���� (p.230)
************************************************************/

-- Ư�� ���� ����Ʈ���� ��ǰ Ȯ��
-- ���� : 2011�⿡ ���� ���� �Ǹŵ� ��ǰ TOP 10�� ���� Ȯ�� 
-- ��� �÷� : stockcode, description, qty
-- Ȱ���Լ� : TOP 10, SUM(), YEAR()


... (72�� ����)