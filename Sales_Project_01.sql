create table Customers(
customer_id int Primary Key,
name varchar(30),
email varchar(50),
city varchar(50)
);

create table products(
product_id int,
product_name varchar(30),
category varchar(40),
price int
);

create table orders(
order_id int Primary Key,
Customer_id int,
order_date date
);

create table order_items(
order_item_id int Primary key,
order_id int,
Product_id int,
Quantity int
)

Select*from Customers;
Select*from Products;
Select*from orders;
Select*from order_items;

Insert into Customers values(1,"Abhinesh" , "abi1123@gmail.com" , "Chennai"),(2,"Manoj","manojmano09@gmail.com", "Trichy"),(3,"Berlin","berlin7yt@gmail.com","Trunelveli"),(4,"Ajaaz","mhmdajaz12@gmail.com", "Coimbatore"),(5,"Antony","antonyanto@gmail.com","Coimbatore"),(6,"Vinodh","Vinoth13@gmail.com","chennai"),(7,"Jeffrin","jefrinnjefff@gmail.com","Kanyakumari"),
(8,"Sebastin","sebasebastin@gmail.com","Salem"),(9,"Muthu","muthurocks@gmail.com","Madurai"),(10,"Agilan","agilanagi67@gmail.com","Coimbatore"),(11,"Bruce","cerlinitis@gmail.com","Madurai"),(12,"Agalya","agalya2002@gmail.com","Coimbatore"),(13,"Priya","priyam23@gmail.com","Karur"),(14,"Rohini","rohinidas@gmail.com","Chennai"),(15,"Neenu","nneenuu02@gmail.com","Kanyakumari");

Insert into products values(0101, "Laptop", "Electronics", 55000),(0102, "Sofa", "Furniture", 15000),(0103, "Jacket", "Clothing", 3000),(0104, "Microwave", "Electronics", 9000),(0105, "Wardrobe", "Furniture", 25000),(0106, "Mobile", "Electronics", 11000),(0107, "Jeans", "Clothing", 1500),(0108, "TV", "Electronics", 40000),(0109, "Coffee Table", "Furniture", 3500),(0110, "Sneakers", "Clothing", 2500),(0111, "Bookshelf", "Furniture", 7000),(0112, "Smartwatch", "Electronics", 8000),
(0113, "Dining Table", "Furniture", 18000),(0114, "Sweatshirt", "Clothing", 1800),(0115, "Refrigerator", "Electronics", 32000),(0116, "Study Table", "Furniture", 8000),(0117, "Tablet", "Electronics", 22000),(0118, "Headphones", "Electronics", 3000),(0119, "T-Shirt", "Clothing", 700),(0120, "Office Chair", "Furniture", 4500),(0121, "TV Stand", "Furniture", 6000),(0122, "Washing Machine", "Electronics", 28000),(0123, "Bed", "Furniture", 22000),(0124, "Bluetooth Speaker", "Electronics", 2500),(0125, "Recliner", "Furniture", 12000);

INSERT INTO orders VALUES(201, 1, '2024-06-17'), (202, 2, '2024-06-18'), (203, 3, '2024-06-18'), (204, 1, '2024-06-19'), (205, 4, '2024-06-20'), 
(206, 2, '2024-06-21'), (207, 5, '2024-06-21'), (208, 6, '2024-06-22'), (209, 3, '2024-06-23'), (210, 7, '2024-06-23'),
(211, 1, '2024-06-24'), (212, 8, '2024-06-25'), (213, 9, '2024-06-26'), (214, 2, '2024-06-27'), (215, 10, '2024-06-27');

INSERT INTO order_items VALUES 
(1, 201, 101, 2), (2, 202, 104, 1), (3, 203, 110, 3), (4, 204, 115, 1), (5, 205, 102, 2),
(6, 206, 120, 4), (7, 207, 111, 2), (8, 208, 105, 1), (9, 209, 117, 3), (10, 210, 124, 2),
(11, 211, 108, 1), (12, 212, 109, 5), (13, 213, 103, 2), (14, 214, 106, 3), (15, 215, 112, 1);


Select*from Customers;
Select*from Products;
Select*from orders;
Select*from order_items;

// JOIN Customers & Orders Tables together //

select  c.name , c.email , c.city, o.order_id, o.order_date from Customers as C
JOIN orders as O
ON c.customer_id = o.customer_id


// (JOIN)ed All the & tables Together for Further Analysis //

Select c.name , c.email, c.city, o.order_id, o.order_date , p.product_name ,
p.category , p.price , oi.quantity from Customers as C
JOIN orders as O 
ON C.customer_id = O.customer_id
JOIN Products as P 
JOIN Order_items as Oi
ON p.product_id = oi.product_id
ON o.order_id = oi.order_id

Select*from Customers;
Select*from Products;
Select*from orders;
Select*from order_items;


// FIND THE TOTAL AMOUNT OF THE SALE //

Select c.name , c.city, o.order_id  , o.order_date , p.product_name , p.category , p.price , oi.quantity,
(p.price*oi.quantity) as Total_Amount from Customers as c
JOIN orders as o
ON c.customer_id = o.customer_id
JOIN order_items as oi
ON o.order_id = oi.order_id
JOIN products as p
ON p.product_id = oi.product_id


// FIND THE TOTAL QUANTITY & AMOUNT OF THE SALES //

Select SUM(oi.quantity) as Total_Quantity, SUM(p.price*oi.quantity) as Total_Amount from Customers as C
join orders as o 
ON C.Customer_id = O.customer_id
JOIN Order_items as oi
on oi.order_id = o.order_id
JOIN PRODUCTS AS P
ON p.product_id = oi.product_id



// Find out the total amount spent by each customer? //

select c.name , SUM(p.price*oi.quantity) as Total_spent from Customers as C
JOIN orders as o
ON c.customer_id = o.customer_id
JOIN order_items as oi
ON o.order_id = oi.order_id
JOIN products as p
ON p.product_id = oi.product_id
group by c.name



// For each product category, how many units were sold and what was the total sales amount? //

Select p.category as Total_Category , sum(oi.quantity) as Total_units, sum(p.price*oi.quantity) as Total_sales from order_items as oi
JOIN products as p
On p.product_id = oi.product_id
group by p.category
order by Total_sales desc



// Show the top 3 cities with the highest total sales. //

select c.city ,  sum(p.price*oi.quantity) as Total_sales from Customers as C
JOIN orders as o
on c.customer_id = o.customer_id
Join order_items as oi
on o.order_id = oi.order_id
JOIN products as p
on p.product_id = oi.product_id
group by c.city 
order by Total_sales desc
limit 3 


// Find the top 3 city–category combinations with the highest total sales.//

select c.city , p.category, sum(p.price*oi.quantity) as Total_sales from Customers as C
JOIN orders as o
on c.customer_id = o.customer_id
Join order_items as oi
on o.order_id = oi.order_id
JOIN products as p
on p.product_id = oi.product_id
group by c.city , p.category
order by Total_sales desc
limit 3 


// Find out the top product per city //

select p.product_name , c.city , sum(p.price*oi.quantity) as Total_amount from Customers as c
join orders as o
ON c.customer_id = o.customer_id
join order_items as oi
on o.order_id = oi.order_id
join products as p
on p.product_id = oi.product_id
group by P.product_name, c.city
order by total_amount Desc
limit 5




