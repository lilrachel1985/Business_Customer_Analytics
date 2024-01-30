



/* Write a query to find the number of items on the menu */
--View the menu_items table
SELECT * FROM dbo.menu_items;
--Find the number of items on the menu
SELECT COUNT(*) FROM dbo.menu_items;


/* What are the least and most expensive items on the menu */
SELECT * FROM dbo.menu_items
ORDER BY price;

SELECT * FROM dbo.menu_items
ORDER BY price desc;

/*How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on
the menu */
SELECT COUNT(*) FROM dbo.menu_items
WHERE category='Italian';

SELECT * FROM dbo.menu_items
WHERE category='Italian'
ORDER BY price;

SELECT * FROM dbo.menu_items
WHERE category='Italian'
ORDER BY price desc;
/* How many dishes in each category? */ 
SELECT category,COUNT(menu_item_id) AS num_dishes
FROM dbo.menu_items
GROUP BY category;

/* What is the average dish price within each category */
SELECT category,AVG(price) AS avg_price
FROM dbo.menu_items
GROUP BY category
ORDER BY avg_price;