# Proyecto de Portafolio: Base de Datos de Inventario (InventarioDB)

Este repositorio demuestra las competencias técnicas en el diseño, implementación y gestión de bases de datos relacionales. El proyecto simula un sistema de inventario, productos y proveedores, implementado en SQL (MySQL).

Este proyecto va más allá de las operaciones básicas (CRUD) para incluir conceptos avanzados como **transacciones atómicas (TCL)**, **integridad referencial (Constraints)** y **procedimientos almacenados (PSM)**.

## Competencias Demostradas

1. **Fundamentos de Bases de Datos Relacionales (REQ 1):** Comprensión de tablas, campos, registros, claves primarias (PK), claves foráneas (FK) y su rol en la integridad de los datos.
2. **Modelado de Datos (REQ 5):** Diseño de un Diagrama Entidad-Relación (ER) que representa la lógica del negocio.
3. **Lenguaje de Definición de Datos (DDL - REQ 4):** Creación de la estructura de la base de datos (`CREATE TABLE`) con restricciones avanzadas (`CHECK`, `UNIQUE`, `FOREIGN KEY`, `ON DELETE`).
4. **Lenguaje de Manipulación de Datos (DML - REQ 3):** Inserción (`INSERT`), actualización (`UPDATE`) y eliminación (`DELETE`) de registros.
5. **Lenguaje de Consulta de Datos (DQL - REQ 2):** Obtención de información mediante consultas (`SELECT`), uniones (`JOIN`), agregaciones (`GROUP BY`, `SUM`) y subconsultas.
6. **Programación y Control de Transacciones:** Implementación de lógica de negocio encapsulada en Procedimientos Almacenados y garantía de atomicidad con Transacciones (`BEGIN`, `COMMIT`, `ROLLBACK`).

## Estructura del Repositorio

.../ ├── 1_Modelo_Datos/ │ ├── modelo_ER_inventario.png (Diagrama Entidad-Relación) │ └── README.md (Explicación del modelo y conceptos) | ├── 2_Definicion_DDL/ │ ├── schema.sql (Script CREATE DATABASE/TABLE) │ └── README.md (Explicación DDL y constraints) | ├── 3_Manipulacion_DML/ │ ├── data.sql (Script INSERT, UPDATE, DELETE) │ └── README.md (Explicación DML) | ├── 4_Consultas_DQL/ │ ├── consultas.sql (Script SELECT...FROM...WHERE...) │ └── README.md (Explicación de las consultas) | └── 5_Avanzado_TCL_PSM/ ├── transaccion_atomicidad.sql (Ejemplo de BEGIN/COMMIT/ROLLBACK) ├── procedimiento_almacenado.sql (Ejemplo de CREATE PROCEDURE) └── README.md (Explicación de conceptos avanzados) | └── README.md (Este archivo)...
