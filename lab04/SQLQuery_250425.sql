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


-- Chapter 9장 
-- 실습 데이터 소개 
USE lily_book_test;

-- 테이블 확인 
SELECT * FROM sales;
SELECT * FROM customer;

/***********************************************************
■ 매출 트렌드 (p.203)
************************************************************/

-- 기간별 매출 현황
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT
	invoicedate
	, SUM (unitprice * quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY invoicedate
ORDER BY invoicedate 
;
-- 국가별 매출 현황
-- 출력 컬럼 : country, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT
	country
	, SUM (unitprice * quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY country
ORDER BY country
;

-- 국가별 x 제품별 매출 현황 
-- 출력 컬럼 : country, stockcode, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT
	country
	, StockCode
	, SUM (unitprice * quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY country
	, StockCode
;

-- 특정 제품 매출 현황
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615
SELECT 
	SUM (UnitPrice * Quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT invoiceno) AS 주문건수
	, COUNT (DISTINCT customerid) AS 주문고객수
FROM sales
WHERE StockCode = '21615'
;

-- 특정 제품의 기간별 매출 현황 
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615, 21731
SELECT
	invoicedate
	, SUM (UnitPrice * Quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT invoiceno) AS 주문건수
	, COUNT (DISTINCT customerid) AS 주문고객수
FROM sales
WHERE StockCode in ('21615','21731')
GROUP BY InvoiceDate
ORDER BY InvoiceDate
;

/***********************************************************
■ 이벤트 효과 분석 (p.213)
************************************************************/

-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 약 15일동안 진행한 이벤트의 매출 확인 
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)
SELECT CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '이번트 기간'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간(전월동기간)'
	END AS '기간 구분'
	, SUM (UnitPrice * Quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT invoiceno) AS 주문건수
	, COUNT (DISTINCT customerid) AS 주문고객수
FROM sales
WHERE invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25'
GROUP BY CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '이번트 기간'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간(전월동기간)'
	END
;
-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 특정 제품에 실시한 이벤트에 대해 매출 확인
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)
-- 제품군 : 17012A, 17012C, 17084N
SELECT CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '이번트 기간'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간(전월동기간)'
	END AS '기간 구분'
	, SUM (UnitPrice * Quantity) AS 매출액
	, SUM (quantity) AS 주문수량
	, COUNT (DISTINCT invoiceno) AS 주문건수
	, COUNT (DISTINCT customerid) AS 주문고객수
FROM sales
WHERE StockCode in ('17012A', '17012C', '17084N')
	AND (invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25')
GROUP BY CASE 
	WHEN  invoicedate BETWEEN '2011-09-10' AND '2011-09-25' THEN '이번트 기간'
	WHEN  invoicedate BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간(전월동기간)'
	END
;

/***********************************************************
■ CRM 고객 타깃 출력 (p.217)
************************************************************/

-- 특정 제품 구매 고객 정보
-- 문제 : 2010.12.1 - 2010.12.10일까지 특정 제품 구매한 고객 정보 출력
-- 출력 컬럼 : 고객 ID, 이름, 성별, 생년월일, 가입 일자, 등급, 가입 채널
-- HINT : 인라인 뷰 서브쿼리, LEFT JOIN 활용
-- 활용함수 : CONCAT()
-- 코드명 : 21730, 21615
SELECT * FROM customer
SELECT * FROM sales

SELECT
	mem_no AS '고객 ID'
	, CONCAT(last_name, first_name) AS 이름 
	, gd AS 성별
	, birth_dt AS 생년원일
	, entr_dt AS '가입 일자'
	, grade AS 등급
	, sign_up_ch AS '가입 채널'
FROM customer
WHERE mem_no IN (
	SELECT DISTINCT customerid 
	FROM sales 
	WHERE stockcode IN ('21730', '21615') 
	AND CONVERT(DATE, invoicedate) BETWEEN '2010-12-01' AND '2010-12-10'
);

-- 미구매 고객 정보 확인
-- 문제 : 전체 멤버십 가입 고객 중에서 구매 이력이 없는 고객과 구매 이력이 있는 고객 정보 구분 
-- 출력 컬럼 : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- 활용함수 : CASE WHEN, IS NULL, 
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

-- 전체 고객수와 미구매 고객수 계산 
-- 출력 컬럼 : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- 활용 함수 : COUNT(), IS NULL
SELECT
	COUNT (DISTINCT CASE WHEN s.CustomerID IS NULL THEN c.mem_no END) AS non_purchaser
	, COUNT (DISTINCT mem_no) AS total_customer
FROM customer c
LEFT JOIN sales s
	ON c.mem_no = s.CustomerID
;
/***********************************************************
■ 고객 상품 구매 패턴 (p.227)
************************************************************/

-- 매출 평균 지표 활용하기 
-- 매출 평균지표 종류 : ATV, AMV, Avg.Frq, Avg.Units
-- 문제 : sales 데이터의 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT()

SELECT 
	ROUND (SUM(unitprice * Quantity) / count(DISTINCT Invoiceno), 2) AS ATV --주문건수
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT customerid), 2) AS AMV --주문고객수
	, COUNT (DISTINCT Invoiceno) * 1.00 / COUNT (DISTINCT customerid) * 1.00 AS Avgfrq

FROM sales
;


-- 문제 : 문제 : 연도 및 월별 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 연도, 월, 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT(), YEAR, MONTH
SELECT
	YEAR(invoicedate) AS 연도
	, MONTH (invoicedate) AS 월
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT Invoiceno), 2) AS ATV --주문건수
	, ROUND (SUM(unitprice * Quantity) / count(DISTINCT customerid), 2) AS AMV --주문고객수
	, COUNT (DISTINCT Invoiceno) * 1.00 / COUNT (DISTINCT customerid) * 1.00 AS Avgfrq
FROM sales
GROUP BY YEAR(invoicedate)
,MONTH (invoicedate)
ORDER BY 1, 2
;

/***********************************************************
■ 고객 상품 구매 패턴 (p.230)
************************************************************/

-- 특정 연도 베스트셀링 상품 확인
-- 문제 : 2011년에 가장 많이 판매된 제품 TOP 10의 정보 확인 
-- 출력 컬럼 : stockcode, description, qty
-- 활용함수 : TOP 10, SUM(), YEAR()

-- SELECT FROM GROUP BY 연도별로 판매개수 ==> A1
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

-- 국가별 베스트셀링 상품 확인
-- 문제 : 국가별로 가장 많이 판매된 제품 순으로 실적을 구하고 싶음
-- 출력 컬럼 : RNK, country, stockcode, description, qty
-- HINT : 인라인 뷰 서브쿼리
-- 활용함수 : ROW_NUMBER() OVER(PARTITION BY...), SUM()
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


-- 20대 여성 고객의 베스트셀링 상품 확인 
-- 문제 : 20대 여성 고객이 가장 많이 구매한 TOP 10의 정보 확인 
-- 출력 컬럼 : RNK, country, stockcode, description, qty
-- HINT : 인라인 뷰 서브쿼리, 인라인 뷰 서브쿼리 작성 시, LEFT JOIN 필요
-- 활용함수 : ROW_NUMBER() OVER(PARTITION BY...), SUM(), YEAR()


-- 별로 안좋은 코드
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
■ 고객 상품 구매 패턴 (p.238)
************************************************************/

-- 특정 제품과 함께 가장 많이 구매한 제품 확인 
-- 문제 : 특정 제품(stockcode='20725')과 함께 가장 많이 구매한 TOP 10의 정보 확인
-- 출력 컬럼 : stockcode, description, qty 
-- HINT : INNER JOIN
-- 활용함수 : SUM()

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
■ 고객 상품 구매 패턴 (p.244)
************************************************************/

-- 재구매 고객의 비율 확인
-- 방법 1 : 고객별로 구매일 수 세는 방법
-- 문제 : 쇼핑몰의 재구매 고객수 확인 
-- 출력 컬럼 : repurchaser_count
-- HINT : 인라인 뷰
-- 활용 함수 : COUNT()




-- 방법 2 : 고객별로 구매한 일수에 순서를 매기는 방법
-- 문제 : 쇼핑몰의 재구매 고객수 확인 
-- 출력 컬럼 : repurchaser_count
-- HINT : 인라인 뷰
-- 활용 함수 : COUNT(), DENSE_RANK() OVER(PARTITION BY...)


-- 리텐션 및 코호트 분석
-- 2010년 구매 이력이 있는 2011년 유지율 확인 
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

-- 첫 구매와 재구매 기간의 차이 계산
-- DATEDIFF()

