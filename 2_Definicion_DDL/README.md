# 2. Definición de Datos (DDL)

El archivo `schema.sql` contiene todas las sentencias de **Lenguaje de Definición de Datos (DDL)**.

Estas sentencias se utilizan para **CREAR** la estructura de la base de datos (REQ 4).

## Puntos Destacados

* `CREATE TABLE`: Define las tres tablas (`Productos`, `Proveedores`, `Transacciones`).
* **Constraints (Restricciones):** Se usan para garantizar la integridad y calidad de los datos:
  * `PRIMARY KEY AUTO_INCREMENT`: Asigna un ID único y secuencial automáticamente.
  * `NOT NULL`: Asegura que el campo siempre tenga un valor.
  * `CHECK`: Valida que el dato cumpla una condición (ej. `precio > 0`).
  * `UNIQUE`: Impide que existan dos registros con el mismo valor (ej. `email`).
  * `ENUM`: Limita los valores posibles a una lista definida (ej. 'Compra' o 'Venta').
* **Integridad Referencial (Foreign Keys):**
  * `ON DELETE RESTRICT`: Impide que se elimine un producto si tiene transacciones asociadas. Esto es vital para mantener el historial.
  * `ON DELETE SET NULL`: Si un proveedor es eliminado, su ID en la tabla de transacciones se establecerá en `NULL`, pero la transacción no se borrará.
  * `ON UPDATE CASCADE`: Si el ID de un producto o proveedor cambia (raro, pero posible), ese cambio se reflejará automáticamente en todas las transacciones asociadas.
