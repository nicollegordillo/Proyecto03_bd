CREATE TABLE Time(
    TimeId SERIAL PRIMARY KEY,
    Date DATE NOT NULL,
    Year INTEGER,
    Quarter INTEGER,
    Month INTEGER,
    Day INTEGER
);

CREATE TABLE Supplier (
    SupplierId SERIAL PRIMARY KEY,
    CompanyName VARCHAR(128) NOT NULL
);

CREATE TABLE Customer (
    CustomerId VARCHAR(26) PRIMARY KEY,
    CompanyName VARCHAR(128) NOT NULL,
    City VARCHAR(128),
    Country VARCHAR(128)
);

CREATE TABLE Product (
    ProductId SERIAL PRIMARY KEY,
    ProductName VARCHAR(128) NOT NULL,
    ProductCategory VARCHAR(128)
);

CREATE TABLE Employee (
    EmployeeId SERIAL PRIMARY KEY,
    EmpLastName VARCHAR(128) NOT NULL,
    MngLastName VARCHAR(128),
	EmpTitle varchar(128),
	EmpCity varchar(128),
	EmpCountry varchar(128)
);

CREATE TABLE Orders_facts (
    CustomerId VARCHAR(26) REFERENCES Customer(CustomerId),
    ProductId INTEGER REFERENCES Product(ProductId),
    EmployeeId INTEGER REFERENCES Employee(EmployeeId),
    TimeId INTEGER REFERENCES Time(TimeId),
    SupplierId INTEGER REFERENCES Supplier(SupplierId),
    Price DECIMAL(10, 2),
    Quantity INTEGER,
	Discount Decimal(10, 2)
);

--schema temporary
--crear schema temporary
CREATE TABLE temporary.temp_table (
    CustomerId VARCHAR(26),
    ProductId INTEGER,
    EmployeeId INTEGER,
    SupplierId INTEGER,
    Price DECIMAL(10, 2),
    Quantity INTEGER,
	Discount Decimal(10, 2),
	orderdate date
);