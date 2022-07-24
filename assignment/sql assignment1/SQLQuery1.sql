
Create Table Customer 
(
Id int primary key ,
FirstName nvarchar(40) not null , 
LastName nvarchar(40) , 
City nvarchar(40),
Country nvarchar(40) not null,
Phone nvarchar(40)
)




Create Table Orders
(
Id int primary key,
OrderDate datetime not null,
OrderNumber nvarchar(10),
CustomerId int foreign key references Customer(Id) on delete cascade,
TotalAmount decimal(12,2)
)


Create Table Product
(
Id int primary key,
ProductName nvarchar(50),
UnitPrice decimal(12,2),
Package nvarchar(30),
IsDiscontinued bit
)


Create Table OrderItem 
(
Id int primary key,
OrderId int foreign key references Orders(Id) on delete cascade,
ProductId int foreign key references Product(Id) on delete cascade,
UnitPrice decimal(12,2),
Quantity int
)

Create index IndexCustomerName on Customer(FirstName,LastName)


Create index IndexOrdersCustomerId on Orders(Id)
Create index IndexOrdersOrderDate on Orders(OrderDate)



Create index IndexOrderItemOrderId on OrderItem(Id)
Create index IndexOrderItemProductId on OrderItem(ProductId)


Create index IndexProductSupplierId on Product(Id)
Create index IndexProductName on Product(ProductName)




Insert Into Customer(Id,FirstName,LastName,City,Country,Phone)
values(1,'abi','ram','Nagpur','India','9812348321'),
      (2,'Virat','Kohli','Delhi','England','9812348442'),
      (3,'Shikhar','Dhawan','Maharashtra','Australia','8872348321'),
      (4,'Kane','Williamson','Chennai','NewZealand','9812555321'),
      (5,'Jos','Buttler','UP','SriLanka','981232131');
 


 
--Display All Customer Details
 Select * from Customer


 Insert Into Orders
values(101,'2022-07-20 12:15:30','10',4,2000.50),
      (102,'2022-07-21 12:16:31','11',2,2060.50),
	  (103,'2022-07-22 12:17:32','12',4,2100.50),
	  (104,'2022-07-23 12:18:33','13',3,2350.50),
	  (105,'2022-07-24 12:19:34','14',1,2500.50);
      
 Select * from Orders


 Insert into Product
 values(1000,'SmartPhone',9000.50,'small','TRUE'),
       (1001,'Laptop',46000.50,'medium','TRUE'),
	   (1002,'SmartWatch',2000.50,'small','TRUE'),
	   (1003,'TV',15000.50,'large','False'),
	   (1004,'SmartTV',20000.50,'medium','TRUE');


	   Select * from Product


Insert into OrderItem
values(10,102,1002,2500.50,3),
      (11,105,1000,9500.50,2),
      (12,104,1004,25000.50,1),
      (13,101,1001,46500.50,4),
      (14,103,1003,15000.50,2);


Select * from Customer
 Select * from Orders
 Select * from Product
Select * from OrderItem



--Displaying country whose name starts with R or S
Select country from Customer 
where FirstName LIKE 'R%' Or FirstName LIKE 'S%';



--display whose name of customer whose third character is i
Select FirstName,LastName from Customer
where FirstName LIKE '__i%';

Update Customer 
Set FirstName='Isan'
where Id=5
