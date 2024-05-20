-- Crear la tabla de Categorías
CREATE TABLE categories (
    categoryID NUMBER PRIMARY KEY,
    categoryName VARCHAR2(26 BYTE) NOT NULL,
    description VARCHAR2(128 BYTE)
);

-- Crear la tabla de Empleados
CREATE TABLE employees (
    employeeID NUMBER(38) PRIMARY KEY,
    employeeName VARCHAR2(26 BYTE) NOT NULL,
    title VARCHAR2(26 BYTE),
    city VARCHAR2(26 BYTE),
    country VARCHAR2(26 BYTE),
    reportsTo NUMBER (38)
);

-- Crear la tabla de Clientes
CREATE TABLE customers (
    customerID VARCHAR2(26 BYTE) PRIMARY KEY,
    companyName VARCHAR2(128 BYTE) NOT NULL,
    contactName VARCHAR2(50 BYTE),
    contactTitle VARCHAR2(128 BYTE),
    city VARCHAR2(26 BYTE),
    country VARCHAR2(26 BYTE)
);

-- Crear la tabla de Transportistas
CREATE TABLE shippers (
    shipperID NUMBER (38) PRIMARY KEY,
    companyName VARCHAR2(128 BYTE) NOT NULL
);

-- Crear la tabla de Productos
CREATE TABLE product (
    productID NUMBER (38) PRIMARY KEY,
    productName VARCHAR2(128 BYTE) NOT NULL,
    quantityPerUnit VARCHAR2(26 BYTE),
    unitPrice NUMBER (38,2),
    discontinued NUMBER(38),
    categoryID NUMBER(38),
    CONSTRAINT fk_category FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

-- Crear la tabla de Órdenes
CREATE TABLE orders (
    orderID NUMBER (38)PRIMARY KEY,
    customerID VARCHAR2(26 BYTE) NOT NULL,
    employeeID NUMBER (38) NOT NULL,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipperID NUMBER (38),
    freight NUMBER (38,2),
    CONSTRAINT fk_customer FOREIGN KEY (customerID) REFERENCES customers(customerID),
    CONSTRAINT fk_employee FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
    CONSTRAINT fk_shipper FOREIGN KEY (shipperID) REFERENCES shippers(shipperID)
);

-- Crear la tabla de Detalles de Órdenes
CREATE TABLE order_items (
    orderID NUMBER(38) NOT NULL,
    productID NUMBER(38) NOT NULL,
    unitPrice NUMBER(38,1) NOT NULL,
    quantity NUMBER(38) NOT NULL,
    discount NUMBER(38,2),
    PRIMARY KEY (orderID, productID),
    CONSTRAINT fk_order FOREIGN KEY (orderID) REFERENCES orders(orderID),
    CONSTRAINT fk_product FOREIGN KEY (productID) REFERENCES product(productID)
);