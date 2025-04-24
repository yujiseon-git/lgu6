-- 교재 WHERE 절
-- 조건과 일치하는 데이터 조회 (필터링)
-- pandas, iloc,loc, 비교연산자 등 같이 상기
-- P.94
USE lily_book;
SELECT 
	*
FROM customer
WHERE customer_id = 'c002'
;

-- 문법에 주의 ''작은 따옴표만 가능
-- WHERE절 안에서 비교연산자 통해서 필터링
-- <> != : 좌우가 서로 같지 않음
SELECT * 
FROM sales 
WHERE sales_amount > 0
;

-- 근사값 입력하기
SELECT * 
FROM sales 
WHERE sales_amount = 40000
;

-- 데이터가 아예 없을 때도, NULL 형태로 출력
-- 조회를 할 떄, 정확하게 입력하지 않아도 NULL 형태로 출력

-- P100 BETWEEN 연산자 자주 쓰임
SELECT * 
FROM sales
WHERE sales_amount BETWEEN 35000 AND 40000
;

-- IN 연산자 매우매우 자주 사용됨
-- OR 연산자 반복해서 쓰기 싫어서 IN 사용함
SELECT * FROM sales WHERE product_name IN ('신발', '책')

-- Like 연산자 p.103
USE Bikestores;
-- lastname이 letter z로 시작하는 모든 행을 필터링
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

-- IS NULL 연산자 (중요)
-- 데이터가 NULL값인 행만 필터링
SELECT *
FROM sales.customers
WHERE phone IS NULL 
;

--p.109
-- AND 연산자 / OR 연산자
USE lily_book;
SELECT * FROM distribution_center
WHERE permission_date > '2022-05-01'
	AND permission_date < '2022-07-31'
;

-- OR 연산자
-- LIKE 연산자와 같이 응용한 쿼리
SELECT * FROM distribution_center
WHERE address LIKE '경기도 용인시%'
	OR address LIKE '서울시%'
;

-- 연산자 우선 순위 : () > AND > ORL

-- 부정연산자
-- IN, NOT IN 같이 공부
-- IS NULL, IS NOT NULL 
SELECT *
FROM distribution_center
WHERE center_no NOT IN(1,2);

-- GROUP BY
SELECT 날짜, SUM(수량) AS 수량
FROM sales
GROUP BY 날짜
;

SELECT *
FROM sales
;

SELECT 날짜, 제품명, SUM(수량) AS 수량, SUM(금액) AS 금액
FROM sales
GROUP BY 날짜, 제품명
;

-- (p.131)

USE lily_book;
SELECT * FROM distribution_center;

SELECT MONTH(permission_date) AS 달
FROM distribution_center
GROUP BY MONTH(permission_date)
;