Use bestbuy;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT * FROM products;
SELECT categories.Name, products.Name FROM products
INNER JOIN categories ON products.CategoryID= categories.CategoryID
WHERE categories.name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT Name, Price, Rating  
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
Select sales.EmployeeID, FirstName, LastName, SUM(Quantity) AS 'Total Sold'
From sales
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
HAVING SUM (Quantity) (
	-- SUBQUERY in order to get the highest total sold
    SELECT SUM(Quantity) 
    From sales
    GROUP BY sales.EmployeeID
    ORDER BY SUM(Quantity) DESC
    LIMIT 1
);

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Name = "Games";


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT products.Name AS 'Product Name', 
SUM(sales.Quantity),SUM(sales.PricePerUnit), SUM(sales.Quantity * sales.PricePerUnit) AS 'Total Sales'
FROM products
INNER JOIN sales ON sales.ProductID = products.ProductID
WHERE products.Name LIKE '%Hotel%California%'
GROUP BY products.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, Reviewer, Rating, comment
FROM products
INNER JOIN reviews ON products.productID = reviews.ProductID
WHERE products.Name LIKE '%visio%TV%' AND Rating = 1;


-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID,
 (FirstName, ' ' ,LastName) AS 'Employee Name', products.Name, 
SUM(sales.Quantity)
FROM employees
INNER JOIN sales ON employees.employeeID = sales.EmployeeID
INNER JOIN products ON products.ProductID = sales.ProductID
GROUP BY employees.employeeID, products.ProductID;

