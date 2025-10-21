# 1. Modelo y Conceptos de la Base de Datos

Esta sección describe la arquitectura conceptual de `InventarioDB` y sus componentes fundamentales.

## Descripción del Modelo

* **Entidades:**
* `Productos`: Almacena los artículos del inventario.
* `Proveedores`: Almacena la información de los proveedores.
* `Transacciones`: Actúa como una tabla de hechos (log) que registra cada movimiento de inventario (compra o venta).
* **Relaciones:**
* **Productos (1) -> (N) Transacciones**: Un producto puede estar involucrado en muchas transacciones, pero cada transacción se refiere a un solo producto.
* **Proveedores (1) -> (N) Transacciones**: Un proveedor puede estar asociado a muchas transacciones (específicamente de 'Compra'), pero una transacción de compra se vincula a un solo proveedor.

## Componentes Básicos (REQ 1)

* **Tablas:** Son las estructuras que almacenan los datos. En este modelo: `Productos`, `Proveedores` y `Transacciones`.
* **Campos (Columnas):** Definen las propiedades de los datos (ej. `nombre`, `precio`, `tipo`).
* **Registros (Filas):** Cada instancia de dato (ej. el producto 'Laptop Gaming').
* **Clave Primaria (PK):** Identificador único para cada registro en una tabla.
* `Productos(id_producto)`
* `Proveedores(id_proveedor)`
* `Transacciones(id_transaccion)`
* **Clave Foránea (FK):** El pilar de las bases de datos relacionales. Es un campo que establece la relación al apuntar a la PK de otra tabla.
* `Transacciones(id_producto)` apunta a `Productos(id_producto)`.
* `Transacciones(id_proveedor)` apunta a `Proveedores(id_proveedor)`.
* **Gestión y Relación (REQ 1):**
    Los datos se almacenan en tablas separadas para evitar redundancia (ej. no repetimos el nombre del proveedor en cada transacción, solo su ID). La relación se establece mediante la **Clave Foránea**. Cuando queremos saber qué proveedor nos vendió un producto, usamos la FK `id_proveedor` de la tabla `Transacciones` para "buscar" la información completa en la tabla `Proveedores`
