/* Ejercicios 3 - Nivel de dificultad: Difícil

1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS Productos(
  id INT PRIMARY KEY,
  nombre VARCHAR (255) NOT NULL,
  precio DECIMAL NOT NULL
);

/* 2. Inserta al menos cinco registros en la tabla "Productos".*/

INSERT INTO public.productos (id, nombre, precio)
VALUES (1, 'Mesa', 49.99), (2, 'Silla', 14.99), 
(3, 'Somiere', 34.99), (4, 'Sofá', 129.99), (5, 'Estante', 74.99);

/*3. Actualiza el precio de un producto en la tabla "Productos".*/

UPDATE productos
SET precio = 19.99
WHERE nombre = 'Silla';

/*4. Elimina un producto de la tabla "Productos".*/

DELETE FROM public.productos
WHERE id = 2;


/*5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos"). */

SELECT U.id AS id,
U.nombre AS nombre,
P.nombre AS Producto
FROM public.usuarios U
INNER JOIN public.productos P
ON U.id = P.id;