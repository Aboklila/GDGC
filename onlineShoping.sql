
--Name : Ibrahim Abdallah 

-- Task B

--Create database 
Create database OnlineShoppingSystem ;

-- Use OnlineShoppingSystem
Use OnlineShoppingSystem ;

--Customer Table
create table Customer (
CustomerID int primary key IDENTITY,
NameCustomer varchar(max), 
Email varchar(max), 
PhoneNumber varchar(max),
AddressCustomer varchar(max)
);
--Order Table
create table orders(
OrderID int primary key IDENTITY,
CustomerID int not null,
OrderDate datetime default getutcdate(), 
TotalAmount int not null,
StatusOrder varchar(max) check (StatusOrder in ('Pending', 'Shipped', 'Delivered'))
foreign key (CustomerID) references  Customer(CustomerID)
);
--orderDetails Table
create table orderDetails(
orderDetailsID int Primary key IDENTITY,
Quantity int not null,
price decimal(3,2) not null
);

--products Table
create table products(
ProductID int Primary key IDENTITY, 
NameProduct varchar(max), 
DescriptionProduct varchar(max),
Price decimal(3,2) , 
Category varchar(max) check (Category in ( 'Electronics','Clothing'))

);

--suplier Table
create table suplier(
SuplierID int Primary key IDENTITY,
NameSuplier varchar(max) not null,
ContactInfo varchar(max) not null
);

--productSuplies Table
create table  productSuplies(
ProductID int not null,
SuplierID int not null,
primary key (SuplierID,ProductID),
foreign key (ProductID) references  products(ProductID),
foreign key (SuplierID) references  suplier(SuplierID)
);

--Associated Table
create table Associated (
orderDetailsID int  not null,
OrderID int  not null,
ProductID int  not null
primary key (OrderID,ProductID),
foreign key (orderDetailsID) references  orderDetails(orderDetailsID),
foreign key (OrderID) references  orders(OrderID),
foreign key (ProductID) references  products(ProductID)
);

--order_product Table
create table  order_product(
ProductID int not null,
OrderID int not null,
primary key (OrderID,ProductID),
foreign key (OrderID) references  orders(OrderID),
foreign key (ProductID) references  products(ProductID)
);

-- insert data------------------------------------------------------------------
--insert data in Customer table
insert into Customer( NameCustomer,Email,PhoneNumber,AddressCustomer)
values('ibrahim' ,'ibragim@gmail.com' ,'0#2#764#423','Alex');		
insert into Customer( NameCustomer,Email,PhoneNumber,AddressCustomer)
values('Rewan' ,'reri@gmail.com' ,'01#764##33','Alex');		

--insert data in orders table
insert into	orders(CustomerID ,TotalAmount ,StatusOrder)		  
values(1,3,'Pending');	
insert into	orders(CustomerID ,TotalAmount ,StatusOrder)		  
values(2,6,'Pending');	 

--insert data in orderDetails
insert into	orderDetails (Quantity,price )    
values(3 , 5);								   
insert into	orderDetails (Quantity,price )    
values(32 , 6);	

--insert data in products
insert into products(NameProduct,DescriptionProduct,Price,Category)
values ('Chai','poder',3.3,'Electronics');			  
insert into products(NameProduct,DescriptionProduct,Price,Category)
values ('coffe','poder',9.99,'Electronics');	

--insert data in suplier Table
insert into suplier(NameSuplier ,ContactInfo )
values ('Emad','012331');			  
insert into suplier(NameSuplier ,ContactInfo )
values ('omar','1516');	

--insert data in suplier Table
insert into suplier(NameSuplier ,ContactInfo )
values ('Emad','012331');			  
insert into suplier(NameSuplier ,ContactInfo )
values ('omar','1516');	

--insert data in productSuplies Table
insert into productSuplies(ProductID ,SuplierID)
values (14,1);			  
insert into productSuplies(ProductID ,SuplierID)
values (16,2);	


--insert data in Associated Table
insert into Associated(ProductID ,orderDetailsID ,OrderID)
values (14,7,1);			  
insert into Associated(ProductID ,orderDetailsID ,OrderID)
values (16,3,2);	


--insert data in order_product Table
insert into  order_product(ProductID,OrderID)
values (14,1);			  
insert into  order_product(ProductID,OrderID)
values (16,2);	

-----------------------------------------------------------------------------
--DDL
/*Add a new column named rating to the Products table with an appropriate 
data type and a default value of 0.*/
Alter table Products
add rating int default 0;
/*Modify the Category column (or the relevant table/column as applicable) to 
have a default value of 'new'.*/

/*Drop the rating column from the Products table.
Delete the Users table from the Social Media Platform database.*/
Alter table Products
drop column rating;
Update  Products
set rating = null;

/*Drop the entire Social Media Platform database.*/
drop database OnlineShoppingSystem;
--DML
/*For the table that contains order information (e.g., an Orders table), update 
the order date by setting it to the current date for all records where the order 
id is greater than 0.*/
Alter table orders
--update 
/*Delete all rows from the Products table where the product name is not null 
and not equal to "Null".*/
delete from products 
where NameProduct is not null 

truncate table Products;
truncate table Products;
delete from Products;