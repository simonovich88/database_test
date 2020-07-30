CREATE TABLE cliente(
id_cliente SERIAL PRIMARY KEY,
nombre_cliente VARCHAR(20),
rut VARCHAR(15) NOT NULL,
direccion VARCHAR (100)
);

CREATE TABLE factura(
numero_factura SERIAL PRIMARY KEY,
fecha_factura DATE,
subtotal FLOAT,
id_cliente INT REFERENCES cliente(id_cliente)
);

CREATE TABLE categoria(
id_categoria SERIAL PRIMARY KEY,
nombre_categoria VARCHAR(20) NOT NULL,
descripcion VARCHAR (100)
);

CREATE TABLE producto(
id_item SERIAL PRIMARY KEY,
nombre_item VARCHAR(20),
descripcion VARCHAR (100),
valor_unitario FLOAT NOT NULL,
id_categoria INT REFERENCES categoria(id_categoria)
);

CREATE TABLE rel_producto_factura(
id_item INT REFERENCES producto(id_item),	
id_factura INT REFERENCES factura(numero_factura),
cantidad INT NOT NULL 
);


INSERT INTO cliente(nombre_cliente, rut, direccion)
VALUES('cliente_1', '12.456.390-K','direccion_1');

INSERT INTO cliente(nombre_cliente, rut, direccion)
VALUES('cliente_2', '12.456.391-K','direccion_2');

INSERT INTO cliente(nombre_cliente, rut, direccion)
VALUES('cliente_3', '12.456.392-3','direccion_3');

INSERT INTO cliente(nombre_cliente, rut, direccion)
VALUES('cliente_4', '12.456.399-6','direccion_4');

INSERT INTO cliente(nombre_cliente, rut, direccion)
VALUES('cliente_5', '12.387.763-3','direccion_5');

INSERT INTO categoria(nombre_categoria, descripcion)
VALUES('cat_1', 'categoria_1');

INSERT INTO categoria(nombre_categoria, descripcion)
VALUES('cat_2', 'categoria_2');

INSERT INTO categoria(nombre_categoria, descripcion)
VALUES('cat_3', 'categoria_3');

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_1', 'descripcion_producto_1',1500,1);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_2', 'descripcion_producto_2',2000,2);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_3', 'descripcion_producto_3',2500,3);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_4', 'descripcion_producto_4',1000,1);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_5', 'descripcion_producto_5',1500,2);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_6', 'descripcion_producto_6',2000,3);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_7', 'descripcion_producto_7',2500,2);

INSERT INTO producto(nombre_item, descripcion, valor_unitario,id_categoria)
VALUES('producto_8', 'descripcion_producto_8',4000,1);

--facturas (2) para cliente_1

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2001-10-05',3500,1);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2002-08-19',6000,1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(1, 1, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(2, 1, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(1, 2, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(2, 2, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(3, 2, 1);

--facturas (3) para cliente_2

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2013-04-03',5000,2);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2015-07-07',4000,2);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2019-08-01',8500,2);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(1, 3, 2);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(2, 3, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(7, 4, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(5, 4, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(6, 5, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(7, 5, 1);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(8, 5, 1);

--facturas (1) para cliente_3

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2016-12-20',1500,3);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(1, 6, 1);

--facturas (4) para cliente_4

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2015-06-03',4000,4);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2017-06-05',4500,4);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2018-08-12',12000,4);

INSERT INTO factura(fecha_factura, subtotal, id_cliente)
VALUES('2019-09-17',1500,4);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(2, 8, 2);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(5, 9, 3);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(6, 10, 2);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(8, 10, 2);

INSERT INTO rel_producto_factura(id_item, id_factura, cantidad)
VALUES(5, 11, 1);


--parte 3:Consultas

--1-¿Que cliente realizó la compra más cara?

SELECT id_cliente FROM factura WHERE subtotal =(SELECT MAX (subtotal) FROM factura);

--2-¿Que cliente pagó sobre 100 de monto?

SELECT id_cliente, MAX (subtotal) FROM factura GROUP BY	id_cliente HAVING MAX(subtotal) > 100;

--3-¿Cuantos clientes han comprado el producto 6?

SELECT COUNT (id_cliente) AS cantidad_de_clientes_prod_6 FROM factura INNER JOIN rel_producto_factura ON factura.numero_factura=rel_producto_factura.id_factura AND id_item=6;

