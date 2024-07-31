/* Nivel de dificultad: Fácil
1. Crea una base de datos llamada "MiBaseDeDatos".
2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */

CREATE TABLE IF NOT EXISTS  Usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	edad INT NOT NULL
);

/* 3. Inserta dos registros en la tabla "Usuarios".*/

INSERT INTO public.usuarios (id, nombre, edad)
VALUES (1, 'Jessica', 24), (2, 'Scarlett', 23);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios" */

UPDATE public.usuarios
SET edad = 22
Where id = 1;

/* 5. Elimina un usuario de la tabla "Usuarios". */

DELETE FROM usuarios
WHERE id = 2;

/* Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */

CREATE TABLE IF NOT EXISTS ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	pais VARCHAR (255) NOT NULl
);
/* 2. Inserta al menos tres registros en la tabla "Ciudades". */

INSERT INTO public.ciudades (id, nombre, pais)
VALUES (1, 'Caracas', 'Venezuela'), (2, 'Madrid', 'España'), (3, 'Londres', 'Inglaterra');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */

ALTER TABLE public.usuarios
ADD CONSTRAINT FK_ciudades
FOREIGN KEY (id) 
REFERENCES ciudades (id);

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */

SELECT U.id AS id,
U.nombre AS nombre,
C.nombre AS ciudad,
C.pais AS pais
FROM public.Usuarios U
LEFT JOIN public.Ciudades C
ON U.id = C.id;

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN). */

SELECT U.id AS id,
U.nombre AS nombre,
C.nombre AS ciudad
FROM public.Usuarios U
INNER JOIN public.Ciudades C
ON U.id = C.id;