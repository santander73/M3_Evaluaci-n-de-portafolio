-- Lenguaje de Definición de Datos (DDL)
-- Este script crea la estructura (schema) de la base de datos.

CREATE DATABASE IF NOT EXISTS InventarioDB;
USE InventarioDB;

-- Eliminar tablas en orden inverso para evitar conflictos de FK
DROP TABLE IF EXISTS Transacciones;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Productos;

-- REQ 4: Crear tabla PRODUCTOS
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    -- REQ 4: Implementar una restricción (CHECK)
    precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0), 
    cantidad_inventario INT NOT NULL CHECK (cantidad_inventario >= 0)
);

-- REQ 4: Crear tabla PROVEEDORES
CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    -- REQ 4: Implementar una restricción (UNIQUE)
    email VARCHAR(100) UNIQUE 
);

-- REQ 4: Crear tabla TRANSACCIONES (Tabla relacional)
CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    -- REQ 4: Implementar una restricción (ENUM)
    tipo ENUM('Compra', 'Venta') NOT NULL, 
    fecha DATE NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    id_producto INT NOT NULL,
    id_proveedor INT, -- Permite NULL (para Ventas)
    
    -- REQ 1 & REQ 4: Definición de Claves Foráneas (FK)
    -- Se define la integridad referencial.
    FOREIGN KEY (id_producto) 
        REFERENCES Productos(id_producto) 
        -- Impide eliminar un producto si tiene transacciones
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    
    FOREIGN KEY (id_proveedor) 
        REFERENCES Proveedores(id_proveedor)
        -- Si se elimina el proveedor, el registro de transacción
        -- permanece, pero este campo se vuelve NULL.
        ON DELETE SET NULL 
        ON UPDATE CASCADE 
);