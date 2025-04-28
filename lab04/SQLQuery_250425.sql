USE lily_book_test;

SELECT * FROM sales;

SELECT COUNT(DISTINCT customerid) AS rentention_cnt
FROM sales
WHERE customerid <> ''
    AND customerid IN (
    SELECT DISTINCT customerid FROM sales 
    WHERE customerid <> ''
        AND YEAR(invoicedate) = '2010'
)
    AND YEAR(invoicedate) = '2011'
;


-- Chapter 9�� 
-- �ǽ� ������ �Ұ� 
USE lily_book_test;

-- ���̺� Ȯ�� 
SELECT * FROM sales;
SELECT * FROM customer;

/***********************************************************
�� ���� Ʈ���� (p.203)
************************************************************/

-- �Ⱓ�� ���� ��Ȳ
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT
	invoicedate
	, SUM (unitprice * quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY invoicedate
ORDER BY invoicedate 
;
-- ������ ���� ��Ȳ
-- ��� �÷� : country, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT
	country
	, SUM (unitprice * quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY country
ORDER BY country
;

-- ������ x ��ǰ�� ���� ��Ȳ 
-- ��� �÷� : country, stockcode, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
SELECT
	country
	, StockCode
	, SUM (unitprice * quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT Invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT CustomerID) AS �ֹ�����
FROM sales
GROUP BY country
	, StockCode
;

-- Ư�� ��ǰ ���� ��Ȳ
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615
SELECT 
	SUM (UnitPrice * Quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT customerid) AS �ֹ�����
FROM sales
WHERE StockCode = '21615'
;

-- Ư�� ��ǰ�� �Ⱓ�� ���� ��Ȳ 
-- ��� �÷� : invoicedate, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����
-- Ȱ�� �Լ� : SUM(), COUNT()
-- �ڵ�� : 21615, 21731
SELECT
	invoicedate
	, SUM (UnitPrice * Quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT customerid) AS �ֹ�����
FROM sales
WHERE StockCode in ('21615','21731')
GROUP BY InvoiceDate
ORDER BY InvoiceDate
;

/***********************************************************
�� �̺�Ʈ ȿ�� �м� (p.213)
************************************************************/

-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� �� 15�ϵ��� ������ �̺�Ʈ�� ���� Ȯ�� 
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)
SELECT CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̹�Ʈ �Ⱓ'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ(�������Ⱓ)'
	END AS '�Ⱓ ����'
	, SUM (UnitPrice * Quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT customerid) AS �ֹ�����
FROM sales
WHERE invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25'
GROUP BY CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̹�Ʈ �Ⱓ'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ(�������Ⱓ)'
	END
;
-- �̺�Ʈ ȿ�� �м� (�ñ⿡ ���� ��)
-- 2011�� 9/10 ~ 2011�� 9/25���� Ư�� ��ǰ�� �ǽ��� �̺�Ʈ�� ���� ���� Ȯ��
-- ��� �÷� : �Ⱓ ����, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ����� 
-- Ȱ�� �Լ� : CASE WHEN, SUM(), COUNT()
-- �Ⱓ ���� �÷��� ���� ���� : �̺�Ʈ �Ⱓ, �̺�Ʈ �񱳱Ⱓ(�������Ⱓ)
-- ��ǰ�� : 17012A, 17012C, 17084N
SELECT CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̹�Ʈ �Ⱓ'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ(�������Ⱓ)'
	END AS '�Ⱓ ����'
	, SUM (UnitPrice * Quantity) AS �����
	, SUM (quantity) AS �ֹ�����
	, COUNT (DISTINCT invoiceno) AS �ֹ��Ǽ�
	, COUNT (DISTINCT customerid) AS �ֹ�����
FROM sales
WHERE StockCode in ('17012A', '17012C', '17084N')
	AND (invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25')
GROUP BY CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '�̹�Ʈ �Ⱓ'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '�̺�Ʈ �񱳱Ⱓ(�������Ⱓ)'
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
SELECT * FROM customer
SELECT * FROM sales

SELECT
	mem_no AS '�� ID'
	, CONCAT(last_name, first_name) AS �̸� 
	, gd AS ����
	, birth_dt AS �������
	, entr_dt AS '���� ����'
	, grade AS ���
	, sign_up_ch AS '���� ä��'
FROM customer
WHERE mem_no IN (
	SELECT DISTINCT customerid 
	FROM sales 
	WHERE stockcode IN ('21730', '21615') 
	AND CONVERT(DATE, invoicedate) BETWEEN '2010-12-01' AND '2010-12-10'
);

-- �̱��� �� ���� Ȯ��
-- ���� : ��ü ����� ���� �� �߿��� ���� �̷��� ���� ���� ���� �̷��� �ִ� �� ���� ���� 
-- ��� �÷� : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- Ȱ���Լ� : CASE WHEN, IS NULL, 
SELECT CASE WHEN s.CustomerID IS NULL THEN c.mem_no END AS non_purchaser
	, c.mem_no
	, c.last_name
	, c.first_name
	, s.InvoiceNo
	, s.StockCode
	, s.InvoiceDate
	, s.UnitPrice
	, s.CustomerID
FROM customer c

LEFT JOIN sales s
	ON c.mem_no = s.CustomerID

-- ��ü ������ �̱��� ���� ��� 
-- ��� �÷� : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- Ȱ�� �Լ� : COUNT(), IS NULL
SELECT
	COUNT (DISTINCT CASE WHEN s.CustomerID IS NULL THEN c.mem_no END) AS non_purchaser
	, COUNT (DISTINCT mem_no) AS total_customer
FROM customer c
LEFT JOIN sales s
	ON c.mem_no = s.CustomerID
;
/***********************************************************
�� �� ��ǰ ���� ���� (p.227)
************************************************************/

-- ���� ��� ��ǥ Ȱ���ϱ� 
-- ���� �����ǥ ���� : ATV, AMV, Avg.Frq, Avg.Units
-- ���� : sales �������� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT()

SELECT 
	ROUND (SUM(unitprice * Quantity) / count(DISTINCT Invoiceno), 2) AS ATV --�ֹ��Ǽ�
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT customerid), 2) AS AMV --�ֹ�����
	, COUNT (DISTINCT Invoiceno) * 1.00 / COUNT (DISTINCT customerid) * 1.00 AS Avgfrq

FROM sales
;


-- ���� : ���� : ���� �� ���� ���� �����ǥ, ATV, AMV, Avg.Frq, Avg.Units �˰� ����
-- ��� �÷� : ����, ��, �����, �ֹ�����, �ֹ��Ǽ�, �ֹ�����, ATV, AMV, Avg.Frq, Avg.Units
-- Ȱ���Լ� : SUM(), COUNT(), YEAR, MONTH
SELECT
	YEAR(invoicedate) AS ����
	, MONTH (invoicedate) AS ��
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT Invoiceno), 2) AS ATV --�ֹ��Ǽ�
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT customerid), 2) AS AMV --�ֹ�����
	, COUNT (DISTINCT Invoiceno) * 1.00 / COUNT (DISTINCT customerid) * 1.00 AS Avgfrq
FROM sales
GROUP BY YEAR(invoicedate)
,MONTH (invoicedate)
ORDER BY 1, 2
;

/***********************************************************
�� �� ��ǰ ���� ���� (p.230)
************************************************************/

-- Ư�� ���� ����Ʈ���� ��ǰ Ȯ��
-- ���� : 2011�⿡ ���� ���� �Ǹŵ� ��ǰ TOP 10�� ���� Ȯ�� 
-- ��� �÷� : stockcode, description, qty
-- Ȱ���Լ� : TOP 10, SUM(), YEAR()

-- SELECT FROM GROUP BY �������� �ǸŰ��� ==> A1
-- SELECT ROW_NUMBER() FROM (A1) ==> A2
-- SELECT ~ FROM (A2) WHERE RNK <= TOP10

SELECT TOP 10
	stockcode
	, CONVERT(VARCHAR(255), description) AS description
	, SUM(quantity) AS qty
FROM sales
WHERE YEAR(invoicedate) = '2011'
GROUP BY stockcode, CONVERT(VARCHAR(255), description)
ORDER BY qty DESC
;

SELECT stockcode, description, qty
FROM (
    SELECT 
        stockcode,
        CONVERT(VARCHAR(255), description) AS description,
        SUM(quantity) AS qty,
        ROW_NUMBER() OVER (ORDER BY SUM(quantity) DESC) AS rn
    FROM sales
    WHERE YEAR(invoicedate) = '2011'
    GROUP BY stockcode, CONVERT(VARCHAR(255), description)
) AS ranked
WHERE rn <= 10;

-- ������ ����Ʈ���� ��ǰ Ȯ��
-- ���� : �������� ���� ���� �Ǹŵ� ��ǰ ������ ������ ���ϰ� ����
-- ��� �÷� : RNK, country, stockcode, description, qty
-- HINT : �ζ��� �� ��������
-- Ȱ���Լ� : ROW_NUMBER() OVER(PARTITION BY...), SUM()
SELECT TOP 10
	country
	, stockcode
	, CONVERT(VARCHAR(255), description) AS description
	, SUM(quantity) AS qty
FROM sales
WHERE YEAR(invoicedate) = '2011'
GROUP BY country, stockcode, CONVERT(VARCHAR(255), description)
ORDER BY 2, 1
;


-- 20�� ���� ���� ����Ʈ���� ��ǰ Ȯ�� 
-- ���� : 20�� ���� ���� ���� ���� ������ TOP 10�� ���� Ȯ�� 
-- ��� �÷� : RNK, country, stockcode, description, qty
-- HINT : �ζ��� �� ��������, �ζ��� �� �������� �ۼ� ��, LEFT JOIN �ʿ�
-- Ȱ���Լ� : ROW_NUMBER() OVER(PARTITION BY...), SUM(), YEAR()


-- ���� ������ �ڵ�
SELECT
	stockcode
	, CONVERT(VARCHAR(255), description) AS description
	, SUM(s.quantity) AS qty
FROM sales s
LEFT
JOIN customer c
	ON s.customerid = c.mem_no
WHERE c.gd = 'F'
	AND 2025-YEAR(c.birth_dt) BETWEEN '20' AND '29'
GROUP BY stockcode
	, CONVERT(VARCHAR(255), description)
HAVING SUM(s.quantity) >= 1000
ORDER BY qty DESC
;

-- 
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER (ORDER BY qty DESC) AS rnk
		, stockcode
		, description
		, qty
FROM (
SELECT
	stockcode
	, CONVERT(VARCHAR(255), description) AS description
	, SUM(s.quantity) AS qty
FROM sales s
LEFT
JOIN customer c
	ON s.customerid = c.mem_no
WHERE c.gd = 'F'
	AND 2025-YEAR(c.birth_dt) BETWEEN '20' AND '29'
GROUP BY stockcode
	, CONVERT(VARCHAR(255), description)
)a
)aa
WHERE RNK <= 10
;

/***********************************************************
�� �� ��ǰ ���� ���� (p.238)
************************************************************/

-- Ư�� ��ǰ�� �Բ� ���� ���� ������ ��ǰ Ȯ�� 
-- ���� : Ư�� ��ǰ(stockcode='20725')�� �Բ� ���� ���� ������ TOP 10�� ���� Ȯ��
-- ��� �÷� : stockcode, description, qty 
-- HINT : INNER JOIN
-- Ȱ���Լ� : SUM()

SELECT TOP 10
	s.stockcode
	, CONVERT(VARCHAR(255), s.description)
	, SUM (quantity) AS qty
FROM sales s
INNER
JOIN (
	SELECT DISTINCT invoiceno
	FROM sales
	WHERE stockcode = '20725'
) i
ON s.InvoiceNo = i.InvoiceNo
WHERE s.StockCode <> '20725' 
;


/***********************************************************
�� �� ��ǰ ���� ���� (p.244)
************************************************************/

-- �籸�� ���� ���� Ȯ��
-- ��� 1 : ������ ������ �� ���� ���
-- ���� : ���θ��� �籸�� ���� Ȯ�� 
-- ��� �÷� : repurchaser_count
-- HINT : �ζ��� ��
-- Ȱ�� �Լ� : COUNT()




-- ��� 2 : ������ ������ �ϼ��� ������ �ű�� ���
-- ���� : ���θ��� �籸�� ���� Ȯ�� 
-- ��� �÷� : repurchaser_count
-- HINT : �ζ��� ��
-- Ȱ�� �Լ� : COUNT(), DENSE_RANK() OVER(PARTITION BY...)


-- ���ټ� �� ��ȣƮ �м�
-- 2010�� ���� �̷��� �ִ� 2011�� ������ Ȯ�� 
SELECT COUNT(DISTINCT customerid) AS rentention_cnt
FROM sales
WHERE customerid <> ''
	AND customerid IN (
	SELECT DISTINCT customerid FROM sales 
	WHERE customerid <> ''
		AND YEAR(invoicedate) = '2010'
)
	AND YEAR(invoicedate) = '2011'
;

SELECT 
	customerid 
	, invoicedate 
	, DENSE_RANK() OVER(PARTITION BY customerid ORDER BY invoicedate) AS day_no 
FROM (
	SELECT customerid, invoicedate 
	FROM sales 
	WHERE customerid <> ''
	GROUP BY customerid, invoicedate
) a
;

-- ù ���ſ� �籸�� �Ⱓ�� ���� ���
-- DATEDIFF()

