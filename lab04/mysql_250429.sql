USE classicmodels;

-- 문제 1.
-- 일별 매출액 조회
-- orders, orderdetails
SELECT * FROM orders;
SELECT * FROM orderdetails;


SELECT
	A.orderDate
    , B. quantityOrdered * B.priceEach AS revenue
FROM orders A
LEFT
JOIN orderdetails B
ON A.orderNumber = B.orderNumber;

-- 최종적으로 하고자 하는 것
-- 국가별 매출 순위, DENSE_RANK()
-- windows 함수 + 인라인 뷰 서브쿼리
SELECT * FROM customers;

SELECT
	A.country
    , C.quantityOrdered * C.priceEach AS SALES
    , DENSE_RANK() OVER (PARTITION BY A.country) RNK
FROM customers A
LEFT
JOIN orders B
ON A.customerNumber = B.customerNumber
LEFT 
JOIN orderdetails C
ON B.orderNumber = C.orderNumber
;

---
SELECT 
    c.country 
    , SUM(od.quantityOrdered * od.priceEach) as revenue
    , DENSE_RANK() OVER (ORDER BY SUM(od.quantityOrdered * od.priceEach) DESC) AS RNK
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.country 
ORDER BY RNK LIMIT 5
;
---
SELECT *
FROM (
	SELECT
		c.country 
		, SUM(od.quantityOrdered * od.priceEach) as revenue
		, DENSE_RANK() OVER (ORDER BY SUM(od.quantityOrdered * od.priceEach) DESC) AS RNK
	FROM customers c
	LEFT JOIN orders o ON c.customerNumber = o.customerNumber
	LEFT JOIN orderdetails od ON o.orderNumber = od.orderNumber
	GROUP BY c.country 
)A
WHERE RNK <= 5
;

-- 비슷한 개념
-- 차량 모델 관련된 DB
-- 미국에서 가장 많이 팔리는 차량 모델 5개 구하기

SELECT
	p.productName
    , SUM(od.quantityOrdered * od.priceEach) as revenue
	, DENSE_RANK() OVER (ORDER BY SUM(od.quantityOrdered * od.priceEach) DESC) AS RNK
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber
LEFT JOIN customers c ON o.customerNumber = c.customerNumber
WHERE c.country = 'USA'
GROUP BY 1
ORDER BY RNK LIMIT 5
;

---

-- windows 함수
USE classicmodels;

CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);

SELECT * FROM sales;



SELECT * FROM sales;

-- LAG() 함수 기본 : 이전 행의 값 가져오기
SELECT
	sales_employee
    , fiscal_year
    , sale
    , LAG(sale) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS prev_year_sale
FROM sales
ORDER BY 1,2
;

-- LAG() 함수를 활용한 매출 증가율 계산
-- 각 직원별로 전년 대비 매출 증가율 계산
SELECT 
	sales_employee
    , fiscal_year
    , sale
    , LAG(sale) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS prev_year_sale
    , ROUND((sale - LAG(sale) OVER(PARTITION BY sales_employee 
    ORDER BY fiscal_year)) / LAG(sale) OVER(PARTITION BY sales_employee 
    ORDER BY fiscal_year) *100, 1) AS growth_pct
FROM sales
ORDER BY 1,2
;

-- 질문 : 증감율 (X)
-- 1년전, 2년전 매출과 비교하세요
SELECT
	sales_employee
    , fiscal_year
    , sale
    , LAG(sale, 1, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS prev_year_sale
    , LAG(sale, 2, 0) OVER(PARTITION BY sales_employee ORDER BY fiscal_year) AS two_years_ago_sale
    , sale - LAG(sale,2,0) OVER(PARTITION BY sales_employee 
    ORDER BY fiscal_year)  AS '2년전 매출 비교'
FROM sales
ORDER BY 1,2
;

-- 실전문제
-- 1. 각 주문의 현재 주문금액과 이전 주문금액의 차이를 계산하시오. 
-- 1. 각 주문의 현재 주문금액과 이전 주문금액의 차이를 계산
-- 1) orders와 orderdetails 테이블을 조인하여 주문별 총액을 계산하는 서브쿼리 작성
-- 2) LAG 함수를 사용하여 이전 주문 금액을 가져옴 (orderDate 기준)
-- 3) 현재 주문금액 - 이전 주문금액으로 차이 계산

SELECT
	od.orderNumber
    , o.orderDate
	, od.priceEach
    , LAG(od.priceEach, 1, 0) OVER(PARTITION BY od.orderNumber 
    ORDER BY o.orderDate) AS '이전 주문금액'
    , od.priceEach - LAG(od.priceEach, 1, 0) OVER(PARTITION BY od.orderNumber 
    ORDER BY o.orderDate) AS '금액 차이'
FROM orderdetails od
LEFT
JOIN orders o
ON od.orderNumber = o.orderNumber
;


-- 2. 각 고객별로 주문금액과 직전 주문금액을 비교하여 증감률을 계산하시오
-- 2. 각 고객별 주문금액과 직전 주문금액의 증감률 계산
-- 1) orders, orderdetails 테이블 조인하여 고객별, 주문일자별 총 주문금액 계산 (서브쿼리)
-- 2) LAG 함수로 각 고객별 이전 주문금액 가져오기 (PARTITION BY customerNumber)
-- 3) (현재주문금액 - 이전주문금액) / 이전주문금액 * 100 으로 증감률 계산
-- 4) ROUND 함수로 소수점 2자리까지 표시

-- 코드
SELECT
	o.customerNumber
    , o.orderDate
    , od.priceEach
    , LAG(od.priceEach) OVER(PARTITION BY o.customerNumber 
    ORDER BY o.customerNumber) AS '직전 주문금액'
    , ROUND((od.priceEach - LAG(od.priceEach) OVER(PARTITION BY o.customerNumber 
    ORDER BY o.customerNumber)) / LAG(od.priceEach) OVER(PARTITION BY o.customerNumber 
    ORDER BY o.customerNumber) * 100,2) AS '증감율'
FROM orderdetails od
LEFT
JOIN orders o
ON od.orderNumber = o.orderNumber
;




-- 3. 각 제품라인별로 3개월 이동평균 매출액을 계산하시오
-- 3. 각 제품라인별 3개월 이동평균 매출액 계산
-- 1) products, orderdetails, orders 테이블 조인하여 제품라인별, 월별 매출액 계산 (서브쿼리)
-- 2) DATE_FORMAT 함수로 orderDate를 월 단위로 그룹화
-- 3) AVG 함수와 OVER절을 사용하여 3개월 이동평균 계산
--    - PARTITION BY로 제품라인별 그룹화
--    - ROWS BETWEEN 2 PRECEDING AND CURRENT ROW로 현재행 포함 이전 2개 행까지의 평균 계산
-- 4) ROUND 함수로 소수점 2자리까지 표시

-- 코드
SELECT * 
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
LEFT JOIN orders o ON od.orderNumber = o.orderNumber
;

-- 답안

-- 1번
SELECT 
    orderNumber,
    orderDate,
    totalAmount,
    LAG(totalAmount) OVER (ORDER BY orderDate) as prev_amount,
    totalAmount - LAG(totalAmount) OVER (ORDER BY orderDate) as amount_difference
FROM (
    SELECT 
        o.orderNumber,
        o.orderDate,
        SUM(quantityOrdered * priceEach) as totalAmount
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY o.orderNumber, o.orderDate
) A
ORDER BY orderDate;

-- 2번
SELECT 
    customerNumber,
    orderDate,
    orderAmount,
    LAG(orderAmount) OVER (PARTITION BY customerNumber ORDER BY orderDate) as prev_amount,
    ROUND(((orderAmount - LAG(orderAmount) OVER (PARTITION BY customerNumber ORDER BY orderDate)) / 
    LAG(orderAmount) OVER (PARTITION BY customerNumber ORDER BY orderDate) * 100), 2) as growth_rate
FROM (
    SELECT 
        o.customerNumber,
        o.orderDate,
        SUM(quantityOrdered * priceEach) as orderAmount
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber
    GROUP BY o.customerNumber, o.orderDate
) A
ORDER BY customerNumber, orderDate;

-- 3번
SELECT 
    productLine,
    orderDate,
    monthly_sales,
    ROUND(AVG(monthly_sales) OVER (
        PARTITION BY productLine 
        ORDER BY orderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) as moving_average_3months
FROM (
    SELECT 
        p.productLine,
        DATE_FORMAT(o.orderDate, '%Y-%m-01') as orderDate,
        SUM(od.quantityOrdered * od.priceEach) as monthly_sales
    FROM products p
    JOIN orderdetails od ON p.productCode = od.productCode
    JOIN orders o ON od.orderNumber = o.orderNumber
    GROUP BY p.productLine, DATE_FORMAT(o.orderDate, '%Y-%m-01')
) A
ORDER BY productLine, orderDate;

-- 누적 합계
SELECT 
    o.orderNumber,
    o.orderDate,
    SUM(od.quantityOrdered * od.priceEach) as orderValue,
    SUM(SUM(od.quantityOrdered * od.priceEach)) OVER (
        ORDER BY o.orderDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as running_total
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.orderDate
ORDER BY o.orderDate
LIMIT 10
;







