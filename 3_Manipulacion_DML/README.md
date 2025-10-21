# 3. Manipulación de Datos (DML)

El archivo `data.sql` contiene sentencias de **Lenguaje de Manipulación de Datos (DML)** (REQ 3).

Estas sentencias se utilizan para gestionar los datos *dentro* de las tablas.

* `INSERT INTO`: Añade nuevos registros a las tablas.
* `UPDATE`: Modifica registros existentes (ej. actualizar el stock).
* `DELETE FROM`: Elimina registros. En el ejemplo, se demuestra cómo la integridad referencial (`ON DELETE RESTRICT`) configurada en el DDL impide borrar datos que tienen un historial.
