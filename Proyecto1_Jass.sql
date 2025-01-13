CREATE DATABASE BDFin;
USE BDFin;
DROP DATABASE BDFin;
CREATE DATABASE Bdfin;
USE Bdfin;
SELECT * FROM activos;
SELECT * FROM precios;
DROP TABLE precios;
SELECT * FROM precios;
DROP TABLE precios;
SELECT * FROM Precios;
SELECT fecha_oper, precio_cierre
FROM precios
WHERE activo_id = 3 AND precio_cierre = (SELECT MAX(precio_cierre) FROM precios WHERE activo_id = 3);
SELECT *
FROM Precios AS pe
JOIN activos ON activos.activo_id = precios.activo_id;
SELECT * FROM precios;
DESCRIBE TABLE precios;
DROP TABLE precios;

CREATE TABLE precios;
DROP TABLE precios;

CREATE TABLE precios (
    precio_id INT AUTO_INCREMENT PRIMARY KEY,
    activo_id INT,
    fecha_oper DATE NOT NULL,
    precio_apertura DECIMAL(10, 2),
    precio_cierre DECIMAL(10, 2),
    precio_maximo DECIMAL(10, 2),
    precio_minimo DECIMAL(10, 2),
    FOREIGN KEY (activo_id) REFERENCES activos(activo_id)
);
SELECT * FROM precios;

CREATE TABLE activos (
    activo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_activo VARCHAR(50) NOT NULL
);

CREATE TABLE precios (
    id_precio INT AUTO_INCREMENT PRIMARY KEY,
    id_activo INT,
    fecha DATE NOT NULL,
    precio_apertura DECIMAL(10, 2),
    precio_cierre DECIMAL(10, 2),
    precio_maximo DECIMAL(10, 2),
    precio_minimo DECIMAL(10, 2),
    FOREIGN KEY (id_activo) REFERENCES activos(id_activo)
);
USE bdfin;
# CONSULTAS DE PRUEBA

# 1. Rendimiento diario de cada activo

SELECT activos.nombre_activo, precios.fecha_oper,
(
(precios.precio_cierre - precios.precio_apertura) / (precios.precio_apertura) *100 ) AS rendimiento
FROM precios
JOIN activos ON activos.activo_id = precios.activo_id;

# Consulta 2. Volatilidad del S&P 500

SELECT fecha_oper,
    (precio_maximo - precio_minimo) AS volatilidad
FROM precios
WHERE activo_id = 1
ORDER BY volatilidad DESC
LIMIT 1;

# Consulta 3. Precio promedio de cierre del oro en noviembre de 2024

SELECT AVG(precio_cierre) AS precio_promedio_cierre
FROM precios
WHERE activo_id = 3 AND fecha_oper BETWEEN '2024-11-01' AND '2024-11-30';

# Consulta 4. Encontrar el día entre el primero de noviembre y el 12 de diciembre de 2024,
# en que el oro tuvo el precio de cierre más alto

SELECT fecha_oper, precio_cierre
FROM precios
WHERE activo_id = 3 AND precio_cierre = (
SELECT MAX(precio_cierre) FROM precios WHERE activo_id = 3);
