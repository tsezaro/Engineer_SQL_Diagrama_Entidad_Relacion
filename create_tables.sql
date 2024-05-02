-- SCRIPT DDL para la creación de mi base datos ecommerce en donde voy a trabajar
CREATE DATABASE ecommerce;

-- SCRIPT DDL para usar la base de datos
USE ecommerce;


-- Script DDL para la creación de la tabla Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    sexo CHAR(1),
    direccion VARCHAR(100),
    fecha_nacimiento DATE,
    telefono VARCHAR(20)
);

-- Script DDL para la creación de la tabla Categorys
CREATE TABLE Categorys (
    category_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

-- Script DDL para la creación de la tabla Items
CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    category_id INT,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    estado VARCHAR(20),
    FOREIGN KEY (category_id) REFERENCES Categorys(category_id)
);


-- Script DDL para la creación de la tabla Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    item_id INT,
    fecha_transaccion DATE,
    total_transaccion DECIMAL(10, 2),
    cantidad_productos INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (item_id) REFERENCES Items(item_id)
);
