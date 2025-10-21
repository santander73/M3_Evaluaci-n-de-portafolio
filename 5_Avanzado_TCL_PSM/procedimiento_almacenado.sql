-- Programación de Base de Datos (Stored Procedure)
-- Encapsula la lógica de negocio (transacción) en una rutina reutilizable.

DELIMITER //

-- Este procedimiento combina DML y TCL (Transacciones)
CREATE PROCEDURE sp_RegistrarCompra(
    IN p_id_producto INT,
    IN p_id_proveedor INT,
    IN p_cantidad INT
)
BEGIN
    -- Manejador de errores para SQL (atrapa cualquier excepción)
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK; -- Deshace todo si algo falla
        SELECT 'Error: No se pudo registrar la compra. Transacción revertida.' AS resultado;
    END;

    -- Inicia la transacción atómica
    START TRANSACTION;

    -- 1. Registrar la compra en Transacciones
    INSERT INTO Transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
    VALUES ('Compra', CURDATE(), p_cantidad, p_id_producto, p_id_proveedor);
    
    -- 2. Actualizar el inventario
    UPDATE Productos
    SET cantidad_inventario = cantidad_inventario + p_cantidad
    WHERE id_producto = p_id_producto;

    -- Si todo va bien, confirma los cambios
    COMMIT;
    SELECT 'Compra registrada y stock actualizado con éxito.' AS resultado;

END //

DELIMITER ;

-- Cómo usarlo:
-- CALL sp_RegistrarCompra(2, 1, 15); -- Compra 15 unidades del producto 2, del proveedor 1.