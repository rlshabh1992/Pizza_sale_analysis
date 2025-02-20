-- Q1 Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS total_order_place
FROM
    orders;
    
-- Q2 Calculate the total revenue generated from pizza sales.
SELECT * FROM pizza.order_details;
SELECT 
    ROUND(sum(order_details.quantity * pizzas.price),2) as total_revenue
FROM
    order_details
join pizzas
on pizzas.pizza_id = order_details.pizza_id;

-- Q3 Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Q4 Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details.quantity)
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size;

-- Q5 List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS total
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.name
ORDER BY total DESC
LIMIT 5;
   