SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Product;

--write a query to display the orders placed by customer with phone number 8872348321
SELECT o.*,c.FirstName,c.LastName
FROM Customer c 
JOIN Orders o ON c.Id = o.CustomerId
WHERE c.Phone = '8872348321';



Alter table Product
add 
Category nvarchar(50)


Update Product
Set Category='Dell'
where Id=1002;



--  fetching all the products which are available under Category ‘Samsung’.
Select * from Product
where Category='Samsung';


--Display the orders placed by customers not in NewZealand
SELECT o.* FROM Orders o
JOIN Customer c ON o.CustomerId = c.Id
WHERE c.City <>'NewZealand';


--selects all the order which are placed for the product Chai.

SELECT o.* FROM Orders o
JOIN OrderItem oi ON o.Id = oi.OrderId
JOIN Product p ON oi.ProductId = p.Id
WHERE p.ProductName = 'TV';