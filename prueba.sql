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