-- Lenguaje de Control de Transacciones (TCL)
-- Garantiza la atomicidad de las operaciones.

-- Escenario: Registrar una compra de 10 'Disco Duro Externo' (id=2)
-- del proveedor 'Electro Depot Ltda.' (id=1).
-- Ambas operaciones (INSERT y UPDATE) deben ocurrir, o ninguna debe ocurrir.

BEGIN; -- Inicia la transacción

-- 1. Intenta Registrar la Compra
INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('Compra', CURDATE(), 10, 2, 1);

-- 2. Intenta Actualizar el Inventario (Aumentar stock)
UPDATE Productos
SET cantidad_inventario = cantidad_inventario + 10
WHERE id_producto = 2;

-- Si ambas operaciones tienen éxito, se confirman los cambios.
COMMIT;

/*
Si ocurriera un error en cualquiera de los pasos
(ej. el id_producto 2 no existe, o se viola una restricción),
se ejecutaría un ROLLBACK (ver procedimiento almacenado)
y la base de datos volvería al estado anterior a 'BEGIN'.
*/