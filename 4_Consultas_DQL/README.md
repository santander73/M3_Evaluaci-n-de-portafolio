# 4. Consultas de Datos (DQL)

El archivo `consultas.sql` contiene sentencias de **Lenguaje de Consulta de Datos (DQL)** para satisfacer requerimientos de información (REQ 2).

Demuestra el uso de:

* `SELECT`/`FROM`/`WHERE`: Para filtrado básico.
* `INNER JOIN`: Para combinar datos de múltiples tablas (ej. `Transacciones` y `Productos`).
* `SUM()` y `GROUP BY`: Para generar reportes y agregaciones.
* Funciones: `CURDATE()`, `DATE_SUB()`, `LAST_DAY()` para manipulación de fechas.
* `DISTINCT`: Para obtener valores únicos (ej. lista de proveedores).
* Subconsultas (`NOT IN`): Para realizar filtrados complejos (ej. productos que no están en la lista de ventas recientes).
