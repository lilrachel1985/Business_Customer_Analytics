/* Customer Behavior Analytics */
-- Combine the menu_items and order_details table into a single table
SELECT * FROM dbo.menu_items;
SELECT * FROM dbo.order_details;

SELECT *
FROM dbo.order_details od LEFT JOIN dbo.menu_items mi
        ON od.item_id =mi.menu_item_id;


-- What are the least and most ordered items? What categories are they in?
SELECT item_name,category,COUNT(order_details_id) AS num_purchases
FROM dbo.order_details od LEFT JOIN dbo.menu_items mi
        ON od.item_id =mi.menu_item_id
GROUP BY item_name,category
ORDER BY num_purchases DESC;

-- What are the top 5 orders that spent the most money
SELECT order_id, SUM(price) AS total_spend
FROM dbo.order_details od LEFT JOIN dbo.menu_items mi
        ON od.item_id =mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
offset 0 rows
fetch next 5 rows only;


--View the details of the highest spent order. What insights can you gather from the
SELECT category, COUNT(item_id)AS num_items
FROM dbo.order_details od LEFT JOIN dbo.menu_items mi
        ON od.item_id =mi.menu_item_id
WHERE order_id=440
GROUP BY category;


--View the details of the top 5 highest spend orders. What insights can you gather from
SELECT order_id,category, COUNT(item_id)AS num_items
FROM dbo.order_details od LEFT JOIN dbo.menu_items mi
        ON od.item_id =mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category;