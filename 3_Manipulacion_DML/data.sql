-- Lenguaje de Manipulación de Datos (DML)
-- Este script inserta, actualiza y elimina datos en las tablas.
-- NOTA: Estos IDs (1, 2, 3...) funcionarán porque las tablas
-- fueron creadas con AUTO_INCREMENT.

-- REQ 3: Implementar consultas de inserción (INSERT)
INSERT INTO Proveedores (nombre, direccion, telefono, email) VALUES
('Electro Depot Ltda.', 'Avenida Central 456, Ciudad B', '555-5678', 'contacto@electrodepot.net'),
('Proveedores S.A.', 'Calle Falsa 123', '987-654-321', 'contacto@proveedores.com');

INSERT INTO Productos (nombre, descripcion, precio, cantidad_inventario) VALUES
('Camara Web HD', 'Camara web con microfono integrado.', 35.75, 200),
('Disco Duro Externo 1TB', 'Almacenamiento portatil USB 3.0.', 60.00, 110),
('Laptop Gaming', 'Laptop potente para juegos. Pantalla 15.6."', 1200.00, 25);

-- -------------------------------------------------------------
-- Ejemplos de DML para resolver problemas
-- -------------------------------------------------------------

-- REQ 3: Ejemplo de INSERCIÓN (Registrar una Venta)
-- Se registra la venta de 5 unidades del producto 'Camara Web HD' (id_producto=1)
INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('Venta', CURDATE(), 5, 1, NULL); -- id_proveedor es NULL porque es Venta

-- REQ 3: Ejemplo de ACTUALIZACIÓN (Actualizar el Inventario)
-- Se descuenta el stock del producto vendido (id_producto=1)
UPDATE Productos
SET cantidad_inventario = cantidad_inventario - 5
WHERE id_producto = 1;
-- Nuevo inventario de Camara Web HD: 200 - 5 = 195.

-- REQ 3: Ejemplo de ELIMINACIÓN (Eliminar un producto)
-- Intenta eliminar el producto 'Disco Duro Externo 1TB' (id_producto=2)
-- (Esta consulta es segura, no se borrará si ya tiene transacciones).
DELETE FROM Productos WHERE id_producto = 2; 
-- Si el producto 2 ya tiene registros en 'Transacciones', 
-- la operación fallará debido al 'ON DELETE RESTRICT' (ver schema.sql),
-- protegiendo así la integridad del historial.