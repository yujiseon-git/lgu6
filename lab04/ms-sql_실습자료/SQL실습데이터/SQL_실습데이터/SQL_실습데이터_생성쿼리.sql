
-- ���̺� ����

/***********************************************************
�� ������ 3.1.1
�� staff : �������� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE staff
(
  employee_id    VARCHAR(10),
  employee_name  VARCHAR(10),
  gender		 VARCHAR(10),
  birth_date	 DATE,
  department_id  VARCHAR(10),
  position		 VARCHAR(10)
)

INSERT INTO staff VALUES('A001','������','F','1988-02-03','HR��','����')
INSERT INTO staff VALUES('A002','��ö��','M','1995-10-23','HR��','���')
INSERT INTO staff VALUES('B003','��̳�','F','1997-11-08','��������','�븮')
INSERT INTO staff VALUES('B004','�Ž¹�','M','2000-03-03','��������','���')

-- SELECT  * FROM staff



/***********************************************************
�� ������ 3.3.1
�� apparel_product_info : �Ƿ� ��ǰ�� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE apparel_product_info
(
  product_id    VARCHAR(10),
  category1		VARCHAR(10),
  category2		VARCHAR(10),
  product_name	VARCHAR(30),
  price			INT
)

INSERT INTO apparel_product_info VALUES('JK_23FW_01','�ƿ���','��Ŷ','�� Ʈ���� ��Ŷ',80000)
INSERT INTO apparel_product_info VALUES('JK_23FW_02','�ƿ���','��Ŷ','�층�� �� ��Ŷ',100000)
INSERT INTO apparel_product_info VALUES('CD_23FW_03','�ƿ���','ī���','ĳ�ù̾� ī���',40000)
INSERT INTO apparel_product_info VALUES('BL_22SS_04','����','���콺','��Ʈ������ ���콺',35000)
INSERT INTO apparel_product_info VALUES('SK_22SS_05','����','ġ��','�÷��� ��ĿƮ',40000)

-- SELECT  * FROM apparel_product_info



/***********************************************************
�� ������ 3.4.1
�� sales : ���⿡ ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE sales
(
  order_date		DATE,
  refund_date		DATE,
  product_name	    VARCHAR(10),
  sales_amount		INT,
  sales_amount_usd  DECIMAL(38,2)
)

INSERT INTO sales VALUES('2023-01-01',NULL,'�Ź�',80000,60.38)
INSERT INTO sales VALUES(NULL,'2023-01-02','�Ź�',-80000,-60.38)
INSERT INTO sales VALUES('2023-02-10',NULL,'å',40000,30.19)
INSERT INTO sales VALUES('2023-02-10',NULL,'ī���',35000,26.42)
INSERT INTO sales VALUES('2023-03-31',NULL,'�Ź�',40000,30.19)

-- SELECT  * FROM sales



/***********************************************************
�� ������ 3.5.1
�� student_math_score : �л��� ���������� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE student_math_score
(
  �л�		VARCHAR(5),
  class		VARCHAR(5),
  ��������	INT
)

INSERT INTO student_math_score VALUES('A','1��',100)
INSERT INTO student_math_score VALUES('B','1��',90)
INSERT INTO student_math_score VALUES('C','1��',90)
INSERT INTO student_math_score VALUES('D','2��',80)
INSERT INTO student_math_score VALUES('E','2��',65)

-- SELECT  * FROM student_math_score



/***********************************************************
�� �ǽ� ������ (1)
�� customer : ���� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE customer
(
  customer_id		VARCHAR(5),
  last_name			VARCHAR(5),
  first_name		VARCHAR(5),
  phone_number		VARCHAR(20),
  email				VARCHAR(20),
  date_of_birth		DATE
)

INSERT INTO customer VALUES('c001','��','�μ�','010-1234-5678',NULL,'2000-10-01')
INSERT INTO customer VALUES('c002','��','����','010-3333-3333','abc@ab.com','1998-10-20')
INSERT INTO customer VALUES('c003','��','����','010-9876-0001','ddd@cc.com','1997-03-03')
INSERT INTO customer VALUES('c004','��','�α�',NULL,'aaa@ab.com','1993-07-20')
INSERT INTO customer VALUES('c005','��','�漷',NULL,NULL,'1980-04-30')

-- SELECT  * FROM customer



/***********************************************************
�� ������ 4.2.1
�� customer : ���� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

-- DROP TABLE customer

CREATE TABLE customer
(
  customer_id	VARCHAR(10),
  name			VARCHAR(10),
  gender		VARCHAR(10)
)

INSERT INTO customer VALUES('18466','���ϼ�','M')
INSERT INTO customer VALUES('18798','��ȣ��','F')
INSERT INTO customer VALUES('18434','Ȳ����','F')
INSERT INTO customer VALUES('18772','ȫ���','F')
INSERT INTO customer VALUES('18326','������','M')
INSERT INTO customer VALUES('18743','ȫ�̼�','M')
INSERT INTO customer VALUES('18785','������','M')

-- SELECT  * FROM customer



/***********************************************************
�� ������ 4.3.1
�� distribution_center : �������Ϳ� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE distribution_center
(
  center_no				VARCHAR(5),
  status				VARCHAR(10),
  permission_date		DATE,
  facility_equipment	VARCHAR(50),
  address				VARCHAR(100)
)

INSERT INTO distribution_center VALUES('1','������','2022-07-04','ȭ���ڵ���','��⵵ ��õ�� ����� ����� 123')
INSERT INTO distribution_center VALUES('2','������','2021-06-10','������,ȭ���ڵ���','��⵵ ���ν� ���ﱸ �𵿷� 987-2')
INSERT INTO distribution_center VALUES('3','������','2022-05-26','�׿��׽���,������','����� �߱� ���Ϸ� 555')
INSERT INTO distribution_center VALUES('4','��������','2022-07-07',NULL,'��⵵ ���ֽ� ��Ÿ� ��ŷ� 6-1')
INSERT INTO distribution_center VALUES('5','��������','2021-02-02',NULL,'��⵵ ���ν� ������ �հ�� 29')

-- SELECT  * FROM distribution_center



/***********************************************************
�� ������ 5.1.1
�� sales : ���⿡ ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

-- DROP TABLE sales

CREATE TABLE sales
(
  ��¥		VARCHAR(10),
  ��ǰ��	VARCHAR(10),
  ����		INT,
  �ݾ�		INT
)

INSERT INTO sales VALUES('01��01��','���콺',1,1000)
INSERT INTO sales VALUES('01��01��','���콺',2,2000)
INSERT INTO sales VALUES('01��01��','Ű����',1,10000)
INSERT INTO sales VALUES('03��01��','Ű����',1,10000)

-- SELECT  * FROM sales



/***********************************************************
�� ������ 5.2.1
�� customer_ch5 : ���� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE customer_ch5
(
  customer_id			VARCHAR(5),
  enter_date			DATE,
  first_order_date		DATE,
  cumulative_amount		INT
)

INSERT INTO customer_ch5 VALUES('001','2022-03-10','2022-03-10',10000)
INSERT INTO customer_ch5 VALUES('002','2023-02-15','2023-02-15',50000)
INSERT INTO customer_ch5 VALUES('003','2023-02-15',NULL,NULL)

-- SELECT  * FROM customer_ch5



/***********************************************************
�� ������ 5.2.2
�� sales_ch5 : �� ���⿡ ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE sales_ch5
(
  order_id		VARCHAR(5),
  order_date	DATE,
  city			VARCHAR(5),
  customer_id	VARCHAR(5),
  sales_amount	INT
)

INSERT INTO sales_ch5 VALUES('1','2023-01-01','����','a001',5000)
INSERT INTO sales_ch5 VALUES('2','2023-04-30','����','a001',10000)
INSERT INTO sales_ch5 VALUES('3','2023-05-10','�λ�','a001',10000)
INSERT INTO sales_ch5 VALUES('4','2023-05-10','�λ�','a002',5000)
INSERT INTO sales_ch5 VALUES('5','2023-06-30','�λ�','a003',5000)

-- SELECT  * FROM sales_ch5



/***********************************************************
�� �ǽ� ������ (2)
�� grocery_sales : �ķ�ǰ �Ǹſ� ���� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE grocery_sales
(
  order_id		 VARCHAR(5),
  order_date	 DATE,
  sales_channel	 VARCHAR(10),
  category_name	 VARCHAR(10),
  product_name   VARCHAR(20),
  sales_amount	 INT,
  sales_quantity INT
)

INSERT INTO grocery_sales VALUES (1,'2023-01-10','�ڻ��','���','�ſ�����','1000','1')
INSERT INTO grocery_sales VALUES (2,'2023-01-10','�ڻ��','���','�ſ�����','2000','2')
INSERT INTO grocery_sales VALUES (3,'2023-02-15','���¸���','���','¥����','3000','2')
INSERT INTO grocery_sales VALUES (3,'2023-02-15','���¸���','����','���ڰ���','3000','1')
INSERT INTO grocery_sales VALUES (3,'2023-02-15','���¸���','����','�������','4000','2')
INSERT INTO grocery_sales VALUES (4,'2023-02-22','���¸���','����','���ڰ���','9000','3')
INSERT INTO grocery_sales VALUES (5,'2023-02-22','������','����','���ڰ���','12000','4')
INSERT INTO grocery_sales VALUES (6,'2023-03-20','��������','����','�Ƹ޸�ī��','3000','3')

-- SELECT  * FROM grocery_sales



/***********************************************************
�� ������ 6.1.1
�� employee_info : ������ ������ ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE employee_info
(
  employee_id	VARCHAR(5),
  employee_name	VARCHAR(10),
  join_date		DATE,
  salary		INT
)

INSERT INTO employee_info VALUES ('a001','�̹α�','2020-10-03',5000)
INSERT INTO employee_info VALUES ('a002','����ȣ','2015-02-02',6000)
INSERT INTO employee_info VALUES ('a003','��̳�','2016-12-31',7500)
INSERT INTO employee_info VALUES ('a004','���ֿ�','2012-05-20',8000)
INSERT INTO employee_info VALUES ('a005','�δ���','2012-05-26',8000)

-- SELECT  * FROM employee_info



/***********************************************************
�� ������ 7.2.1
�� product_info : ��ǰ�� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE product_info
(
  product_id		VARCHAR(4) ,
  product_name		VARCHAR(100),
  category_id		VARCHAR(3),
  price				INT,
  display_status	VARCHAR(10),
  register_date		DATE
)
INSERT INTO product_info VALUES ('p001','A��Ʈ�� 14inch','c01',1500000,'������','2022-10-02')
INSERT INTO product_info VALUES ('p002','B��Ʈ�� 16inch','c01',2000000,'��������','2022-11-30')
INSERT INTO product_info VALUES ('p003','C��Ʈ�� 16inch','c01',3000000,'������','2023-03-11')
INSERT INTO product_info VALUES ('p004','D��Ź��','c01',1500000,'������','2021-08-08')
INSERT INTO product_info VALUES ('p005','E������','c01',1800000,'������','2022-08-09')
INSERT INTO product_info VALUES ('p006','�ڵ������̽�','c02',21000,'������','2023-04-03')
INSERT INTO product_info VALUES ('p007','��Ʈ�� ������ȣ�ʸ�','c02',15400,'������','2023-04-03')

-- SELECT  * FROM product_info



/***********************************************************
�� ������ 7.3.1
�� category_info : ��ǰ ī�װ��� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE category_info
(
  category_id   VARCHAR(10),
  category_name VARCHAR(10)
)

INSERT INTO category_info VALUES ('c01','������ǰ')
INSERT INTO category_info VALUES ('c02','�׼�����')

-- SELECT  * FROM category_info



/***********************************************************
�� ������ 7.4.1
�� event_info : �̺�Ʈ ��ǰ�� ���� ����
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

CREATE TABLE event_info
(
  event_id   VARCHAR(3),
  product_id VARCHAR(4)
)

INSERT INTO event_info VALUES ('e1','p001')
INSERT INTO event_info VALUES ('e1','p002')
INSERT INTO event_info VALUES ('e1','p003')
INSERT INTO event_info VALUES ('e2','p003')
INSERT INTO event_info VALUES ('e2','p004')
INSERT INTO event_info VALUES ('e2','p005')

-- SELECT  * FROM event_info



/***********************************************************
�� ������ 8.2.1
�� TableA, TableB
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

/*********
--TableA
*********/

CREATE TABLE tablea
(
  id   VARCHAR(1),
  ���� VARCHAR(1)
)

INSERT INTO tablea VALUES ('1','M')
INSERT INTO tablea VALUES ('2','F')
INSERT INTO tablea VALUES ('3','F')

-- SELECT  * FROM tablea



/*********
-- TableB �����ϱ�
*********/

CREATE TABLE tableb
(
  id       VARCHAR(1),
  ��ȭ��ȣ VARCHAR(5),
  ����     VARCHAR(1)
)

INSERT INTO tableb VALUES ('2','1234','A')
INSERT INTO tableb VALUES ('3','4444','B')
INSERT INTO tableb VALUES ('4','3333','C')

-- SELECT  * FROM tableb



/***********************************************************
�� ������ 8.3.1
�� sales_2022, sales_2023
�� ��� : CREATE���� INSERT INTO�� �������ٱ��� �巡�� �� ����(����ŰF5)�����ּ���.
************************************************************/

/*********
-- sales_2022 �����ϱ�
*********/

CREATE TABLE sales_2022
(
  order_id       VARCHAR(10),
  order_date	 DATE,
  order_amount   INT
)

INSERT INTO sales_2022 VALUES ('or0001','2022-10-01',100000)
INSERT INTO sales_2022 VALUES ('or0002','2022-10-03',100000)
INSERT INTO sales_2022 VALUES ('or0003','2022-10-03',100000)
INSERT INTO sales_2022 VALUES ('or0004','2022-12-23',120000)

-- SELECT  * FROM sales_2022



/*********
-- sales_2023 �����ϱ�
*********/

CREATE TABLE sales_2023
(
  order_id       VARCHAR(10),
  order_date	 DATE,
  order_amount   INT
)

INSERT INTO sales_2023 VALUES ('or0005','2023-05-01',50000)
INSERT INTO sales_2023 VALUES ('or0006','2023-07-31',70000)
INSERT INTO sales_2023 VALUES ('or0007','2023-12-31',120000)

-- SELECT  * FROM sales_2023