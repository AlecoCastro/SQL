/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto). */

CREATE TABLE IF NOT EXISTS clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	email VARCHAR (255) NOT NULL
); 

  /* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com". */

INSERT INTO public.clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com');

/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */

UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */

DELETE FROM clientes
WHERE id = 1;

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). */ 

CREATE TABLE IF NOT EXISTS pedidos(
	id INT PRIMARY KEY,
	cliente_id INT NOT NULL,
	CONSTRAINT FK_clientes FOREIGN KEY (id) REFERENCES clientes (id),
	producto VARCHAR (255) NOT NULL,
	cantidad INT NOT NULL
	);

	/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2. */

INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2)

	/*Al insertar este pedido me sale este error:

ERROR:  La llave (cliente_id)=(1) no está presente en la tabla «clientes».inserción o actualización en la tabla «pedidos» viola la llave foránea «fk_cliente_id» 

ERROR:  inserción o actualización en la tabla «pedidos» viola la llave foránea «fk_cliente_id»
SQL state: 23503
Detail: La llave (cliente_id)=(1) no está presente en la tabla «clientes».

Procedí a volver insertar el cliente para que pudiera funcionar la incerción del nuevo pedido. */

INSERT INTO public.clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@gmail.com');

INSERT INTO public.pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

/* 7. Actualizar la cantidad del pedido con id=1 a 3. */

UPDATE public.pedidos
SET cantidad = 3
WHERE id = 1;

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM pedidos
WHERE id = 1;

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal). */

CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY,
	nombre VARCHAR (255) NOT NULL,
	precio DECIMAL NOT NULL
);

/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

INSERT INTO public.productos (id, nombre, precio)
VALUES (1, 'Camiseta', 10.99),
(2, 'Pantalon', 15.99),(3, 'Falda', 14.99),
(4, 'Sandalias', 12.99), (5, 'Sombrero', 9.99);

/* 11. Consultar todos los clientes de la tabla "Clientes". */

SELECT * FROM public.clientes

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */

SELECT * FROM public.pedidos
LEFT JOIN public.clientes
ON public.pedidos.id = public.clientes.id

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */

SELECT * FROM public.productos
WHERE precio > 50

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */

SELECT * FROM public.pedidos
WHERE cantidad >= 5

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */

SELECT * FROM public.clientes
WHERE nombre ILIKE 'a%'

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */

SELECT c.id AS id,
c.nombre AS nombre,
p.cantidad AS pedidos
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id = p.id

/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */

SELECT pr.id AS id,
pr.nombre AS nombre,
p.cantidad AS pedidos
FROM public.productos pr
LEFT JOIN public.pedidos p
ON pr.id = p.id

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */

ALTER TABLE public.pedidos
ADD fecha DATE;

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". FALTA */ 

ALTER TABLE public.pedidos
ADD CONSTRAINT fk_producto 
FOREIGN KEY (id)
REFERENCES productos (id)

/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */

SELECT c.id AS id,
c.nombre AS nombre,
p.nombre AS producto,
pe.cantidad as cantidad
FROM public.clientes c
LEFT JOIN public.productos p
ON c.id = p.id
LEFT JOIN public.pedidos pe
ON c.id = pe.id;
