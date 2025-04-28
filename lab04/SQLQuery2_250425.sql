-- Chapter 9장 
-- 실습 데이터 소개 
USE lily_book_test;

-- 테이블 확인 
SELECT * FROM sales;
SELECT * FROM customer;

-- 테이블 기본정보 확인하는 명령어
EXEC sp_help 'sales';

/***********************************************************
■ 매출 트렌드 (p.203)
************************************************************/

-- 기간별 매출 현황
-- 트렌드 : 시계열 분석과 연관
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT
	CONVERT (DATE,invoicedate) AS invoicedate
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, SUM(quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY CONVERT (DATE,invoicedate)
ORDER BY invoicedate
;

-- 국가별 매출 현황
-- 출력 컬럼 : country, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT 
	country
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, SUM(quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY country
ORDER BY 1
;

-- 국가별 x 제품별 매출 현황 
-- 출력 컬럼 : country, stockcode, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
SELECT 
	country
	, stockcode
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, SUM(quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
GROUP BY country , stockcode
ORDER BY 1, 2                  -- 숫자는 컬럼 인덱스 번호
;

-- 특정 제품 매출 현황
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615
SELECT 
	ROUND(SUM(unitprice*quantity), 2) AS 매출액
	, SUM(quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
WHERE stockcode = '21615'
;

-- 특정 제품의 기간별 매출 현황 
-- 출력 컬럼 : invoicedate, 매출액, 주문수량, 주문건수, 주문고객수
-- 활용 함수 : SUM(), COUNT()
-- 코드명 : 21615, 21731
SELECT
	CONVERT (DATE,invoicedate) AS invoicedate
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, SUM(quantity) AS 주문수량
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
WHERE stockcode IN ('21615','21731')
GROUP BY CONVERT (DATE,invoicedate)
ORDER BY invoicedate

/***********************************************************
■ 이벤트 효과 분석 (p.213)
************************************************************/

-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 약 15일동안 진행한 이벤트의 매출 확인 
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)
SELECT 
    CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '비교기간'
    END AS 기간구분
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
WHERE invoicedate BETWEEN '2011-09-10' AND '2011-09-25' 
	OR invoicedate BETWEEN '2011-08-10' AND '2011-08-25'
GROUP BY CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '비교기간'
    END
;

-- 이벤트 효과 분석 (시기에 대한 비교)
-- 2011년 9/10 ~ 2011년 9/25까지 특정 제품에 실시한 이벤트에 대해 매출 확인
-- 출력 컬럼 : 기간 구분, 매출액, 주문수량, 주문건수, 주문고객수 
-- 활용 함수 : CASE WHEN, SUM(), COUNT()
-- 기간 구분 컬럼의 범주 구분 : 이벤트 기간, 이벤트 비교기간(전월동기간)
-- 제품군 : 17012A, 17012C, 17084N
SELECT 
    CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간'
    END AS 기간구분
	, ROUND (SUM(unitprice*quantity),2) AS 매출액
	, COUNT (DISTINCT Invoiceno) AS 주문건수
	, COUNT (DISTINCT CustomerID) AS 주문고객수
FROM sales
WHERE (CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' 
	OR CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25')
	AND StockCode in ('17012A', '17012C', '17084N')
GROUP BY CASE 
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-09-10' AND '2011-09-25' THEN '이벤트 기간'
        WHEN CONVERT(DATE, invoicedate) BETWEEN '2011-08-10' AND '2011-08-25' THEN '이벤트 비교기간'
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

-- 조인을 할때는, 기본키는 외래키가 항상 존재
-- 기준이 되는 테이블의 기본키는 중복값이 무조건 없어야 함
-- SALES 데이터의 customerid 중복값을 모두 제거해서 마치 기본키가 존재하는 테이블 형태로 변형
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
		mem_no AS '고객 ID'
		, CONCAT(last_name, first_name) AS 이름 
		, gd AS 성별
		, birth_dt AS 생년원일
		, entr_dt AS '가입 일자'
		, grade AS 등급
		, sign_up_ch AS '가입 채널'
	FROM customer
) c
ON s.customerid = c.[고객 ID]
;

-- 미구매 고객 정보 확인
-- 문제 : 전체 멤버십 가입 고객 중에서 구매 이력이 없는 고객과 구매 이력이 있는 고객 정보 구분 
-- 출력 컬럼 : non_purchaser, mem_no, last_name, first_name, invoiceno, stockcode, invoicedate, unitprice, customerid
-- HINT : LEFT JOIN
-- 활용함수 : CASE WHEN, IS NULL, 

-- CUSTOMER LEFT JOIN SALES


-- 전체 고객수와 미구매 고객수 계산 
-- 출력 컬럼 : non_purchaser, total_customer
-- HINT : LEFT JOIN
-- 활용 함수 : COUNT(), IS NULL

-- 힌트
SELECT 
	c.*
    , s.*
FROM customer c
LEFT JOIN sales s ON c.mem_no =s.Customerid
;

/***********************************************************
■ 고객 상품 구매 패턴 (p.227)
************************************************************/

-- 매출 평균 지표 활용하기 
-- 매출 평균지표 종류 : ATV, AMV, Avg.Frq, Avg.Units
-- 문제 : sales 데이터의 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT()

-- 문제 : 문제 : 연도 및 월별 매출 평균지표, ATV, AMV, Avg.Frq, Avg.Units 알고 싶음
-- 출력 컬럼 : 연도, 월, 매출액, 주문수량, 주문건수, 주문고객수, ATV, AMV, Avg.Frq, Avg.Units
-- 활용함수 : SUM(), COUNT(), YEAR, MONTH

/***********************************************************
■ 고객 상품 구매 패턴 (p.230)
************************************************************/

-- 특정 연도 베스트셀링 상품 확인
-- 문제 : 2011년에 가장 많이 판매된 제품 TOP 10의 정보 확인 
-- 출력 컬럼 : stockcode, description, qty
-- 활용함수 : TOP 10, SUM(), YEAR()


... (72줄 남음)