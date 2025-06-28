CREATE DATABASE RETAIL_SALES09

SELECT TOP 100 * FROM SALES_OVERVIEW

ALTER TABLE SALES_OVERVIEW
ADD CONSTRAINT PK_SALES_TRANSACTIONS PRIMARY KEY (transactions_id);

SP_HELP SALES_OVERVIEW

--COUNT HOW MANY ROWS I HAVE

SELECT COUNT(*)
FROM  SALES_OVERVIEW


--Query to Check for NULLs in Any Column

SELECT *
FROM SALES_OVERVIEW
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL


   UPDATE SALES_OVERVIEW
SET age = 0
WHERE age IS NULL;

UPDATE SALES_OVERVIEW
SET quantiy = 0
WHERE quantiy IS NULL;

UPDATE SALES_OVERVIEW
SET price_per_unit = 0
WHERE price_per_unit IS NULL;

UPDATE SALES_OVERVIEW
SET cogs = 0
WHERE cogs IS NULL;

UPDATE SALES_OVERVIEW
SET total_sale = 0
WHERE total_sale IS NULL;

-- Step 1: Calculate average age excluding 0 and NULL
DECLARE @avg_age FLOAT;

SELECT @avg_age = AVG(age)
FROM SALES_OVERVIEW
WHERE age IS NOT NULL AND age <> 0;

-- Step 2: Update rows where age = 0
UPDATE SALES_OVERVIEW
SET age = @avg_age
WHERE age = 0;

--DATA CLEANING ENDS HERE

--DATA EXPLORATION

--HOW MANY SALES WE HAVE
 SELECT COUNT(*) AS TOTAL_SALE_NUMBER
 FROM SALES_OVERVIEW

 --HOW MANY UNIQUE CUSTOMERS I HAVE
 SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM SALES_OVERVIEW;

--HOW MANY CATEGORYS I HAVE
SELECT COUNT( DISTINCT category) AS unique_CATEGORY
FROM SALES_OVERVIEW;

--I WANT TO SEE CATAGORY NAMES
SELECT DISTINCT category AS CATEGORY_NAMES FROM SALES_OVERVIEW

--DATA ANALYSIS AND KEY BUSINESS PROBLEMS AND THERE ANSWERS

--WRITE A SQL QUERY TO RETRIVE ALL COLUMNS FOR SALES MADE ON A SPECIFIC DATE LIKE (2022-11-05)

SELECT *
FROM SALES_OVERVIEW
WHERE sale_date = '2022-11-05'

--WRITE A SQL QUERY TO RETRIVE ALL TRANSACTIONS WHERE THE CATAGORY IS CLOTHING
SELECT *
FROM SALES_OVERVIEW
WHERE category = 'Clothing';

--WRITE A SQL QUERY TO RETRIVE ALL TRANSACTIONS WHERE THE CATAGORY IS CLOTHING AND THE QUANTIRY SOLD IS MORE THEN 4
SELECT *
FROM SALES_OVERVIEW
WHERE category = 'Clothing' AND quantiy >= 4;

--WRITE A SQL QUERY TO RETRIVE ALL TRANSACTIONS WHERE THE CATAGORY IS CLOTHING AND THE QUANTIRY SOLD IS MORE THEN 4 IN THE MONTH OF NOV-2022
SELECT *
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;

  --CALCULATE TOTAL SALES IN CLOTHING CATAGORY IN NOV 2022

  SELECT SUM(total_sale) AS total_clothing_sales
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;

  --CALCULATE TOTAL SALES IN CLOTHING CATAGORY IN NOV 2022 BY MALES
  SELECT SUM(total_sale) AS total_clothing_sales_by_males
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND gender = 'Male'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;

  SELECT sale_date, SUM(total_sale) AS total_sales
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND gender = 'Male'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
GROUP BY sale_date;

SELECT sale_date, customer_id, SUM(total_sale) AS total_sales
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND gender = 'Male'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
GROUP BY sale_date, customer_id;

SELECT sale_date, SUM(total_sale) AS total_sales
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND gender = 'Male'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
GROUP BY sale_date
ORDER BY total_sales DESC;

SELECT *
FROM SALES_OVERVIEW
WHERE category = 'Clothing'
  AND gender = 'Male'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
ORDER BY total_sale DESC;

--WRITE A QUERY TO CALCULATE THE TOTAL SALES FOR EACH CATEGORY
SELECT category, SUM(total_sale) AS total_sales
FROM SALES_OVERVIEW
GROUP BY category;

--WRITE A QUERY TO CALCULATE THE TOTAL SALES FOR EACH CATEGORY I ALSO WANT TO SEE TOTAL ORDERS IN RESPECTIVE CATEGORY

SELECT 
    category, 
    SUM(total_sale) AS total_sales, 
    COUNT(*) AS total_orders
FROM 
    SALES_OVERVIEW
GROUP BY 
    category
ORDER BY TOTAL_SALES DESC

--WRITE A SQL QUERY TO FIND THE AVERAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE BEAUTY CATEGORY

SELECT 
    AVG(age) AS average_age
FROM 
    SALES_OVERVIEW
WHERE 
    category = 'Beauty'

-- WRITE A SQL QUERY TO FIND ALL TRANASCTIONS WHERE THE TOTAL_sale is greater than 1000
SELECT * FROM SALES_OVERVIEW
WHERE total_sale>=1000
--AND gender='MALE'

--WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTIONS MADE BY EACH GENDER IN EACH CATEGORY
SELECT 
    gender,
    category,
    COUNT(*) AS total_transactions
FROM 
    SALES_OVERVIEW
GROUP BY 
    gender, category
ORDER BY 
    gender, category;
--WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF SALES MADE BY EACH GENDER IN EACH CATEGORY
   
   SELECT 
    gender,
    category,
    SUM(total_sale) AS total_sales
FROM 
    SALES_OVERVIEW
GROUP BY 
    gender, category
ORDER BY 
    gender, category;
-- ORDER BY DESC
	SELECT 
    gender,
    category,
    SUM(total_sale) AS total_sales
FROM 
    SALES_OVERVIEW
GROUP BY 
    gender, category
ORDER BY 
    total_sales DESC;

	--WRITE A SQL QUERY TO CALCULATE ATHE AVG SALE FOR EACH MONTH
	SELECT 
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    AVG(total_sale) AS avg_monthly_sale
FROM 
    SALES_OVERVIEW
GROUP BY 
    YEAR(sale_date), MONTH(sale_date)
ORDER BY 
    sale_year, sale_month;


	--WRITE A SQL QUERY TO CALCULATE ATHE AVG SALE FOR EACH MONTH,FIND OUT BEST SELLING MONTH IN EACH YEAR 
WITH MonthlySales AS (
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        AVG(total_sale) AS avg_sale,
        SUM(total_sale) AS total_sale
    FROM SALES_OVERVIEW
    GROUP BY YEAR(sale_date), MONTH(sale_date)
),
RankedSales AS (
    SELECT *,
        DENSE_RANK() OVER (PARTITION BY sale_year ORDER BY total_sale DESC) AS sale_rank
    FROM MonthlySales
)
SELECT sale_year, sale_month, avg_sale, total_sale
FROM RankedSales
WHERE sale_rank = 1
ORDER BY sale_year, sale_month;


--WRITE A SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES

SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM SALES_OVERVIEW
GROUP BY customer_id
ORDER BY total_sales DESC;

--USING CTE

WITH CustomerSales AS (
    SELECT 
        customer_id,
        SUM(total_sale) AS total_sales
    FROM SALES_OVERVIEW
    GROUP BY customer_id
),
RankedCustomers AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY total_sales DESC) AS rn
    FROM CustomerSales
)
SELECT *
FROM RankedCustomers
WHERE rn <= 5;

--WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY

SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM 
    SALES_OVERVIEW
GROUP BY 
    category;


	--WRITE A SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS(EXAMPLE MORNING <=12,AFTERNOON BETWEEN 12 & 17,EVENING >17)

	WITH ShiftAssignment AS (
    SELECT 
        *,
        CASE 
            WHEN CAST(sale_time AS TIME) < '12:00:00' THEN 'Morning'
            WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM SALES_OVERVIEW
)

SELECT 
    shift,
    COUNT(*) AS number_of_orders
FROM ShiftAssignment
GROUP BY shift;
