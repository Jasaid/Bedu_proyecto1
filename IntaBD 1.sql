USE metro;
SELECT * FROM consolidado;
DESCRIBE consolidado;
DESCRIBE estaciones;
SELECT * FROM estaciones;
SELECT *
FROM consolidado;
# Presenta las estaciones cuya afluencia sea mayor que "0"
SELECT id_consolidado, afluencia
FROM consolidado
WHERE afluencia > 0;
SELECT COUNT(*)
FROM consolidado
WHERE afluencia > 0;

USE tienda;

# Seleccionar todos los usuarios de la tabla Usuarios y mostrar sus nombres y correos electrónicos
SELECT *
FROM Usuarios;
SELECT nombre, correo_electronico
FROM Usuarios;

# RETO
# Consulta 1: Selecciona todos los campos de la tabla Productos.
SELECT *
FROM Productos;
# Consulta 2: Selecciona todos los campos de la tabla Pedidos.
SELECT *
FROM Pedidos;

#FILTRADO
# Usuarios mayores a 30 años:
SELECT *
FROM Usuarios;
SELECT user_id, edad
FROM Usuarios
WHERE edad > 30;
# Productos cuyo precio es menor a 100:
SELECT * 
FROM Productos;
SELECT nombre_producto, precio
FROM Productos
WHERE precio < 100;
# Pedidos hechos en el 2023 y cuyo total es mayor a 100.
SELECT *
FROM Pedidos;
SELECT pedido_id, fecha_pedido, total_pedido
FROM Pedidos
WHERE YEAR(fecha_pedido) = 2023 AND total_pedido > 100;
# Usuarios de 19 a 64 años de edad.
SELECT *
FROM Usuarios;
SELECT user_id, edad
FROM Usuarios
WHERE edad BETWEEN 19 AND 64;
# Productos cuyo stock disponible sea igual o menor a 0 (los que estén agotados).
SELECT producto_id, nombre_producto, stock_disponible
FROM Productos
WHERE stock_disponible <= 0;

# RETO
# Consulta 1: Obtén todos los pedidos realizados dentro del año 2024.
SELECT pedido_id, fecha_pedido
FROM Pedidos
WHERE YEAR(fecha_pedido) = 2024
ORDER BY fecha_pedido  ASC;
# Consulta 2: Selecciona todos los usuarios cuya edad esté en los cuarentas.
SELECT *
FROM Usuarios;
SELECT user_id, nombre, edad
FROM Usuarios
WHERE edad BETWEEN 40 AND 49;
# Consulta 3: Selecciona todos los usuarios cuyo registro no haya sido durante el año 2020. No puedes usar el operador !=.
SELECT user_id, nombre, apellido, fecha_registro
FROM Usuarios
WHERE fecha_registro < '2020-01-01' AND fecha_registro > '2020-12-31';

# Consulta 4: Selecciona todos todos los pedidos realizados dentro del año 2023 o aquellos cuyo total_pedido sea mayor a 100.
SELECT *
FROM Pedidos;
SELECT pedido_id, fecha_pedido, total_pedido
FROM Pedidos
WHERE YEAR(fecha_pedido) = 2023 OR total_pedido > 100;
SELECT total_pedido
FROM Pedidos
WHERE total_pedido BETWEEN 100 AND 150;
# Selecciona todos los usuarios cuya edad sea mayor o igual a 18 años
# y cuya fecha de registro sea en octubre de cualquier año.
SELECT user_id, nombre, edad, fecha_registro
FROM Usuarios
WHERE edad >= 18 AND MONTH(fecha_registro) = 10;

# ORDENAMIENTOS
# Ordenar los productos por el precio. Intenta quitar el ASC
SELECT producto_id, nombre_producto, descripcion, precio
FROM Productos
WHERE precio = precio
ORDER BY precio ASC;
# Pedidos ordenados por fecha de pedido de forma descendente.
SELECT producto_id, nombre_producto, descripcion, precio
FROM Productos
ORDER BY precio DESC;
# Lista de usuarios ordenados por su edad de forma ascendente y
# para aquellos que tienen la misma edad, ordenarlos por su fecha de registro de forma descendente.
SELECT user_id, nombre, apellido, edad, fecha_registro
FROM Usuarios
ORDER BY edad ASC, 
fecha_registro DESC;
# Obtener una lista de detalles de pedidos ordenados por el identificador del pedido de forma ascendente
# la cantidad de productos en el pedido de forma descendente y
# para aquellos detalles de pedidos con la misma cantidad, ordenarlos por su precio unitario de forma ascendente.
SELECT detalle_id, pedido_id, precio_unitario
FROM Detalles_Pedido
ORDER BY pedido_id DESC,
precio_unitario ASC;

/* POSTWORK 1. Usuarios Jóvenes Registrados Recientemente:
Selecciona el nombre y apellido de los usuarios que tienen menos de 30 años y se registraron después del 1 de eneo de 2020.
Ordena los resultados por fecha de registro en orden descendente. */
SELECT nombre, apellido, edad, fecha_registro
FROM Usuarios
WHERE edad < 30 AND fecha_registro > '2020-01-01'
ORDER BY fecha_registro DESC;

/* POSTWORK 2. Productos Económicos y con Stock Disponible:
Obtén el nombre y precio de los productos que tienen un stock disponible mayor o igual a 10
 y cuyo precio sea menor o igual a $50. Ordena los resultados por precio en orden ascendente. */
SELECT producto_id, nombre_producto, precio, stock_disponible
FROM Productos
WHERE stock_disponible >= 10 AND precio <= 50
ORDER BY precio ASC;

/* POSTWORK 3. Pedidos Grandes Realizados Antes de una Fecha Específica:
Recupera el identificador del pedido, fecha del pedido y total del pedido
para aquellos pedidos realizados antes del 1 de enero de 2024 y cuyo total del pedido sea mayor a $100.
Ordena los resultados por fecha del pedido en orden descendente. */
 SELECT pedido_id, fecha_pedido, total_pedido
 FROM Pedidos
 WHERE fecha_pedido < '2024-01-01' AND total_pedido > 100
 ORDER BY fecha_pedido DESC;
 
/* POSTWORK 4. 4. Categorías de Productos Electrónicos:
Muestra la descripción del producto y el stock disponible de aquellos productos que tengan menos de 10 piezas disponibles en stock.
Ordena alfabéticamente los resultados. */
SELECT producto_id, nombre_producto, descripcion, stock_disponible
FROM Productos
WHERE stock_disponible < 10
ORDER BY nombre_producto ASC;

/* POSTWORK 5. Usuarios con Correo Electrónico en Gmail y Pedidos Recientes:
Obtén los correos electrónicos de los usuarios que son parte de la Tercera Edad
y se hayan registrado en el último mes de información.
Ordena alfabéticamente los resultados por dirección de correo electrónico. */
SELECT user_id, nombre, apellido, edad, correo_electronico, fecha_registro
FROM Usuarios
WHERE edad >= 60 AND fecha_registro >= '2024-01-01'
ORDER BY correo_electronico ASC;

USE tienda;
SELECT * FROM Usuarios;










