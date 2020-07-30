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