USE Olist;
SHOW Tables;
SELECT order_reviews.review_id, order_reviews.order_id, order_reviews.review_score from order_reviews;
SELECT orders.order_id, orders.customer_id FROM orders;
SELECT order_items.order_id, order_items.product_id FROM order_items;
SELECT products.product_id, product_category_name, product_description_length FROM products;

-- GETTING PRODUCT RATINGS, ORDERS, PRODUCT CATEGORY NAME AND PRODUCT LENGTHS
CREATE OR REPLACE VIEW Ordered_items_and_reviews AS
SELECT order_reviews.review_score, order_reviews.order_id, products.product_category_name, products.product_description_length
	FROM order_reviews
		JOIN order_items
			ON order_reviews.order_id = order_items.order_id
		JOIN products
			ON order_items.product_id = products.product_id;
          
-- Get AVERAGE review_score per order // Time OUT after 30 SEC
SELECT avg(review_score), order_id FROM Ordered_items_and_reviews
GROUP BY order_id;


-- Get AVERAGE review_score per product 
CREATE OR REPLACE VIEW Product_AVG_Review_Score AS
SELECT AVG(order_reviews.review_score) as avg_score , order_reviews.order_id -- , products.product_id, products.product_category_name, products.product_description_length
	FROM order_reviews
		JOIN order_items
			ON order_reviews.order_id = order_items.order_id
		JOIN products
			ON order_items.product_id = products.product_id
GROUP BY products.product_id
ORDER BY avg_score
LIMIT 10;

SELECT * FROM Product_AVG_Review_Score;
            


