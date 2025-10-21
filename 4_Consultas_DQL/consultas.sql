-- Lenguaje de Consulta de Datos (DQL)
-- Este script obtiene información de la base de datos (REQ 2).

-- Consulta 1: Obtener productos con stock
-- Usa: SELECT, WHERE
SELECT id_producto, nombre, precio, cantidad_inventario
FROM Productos
WHERE cantidad_inventario > 0;

-- Consulta 2: Obtener proveedores que nos han vendido un producto específico
-- Usa: SELECT, JOIN, WHERE, DISTINCT
-- (Asumiendo que se hizo una 'Compra' del producto 2)
SELECT DISTINCT P.nombre, P.telefono
FROM Proveedores P
INNER JOIN Transacciones T ON P.id_proveedor = T.id_proveedor
WHERE T.id_producto = 2 AND T.tipo = 'Compra';

-- Consulta 3: Ver transacciones de hoy
-- Usa: SELECT, WHERE, Funciones (CURDATE)
SELECT *
FROM Transacciones
WHERE fecha = CURDATE();

-- Consulta 4: Total de productos vendidos
-- Usa: Funciones de Agregación (SUM), WHERE
SELECT SUM(cantidad) AS Total_Productos_Vendidos
FROM Transacciones
WHERE tipo = 'Venta';

-- Consulta 5: Valor total del inventario comprado (costo)
-- Usa: Agregación (SUM), JOIN, Cálculo
SELECT SUM(T.cantidad * P.precio) AS Valor_Total_Compras
FROM Transacciones T
INNER JOIN Productos P ON T.id_producto = P.id_producto
WHERE T.tipo = 'Compra';

-- Consulta 6: Reporte de ventas del mes anterior
-- Usa: JOIN, GROUP BY, SUM, Funciones de Fecha complejas (MySQL)
SELECT 
    Pr.nombre, 
    SUM(T.cantidad) AS Total_Vendidas, 
    SUM(T.cantidad * Pr.precio) AS Valor_Total_Ventas
FROM Transacciones T
INNER JOIN Productos Pr ON T.id_producto = Pr.id_producto
WHERE T.tipo = 'Venta'
  -- Filtra por el mes anterior
  AND T.fecha >= DATE_SUB(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)), INTERVAL DAYOFMONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) - 1 DAY) 
  AND T.fecha <= LAST_DAY(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) 
GROUP BY Pr.nombre;

-- Consulta 7: Productos que NO se han vendido en los últimos 30 días
-- Usa: Subconsultas (NOT IN)
SELECT id_producto, nombre
FROM Productos
WHERE id_producto NOT IN (
    SELECT DISTINCT id_producto
    FROM Transacciones
    WHERE tipo = 'Venta' AND fecha >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
);