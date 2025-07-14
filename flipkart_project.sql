create database FlipKart_sales;
use Flipkart_sales;

-- Basic Operations

-- Select All Data
SELECT * FROM flipkart;
-- Filter by a Specific Condition
SELECT * FROM flipkart
WHERE product_rating > 4;
-- Sort Data
SELECT * FROM flipkart
ORDER BY selling_price ASC;
-- Filter by  Product Rating
SELECT * FROM flipkart
WHERE product_rating BETWEEN 3 AND 4;

-- Intermediate Operations
-- Aggregate Functions
SELECT AVG(product_rating) AS average_rating
FROM flipkart;

SELECT MAX(product_rating) AS average_rating
FROM flipkart;

SELECT MIN(product_rating) AS average_rating
FROM flipkart;

-- Count Records
SELECT category_3, COUNT(*) AS product_count
FROM flipkart
GROUP BY category_3;

-- Find Unique Values
SELECT DISTINCT category_2
FROM flipkart;

-- Filter by Multiple Conditions
SELECT * FROM flipkart
WHERE product_rating > 4 AND selling_price < 300;

-- Advanced Operations
-- Join
SELECT s.id, p.seller_name, s.platform
FROM flipkart p
JOIN test s ON p.seller_rating = s.Rating;

-- Subquery
SELECT title, category_3, selling_price
FROM flipkart p1
WHERE selling_price > (
    SELECT AVG(selling_price)
    FROM flipkart p2
    WHERE p1.category_3 = p2.category_3
);

-- Complex Filtering and Aggregation
SELECT category_3, AVG(selling_price) AS average_price
FROM flipkart
WHERE product_rating >= 3
GROUP BY category_3
HAVING AVG(selling_price) > '$100';

-- Queries
-- 1.Retrieve Products with a Specific Keyword in Title
SELECT * FROM flipkart
WHERE title LIKE '%Cricket%';

-- 2.Find Products from a Specific Seller
SELECT * FROM flipkart
WHERE seller_name = 'VictoryOutlets';

-- 3.Calculate Total Sales Value per Seller
SELECT seller_name, SUM(selling_price) AS total_sales
FROM flipkart
GROUP BY seller_name;

-- 4.Using a subquery to get the highest-rated product in each category
SELECT p1.category_3, p1.title, p1.product_rating AS highest_rating
FROM flipkart p1
JOIN (
    SELECT category_3, MAX(product_rating) AS max_rating
    FROM flipkart
    GROUP BY category_3
) p2 ON p1.category_3 = p2.category_3 AND p1.product_rating = p2.max_rating;


-- 5.Products with the Highest Price Difference between Selling Price and MRP
SELECT title, selling_price, mrp, (mrp - selling_price) AS price_difference
FROM flipkart
ORDER BY price_difference DESC
LIMIT 1;

-- 6.Top 5 Most Expensive Products
SELECT title, selling_price
FROM flipkart
ORDER BY selling_price DESC
LIMIT 5;

-- 7.Average Rating of Products Sold by Each Seller
SELECT seller_name, AVG(product_rating) AS average_rating
FROM flipkart
GROUP BY seller_name;

-- 8.Products with a Rating Higher than the Overall Average Rating
SELECT title, product_rating
FROM flipkart
WHERE product_rating > (
    SELECT AVG(product_rating)
    FROM flipkart
);

-- 9.Count of Products per Category and Seller
SELECT category_3, seller_name, COUNT(*) AS product_count
FROM flipkart
GROUP BY category_3, seller_name;

-- 10.Subquery for Seller Rating
SELECT seller_name, AVG(seller_rating) AS avg_seller_rating
FROM flipkart
GROUP BY seller_name;