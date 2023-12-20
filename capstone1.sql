select * from  dbo.table1

SELECT name, price
FROM dbo.table1
WHERE Category = 'Men'


#Write a query to retrieve the number of different colors available for each category.

SELECT Category, COUNT(DISTINCT No_of_Colors) AS color_count
FROM dbo.table1
GROUP BY Category

#Write a query to find the most expensive mens shoe.

SELECT name, price
FROM dbo.table1
WHERE category = 'Men'
ORDER BY price DESC

SELECT MAX(price) FROM dbo.table1
WHERE Category = 'Men'

#Write a query to find the cheapest womens shoe in a specific color (e.g., 'Black ').

SELECT MIN(price) FROM dbo.table1
WHERE Category = 'Women'

# Write a query to retrieve all shoe names and their corresponding prices for mens shoes.

SELECT Name, price
FROM dbo.table1
WHERE Category = 'Men'

#Table2

select * from dbo.table2

#Write a query that retrieves the count of sizes for all styles.

select Product_code, Sizes
FROM dbo.table2

#Write a query to list all styles with their associated colors.

select Product_code, color1, color2, color3, color4, color5
from dbo.table2

#Write a to find styles that have more than one color.

select Product_code
from dbo.table2
where color1 <> '-' AND color2 <> '-' AND color3 <> '-' AND color4 <>'-' AND color5 <> '-'

Write a query to find the count of sizes available for each color for a specific style code.

SELECT Product_code, color1, COUNT(DISTINCT sizes) AS size_count
FROM dbo.table2
WHERE Product_code = 'DZ7534-003'
GROUP BY Product_code, color1;

SELECT Product_code, color2, COUNT(DISTINCT sizes) AS size_count
FROM dbo.table2
WHERE Product_code = 'DV5469-001'
GROUP BY Product_code, color2;

SELECT Product_code, color3, COUNT(sizes) AS size_count
FROM dbo.table2
WHERE Product_code = 'DC7695-100'
GROUP BY Product_code, color3;

SELECT Product_code, color4, COUNT(sizes) AS size_count
FROM dbo.table2
WHERE Product_code = 'DZ7534-003'
GROUP BY Product_code, color4;

SELECT Product_code, color5, COUNT(sizes) AS size_count
FROM dbo.table2
WHERE Product_code = 'CJ0882-104'
GROUP BY Product_code, color5;



#Write a query to find styles that have a specific color.

SELECT DISTINCT Product_code
FROM dbo.table2
WHERE 'WHITE/WHITE' IN (color1, color2, color3, color4, color5)

#Table3

select * from dbo.table3

#Write a query calculates the average comfort rating for a specific product based on its reviews.

select column1, Comfort
FROM dbo.table3
where Comfort>3


#Write a query to retrieve products with high star ratings (e.g., 4 stars or above)

select column1, Ratings
FROM dbo.table3
where Ratings>4

Write a query that counts the number of reviews for each product.

select column1, Reviews
FROM dbo.table3

#Write a To retrieve products that have a quantified durability/quality/performance rating above a certain threshold (e.g., above 7).

select column1, Durability
FROM dbo.table3
where Durability>3

#Write a query that  calculates the average comfort rating for each size.

select Size, AVG(Comfort) AS Avg_comfort_rating
FROM dbo.table3
GROUP BY Size


Join Queries

select * from dbo.table1
select * from dbo.table2
select * from dbo.table3

#Write a query finds the top-rated mens shoes along with their sizes from "Table1" and "Table3."

SELECT dbo.table1.column1, dbo.table1.Category, dbo.table3.Ratings
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Ratings = 5 AND dbo.table1.Category = 'Men'

#Write a  query calculates the average comfort rating for each category from "Table1" and "Table3."

SELECT dbo.table1.column1, dbo.table1.Category, dbo.table3.Comfort
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Comfort = 5 AND dbo.table1.Category = 'Men'


SELECT dbo.table1.column1, dbo.table1.Category, dbo.table3.Comfort
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Comfort = 5 AND dbo.table1.Category = 'Women'

#Write a  query identifies products with a durability/quality/performance rating higher than the average from "Table1" and "Table3."

SELECT dbo.table1.column1, dbo.table1.Name, dbo.table3.Ratings
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Durability > 4


# Write a  subquery finds products with comfort ratings above the average comfort rating using "Table1" and "Table3."

select dbo.table1.column1, dbo.table1.Name, dbo.table3.Comfort
FROM dbo.table1
WHERE dbo.table3.Comfort >(SELECT AVG(dbo.table3.Ratings) From dbo.table3 WHERE dbo.table1.column1 = dbo.table3.column1)

#Write a  query joins Table 1  and Table 2  using the "Style code/Product code" column, allowing you to retrieve shoe information along with product details.

SELECT *
FROM dbo.table1
LEFT JOIN dbo.table2 ON dbo.table1.column1 = dbo.table2.column1

#Write a  query that  identifies products with a star rating above the average star rating for their respective size.

SELECT dbo.table2.column1, dbo.table2.Sizes, dbo.table3.Ratings
FROM dbo.table2
INNER JOIN dbo.table3
ON dbo.table2.column1 = dbo.table3.column1
WHERE dbo.table3.Ratings > 4

#Write  a  query finds products with the highest comfort rating in each category.

SELECT dbo.table1.column1, dbo.table1.Category, dbo.table3.Comfort
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Comfort> 4.5 AND dbo.table1.Category = 'Men'

SELECT dbo.table1.column1, dbo.table1.Category, dbo.table3.Comfort
FROM dbo.table1
INNER JOIN dbo.table3
ON dbo.table1.column1 = dbo.table3.column1
WHERE dbo.table3.Comfort> 4.5 AND dbo.table1.Category = 'Women'


