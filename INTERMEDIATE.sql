-- Q1 Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Q2 Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(time) AS hours, COUNT(order_id) AS total_order
FROM
    orders
GROUP BY hours
ORDER BY total_order DESC;

-- Q3 Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name) AS total_pizza
FROM
    pizza_types
GROUP BY category;

-- Q4 Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(total_order),0) as avg_pizza_order_per_day
FROM
    (SELECT 
        orders.date, SUM(order_details.quantity) AS total_order
    FROM
        order_details
    JOIN orders ON order_details.order_id = orders.order_id
    GROUP BY orders.date
    ORDER BY total_order DESC) AS order_quantity;
    
-- Q5 Determine the top 3 most ordered pizza types based on revenue. 
SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3; 