# 5. Conceptos Avanzados: TCL y Procedimientos Almacenados

Esta sección demuestra el dominio de conceptos que van más allá del SQL básico, pero que son cruciales para la integridad y eficiencia de los datos.

## TCL (Lenguaje de Control de Transacciones)

El archivo `transaccion_atomicidad.sql` demuestra el uso de `BEGIN`, `COMMIT` y `ROLLBACK`.

**¿Por qué es importante?**
Una "Compra" no es una sola consulta, son dos:

1. `INSERT` en `Transacciones`.
2. `UPDATE` en `Productos`.

Si la consulta 1 tiene éxito pero la 2 falla (ej. el servidor se reinicia), la base de datos quedaría **inconsistente** (tendríamos una compra registrada pero el stock no estaría actualizado).

`TCL` envuelve ambas operaciones en un bloque "todo o nada" (atómico). Si algo falla, `ROLLBACK` deshace todos los cambios, garantizando que la base de datos siempre esté en un estado lógico y consistente.

## Procedimientos Almacenados (PSM)

El archivo `procedimiento_almacenado.sql` muestra cómo encapsular la lógica transaccional en un `CREATE PROCEDURE`.

**Beneficios:**

1. **Reutilización:** En lugar de escribir las dos consultas (INSERT y UPDATE) cada vez, simplemente llamamos al procedimiento: `CALL sp_RegistrarCompra(2, 1, 15);`.
2. **Seguridad:** Se pueden dar permisos al usuario para `EJECUTAR` el procedimiento, sin darle permisos directos para `INSERTAR` o `ACTUALIZAR` las tablas.
3. **Atomicidad y Manejo de Errores:** Como se ve en el ejemplo, el procedimiento incluye su propio manejo de errores (`DECLARE HANDLER`). Si cualquier consulta dentro del bloque falla, automáticamente ejecuta un `ROLLBACK`, garantizando la integridad de los datos.
