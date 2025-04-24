-- HAVING절 
-- HAVING vs WHERE : 필터링
-- WHERE : 원본 데이터를 기준으로 필터링
-- HAVING : 그룹화 계산이 끝난 이후를 기준으로 필터링

SELECT * FROM sales_ch5 ;
SELECT 
	customer_id
	, SUM(sales_amount) AS 매출
FROM sales_ch5
GROUP BY customer_id 
HAVING SUM(sales_amount) > 20000
;

-- MS-SQL, Oracle 같은 경우 문법에 엄격한 편
-- MYSQL, postgreSQL

--ORDER BY절
-- DESC : 내림차순 
-- ASC, 디폴트 : 오름차순

SELECT 
	customer_id
	, SUM(sales_amount) AS 매출
FROM sales_ch5
GROUP BY customer_id 
ORDER BY 매출 ASC
;

-- DB가 데이터를 처리하는 순서
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELCET -> ORDER BY

-- 서브쿼리

SELECT * FROM product_info;
SELECT * FROM category_info;
SELECT * FROM event_info;


p.161
-- 제품 정보가 있는 product_info
-- 제품 카테고리가 있는 category_info
-- 이벤트 제품에 대한 정보 event_info

-- 서로 다른 테이블 -> 테이블 조인 (일반적인 방법)


SELECT 
	product_id
	, product_name
	, category_id
	, (SELECT category_name FROM category_info c WHERE c.category_id = p.category_id) AS '제품 카테고리'
FROM product_info p; --일반적으로 테이블 조인 테이블의 이름을 ALIAS 처리

-- JOIN문
SELECT 
    p.product_id,
    p.product_name,
    p.category_id,
    c.category_name AS '제품 카테고리'
FROM product_info p
JOIN category_info c ON p.category_id = c.category_id;

-- FROM절 서브쿼리
-- data1 = data.가공
-- data2 = data1.가공
-- SELECT FROM (SELECT FROM(SELECT FROM))


-- product_info 테이블, 카테고리별로 제품의 개수가 5개 이상인 카테고리만 출력
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

-- WHERE절 서브쿼리
-- 서브쿼리가 잘 하고 싶음 : 분활 후 합치기
-- 서브쿼리와 메인쿼리 분활해서 처리

-- product_info T, 가전 제품 카테고리만 출력


SELECT * FROM product_info WHERE category_id = (
	SELECT category_id FROM category_info WHERE category_name = '가전제품'
);

-- p168
-- product_info T, evant_id 컬럼의 e2에 포함된 제품의 정보만 출력
--메인쿼리
SELECT * FROM product_info;
SELECT * FROM event_info WHERE event_id = 'e2' ;

SELECT * FROM product_info WHERE product_id IN (
	SELECT product_id FROM event_info WHERE event_id = 'e2'
);


-- 테이블의 결합
-- LEFT JOIN, RIGHT JOIN, OUTER JOIN(FULL JOIN), INNER JOIN
-- LEFT OUTER JOIN, RIGHT OUTER JOIN
SELECT * FROM product_info
SELECT * FROM category_info

SELECT *
FROM product_info pi
LEFT
JOIN category_info ci ON pi.category_id = ci.category_id
;

-- UNION 연산자 : 테이블 아래로 붙이기
-- UNION(중복값 제거) vs UNION ALL (중복 값 제거 X)
SELECT * 
FROM sales_2023


-- 서브쿼리 추가 질문
USE Bikestores;


-- 테이블
SELECT * FROM sales.orders;
-- 문제 2017년에 가장 많은 주문을 처리한 직원이 처리한 모든 주문 조회
-- 1. 모든 주문 정보 표시
-- 2. WHERE 서브쿼리 사용해서 2017년 최다 주문 처리 직원 찾기
-- 3. TOP1 과 GROUPBY 사용
-- 4. 활용함수 : YEAR, COUNT(*)
SELECT *
FROM sales.orders
WHERE staff_id = (
	SELECT TOP 1 staff_id
	FROM sales.orders 
	WHERE YEAR(order_date) = 2017
	GROUP BY staff_id
	ORDER BY count(*) DESC
);


-- 테이블 2개
SELECT * FROM production.products;
SELECT * FROM sales.order_items;

SELECT * 
FROM production.products
WHERE product_id NOT IN  (
SELECT DISTINCT product_id
FROM sales.order_items
);
