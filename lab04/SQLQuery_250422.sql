-- 현재 데이터 베이스 확인
SELECT DB_NAME(); 

-- 데이터베이스 > table (pandas 데이터프레임)
-- 데이터베이스안에 있는 것
---- 테이블 외에도, view, 프로시저, 트리거, 사용자 정의 함수 등 포함
-- SQL, SQEL : E - English
-- 문법이 영어 문법과 매우 흡사함
-- 표준 SQL, 99% 비슷, 1% 다름 ==> 데이터타입할 때 차이가 좀 있음(DB 종류마다)


-- 데이터 확인
USE lily_book
SELECT * FROM staff;
SELECT * FROM lily_book.dbo.staff;


USE Bikestores;
SELECT * FROM production.brands;

-- 데이터분석의 모든 것
-- SELECL, FROM
-- FROM A pandas dataframe SELECT column
-- P.42 SELECT절과 FROM절
USE lily_book;
SELECT 
	employee_id
	, employee_name
	, birth_date 
FROM staff
; -- 해당 쿼리 코드 작성 완료

SELECT * FROM staff;
SELECT employee_name, employee_id FROM staff; --조회 시 컬럼 순서 분경 가능

-- 컬럼 별칭
-- 컬럼명 지정 시 영어 약어로 지정 ==> 데이터 정의서 관리
-- ALIAS (AS)

SELECT employee_id, birth_date
FROM staff
;

SELECT employee_id, birth_date AS "생년 월일"
FROM staff
;

-- DISTINCT 중복값 제거
SELECT gender FROM staff;

SELECT DISTINCT gender FROM staff;


SELECT employee_name, gender, position FROM staff;
SELECT DISTINCT position, employee_name, gender FROM staff;
-- 하나의 컬럼이 고유의 값을 지니면 DISTINCT 사용 불가능함 전체 데이터가 조회됨

-- 문자열 함수 : 다른 DBMS와 문법 유사
SELECT * FROM apparel_product_info;

-- LEFT 함수 확인
SELECT product_id, LEFT(product_id, 2) AS 약어
FROM apparel_product_info;

-- SUBSTRING 문자열 중간 N번째 자리부터 N개만 출력
-- SUBSTRING(컬럼명, 숫자(N start), 숫자(N end))
-- 파이썬, 다른 프로그래밍 언어는 인덱스가 0번째부터 시작 MS-SQL은 1번쨰부터
SELECT product_id, SUBSTRING(product_id, 6, 2) AS 약어
FROM apparel_product_info;

--CONCCAT 문자열과 문자열 이어서 출력
SELECT CONCAT(category1, '>', category2, '=', '옷', price) AS 테스트
FROM apparel_product_info;

-- REPLACE : 문자열에서 특정 문자 변경
-- p58
SELECT product_id, REPLACE(product_id, 'F', 'A') AS 결과
FROM apparel_product_info;


-- ISNULL 중요함
-- WHERE절과 함께 쓰일 때 자주 활용되는 방법
-- 데이터상에 결측치가 존재 할때 꼭, 필요한 함수
SELECT *
FROM apparel_product_info
;


-- 숫자함수 : ABS, CEILING, FLOOR, ROUND, POWER, SQRT
SELECT ROUND (CAST(748.58 AS DECIMAL(6,2)), -3);


-- CEILING: 특정 숫자를 올림 처리
SELECT * FROM sales;
SELECT 
	sales_amount_usd
	, CEILING(sales_amount_usd) AS 결과
FROM sales;

-- 날짜함수 : 공식문서, 무조건 참조
-- GETDATE : 공식문서 참조
-- DATEADD : 공식문서 참조
-- DATEDIFF : p255 재구매율 구할 때 꼭 쓴다.
SELECT
	order_date
	, DATEADD(YEAR, -1, order_date) AS 결과1
	, DATEADD(YEAR, +2, order_date) AS 결과2
	, DATEADD(DAY, +2, order_date) AS 결과2
FROM sales
;

-- DATEDIFF (p72)
SELECT
	order_date
	, DATEDIFF(MONTH, order_date, '2025-04-22') 함수적용결과1
	, DATEDIFF(DAY, order_date, '2025-04-22') 함수적용결과1
FROM sales

SELECT DATEDIFF(DAY, '2023-06-30', '2025-05-30');

-- 순위함수 (p74) == 윈도우 함수 ==> 살짝 난해함
-- RANK : 
SELECT * FROM student_math_score;
SELECT
	학생
	, 수학점수
	, RANK() OVER(ORDER BY 수학점수 DESC) AS rank등수
	, DENSE_RANK() OVER(ORDER BY 수학점수 DESC) AS dense_rank등수
	, ROW_NUMBER() OVER(ORDER BY 수학점수 DESC) AS row_number등수
FROM student_math_score
;

-- PARTITION BY
-- OVER (ORDER BY) : 전체 중에서 몇 등
-- OVER(PARTITION BY class ORDER BY) : 반 별로 나눴을 때 반에서 몇 등?

SELECT
	학생
	, Class
	, 수학점수
	, DENSE_RANK() OVER(ORDER BY 수학점수 DESC) AS 전교등수
	, DENSE_RANK() OVER(PARTITION BY Class 
						ORDER BY 수학점수 DESC) AS 반등수
FROM student_math_score
;

-- CASE문, 조건문 (IF문 대신 사용 X)
-- SELECT문 작성 시, 조회용
-- PL/SQL 쓸경우에는, IF문 사용 가능

-- 값이 0보다 작다면 '환불거래', 0보다 크다면 '정상거래'로 분류
SELECT 
	sales_amount
	, CASE WHEN sales_amount < 0 THEN '환불거래'
           WHEN sales_amount > 0 THEN '정상거래'
	END AS 적용결과
FROM sales
;

-- 집계함수



-- 실습
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
	CASE WHEN 2025-YEAR(date_of_birth) BETWEEN 20 AND 29 THEN '20대'
	     WHEN 2025-YEAR(date_of_birth) BETWEEN 30 AND 39 THEN '30대'
		 WHEN 2025-YEAR(date_of_birth) BETWEEN 40 AND 49 THEN '40대'
		 END AS ageband
FROM customer
;

SELECT
	customer_id
	, CONCAT (last_name, first_name) AS fullname
	, ISNULL (phone_number,email) AS contact_info
	, 2025- YEAR(date_of_birth) AS age
	, CASE WHEN 2025- YEAR(date_of_birth) BETWEEN 20 AND 29 THEN '20대'
	       WHEN 2025-YEAR(date_of_birth) BETWEEN 30 AND 39 THEN '30대'
		   WHEN 2025-YEAR(date_of_birth) BETWEEN 40 AND 49 THEN '40대'
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











