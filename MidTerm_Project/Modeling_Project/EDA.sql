USE house_price_regression;
SELECT * 
	FROM house_price_regression.house_price_data
	LIMIT 10;
-- 6.  Use sql query to find how many rows of data you have.
SELECT count(id) FROM house_price_data;
-- 7.  Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column `bedrooms`?
SELECT DISTINCT bedrooms FROM house_price_regression.house_price_data
	ORDER BY bedrooms ASC;

-- What are the unique values in the column `bathrooms`?
 SELECT DISTINCT bathrooms FROM house_price_regression.house_price_data
	ORDER BY bathrooms ASC;
  
 -- What are the unique values in the column `floors`?
   SELECT DISTINCT floors FROM house_price_regression.house_price_data
	ORDER BY floors ASC;
  
  -- What are the unique values in the column `condition`?
      SELECT DISTINCT `condition` FROM house_price_regression.house_price_data
	ORDER BY `condition` ASC;
   
  -- What are the unique values in the column `grade`?
  SELECT DISTINCT grade FROM house_price_regression.house_price_data
	ORDER BY grade ASC;
  
  -- 8.  Arrange the data in a decreasing order by the price of the house. 
  -- Return only the IDs of the top 10 most expensive houses in your data.
  
  SELECT id FROM house_price_regression.house_price_data 
	ORDER BY price
    LIMIT 10;
    
    -- 9.  What is the average price of all the properties in your data?
    
    SELECT avg(price) FROM house_price_regression.house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of 
-- the categorical variables in our data    

-- What is the average price of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the prices. 
-- Use an alias to change the name of the second column.
SELECT bedrooms, avg(price) AS avg_price_bedrooms FROM house_price_regression.house_price_data
	GROUP BY bedrooms
    ORDER BY bedrooms ASC;
-- What is the average `sqft_living` of the houses grouped by bedrooms? 
SELECT bedrooms, avg(sqft_living) AS avg_sqft_bedrooms FROM house_price_regression.house_price_data
	GROUP BY bedrooms
    ORDER BY bedrooms ASC;

-- What is the average price of the houses with a waterfront and without a waterfront? 
-- The returned result should have only two columns, waterfront and `Average` of the prices. 
-- Use an alias to change the name of the second column.
SELECT waterfront, avg(price) as avg_price_waterfront FROM house_price_regression.house_price_data
	GROUP BY waterfront;

-- Is there any correlation between the columns `condition` and `grade`? 
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
--  You might also have to check the number of houses in each category (ie number of houses for a given `condition`) 
-- to assess if that category is well represented in the dataset to include it in your analysis. For eg. 
-- If the category is under-represented as compared to other categories, ignore that category in this analysis

SELECT `condition`, avg(grade), count(id) FROM house_price_regression.house_price_data
	GROUP BY `condition`
    ORDER BY `condition` ASC;

SELECT avg(`condition`), grade, count(id) FROM house_price_regression.house_price_data
	GROUP BY `grade`
    ORDER BY `grade` ASC;
    
-- 11. One of the customers is only interested in the following houses:
--    - Number of bedrooms either 3 or 4
--    - Bathrooms more than 3
--    - One Floor
--    - No waterfront
--    - Condition should be 3 at least
--    - Grade should be 5 at least
--    - Price less than 300000
 --   For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?    
 
 SELECT DISTINCT * FROM house_price_regression.house_price_data
	WHERE bedrooms in  (3, 4) AND
		bathrooms >= 3 AND
        floors = 1 AND
        waterfront = 0 AND
        `condition` >= 3 AND
        grade >= 5 AND
        price < 300000;
      -- More than 3 bathrooms are not available so otions with 3 are included in the querry  
        
      
-- 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
-- Write a query to show them the list of such properties. 
--  might need to use a sub query for this problem.
SELECT avg(price) FROM house_price_regression.house_price_data;
SELECT *  FROM house_price_regression.house_price_data
	WHERE price >= 2 * (SELECT avg(price) FROM house_price_regression.house_price_data);


-- 13. Since this is something that the senior management is regularly interested in, 
-- create a view called `Houses_with_higher_than_double_average_price` of the same query.
CREATE OR REPLACE VIEW Houses_with_higher_than_double_average_price AS
	SELECT *  FROM house_price_regression.house_price_data
		WHERE price >= 2 * (SELECT avg(price) 
								FROM house_price_regression.house_price_data);


-- 14. Most customers are interested in properties with three or four bedrooms. 
-- What is the difference in average prices of the properties with three and four bedrooms? 
-- In this case you can simply use a group by to check the prices for those particular houses

SElECT bedrooms, avg(price) FROM house_price_regression.house_price_data
	WHERE bedrooms in (3, 4)
    GROUP BY bedrooms;


-- 15. What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode FROM house_price_regression.house_price_data;
SELECT  count( DISTINCT zipcode) FROM house_price_regression.house_price_data;

-- 16. Show the list of all the properties that were renovated.
SELECT * FROM house_price_regression.house_price_data
	WHERE yr_renovated <> 0;



-- 17. Provide the details of the property that is the 11th most expensive property in your database.

SELECT * FROM house_price_regression.house_price_data
	ORDER BY price DESC
    LIMIT  10, 1;


    