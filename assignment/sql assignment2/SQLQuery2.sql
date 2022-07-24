Select * from Customer
Select * from Orders
Select * from Product
Select * from OrderItem

--Display details from customer table who is from country Australia
Select * from Customer
where country='Australia';

Select FirstName,LastName from Customer


--displaying fullname of customers
Select FirstName+''+LastName as FullName from Customer


Alter table Customer
Add
Faxnumber int

Update Customer
set Faxnumber=3001299487
where Id=1;



--Display customer detals who has fax number
SELECT * FROM Customer
WHERE Fax LIKE '%';


--Display customer details whose name holds second letter o

Select * from Customer 
where FirstName Like '_o%';



--Displaying order details where unit price is between 9500 and 26000
Select o.* from Orders o
join 
OrderItem oi on o.Id=oi.OrderId
where oi.UnitPrice>9500 and UnitPrice<26000
order by oi.UnitPrice;
Select * from OrderItem


Alter table Orders 
add 
ShippingDate datetime 


Alter table Orders
add
ShippingName nvarchar(50)

Update Orders
Set ShippingDate='2022-07-30 12:35:20' 
where Id=105;

Update Orders
Set ShippingName='CafeShipping' 
where Id=105;



Select * from Orders
order by OrderDate desc;

--print orders shipped by shipname 'la corne d'abondance' between 2 dates
Select * from Orders
where ShippingName='La Corne D"abundance' and ShippingDate between '2022-07-20' and '2022-07-30';


Alter table Product
add
SupplierName nvarchar(50)


Update Product
set SupplierName='Pathway'
where Id=1003;



--Print Products Supplied by Exotic Liquids
Select ProductName from Product 
where SupplierName='ExoticLiquid'


--Average quantity ordered for every product
Select p.Id,Avg(oi.Quantity) as Avg_Quantity from OrderItem oi
join 
Product p on oi.ProductId=p.Id
group by p.Id



--Print all shipping company name and ship names if they operational
Select o.ShippingName ,p.SupplierName 
from Orders o
join OrderItem oi on o.Id=oi.OrderId
join Product p on oi.ProductId=p.id
where p.IsDiscontinued=1;



--Print TotalPrice of orders which have the products supplied by 'Exotic Liquid' if the price is > 2000 and also print by its shipping name
Select p.ProductName, p.SupplierName ,o.TotalAmount
from Orders o
join OrderItem oi on o.Id=oi.OrderId
join Product p on oi.ProductId=p.id
where p.SupplierName='ExoticLiquid' and o.TotalAmount>2000;
