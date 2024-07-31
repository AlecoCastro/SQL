/* Ejercicio 4
Nivel de dificultad: Experto
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE Pedidos(
    id INT PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id),
    id_producto INT REFERENCES productos(id)
);  


/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.*/

INSERT INTO public.pedidos (id, id_usuario, id_producto)
VALUES (1, 1, 1), (2, 1, 4), (3, 1, 5);


/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

Para garantizar que el código está correcto introduzco un usuario sin pedidos.*/

INSERT INTO usuarios (id, nombre, edad)
VALUES (2, 'Juan', 24)

SELECT u.nombre AS nombre,
COALESCE (p.nombre, 'No hay pedido') AS productos,
FROM public.usuarios u
LEFT JOIN public.productos p
ON u.id = p.id
LEFT JOIN public.pedidos pe
ON u.id = pe.id;

pe.id_usuario AS pedido

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).*/

SELECT u.nombre AS nombre,
pe.id_usuario AS pedido
FROM public.usuarios u
LEFT JOIN public.pedidos pe
ON u.id = pe.id;

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT;

UPDATE public.pedidos
SET cantidad = 2, cantidad = 4, cantidad = 6
WHERE id = 1, id = 2, = id= 3;