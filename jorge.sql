DROP DATABASE IF EXISTS libreria_db;

CREATE DATABASE libreria_db;
USE libreria_db;

CREATE TABLE Clientes
(
  id_cliente        INT          NOT NULL AUTO_INCREMENT,
  nombre_cliente    VARCHAR(20)  NOT NULL,
  correo_cliente    VARCHAR(100) NOT NULL,
  telefono_cliente  VARCHAR(15)  NOT NULL,
  direccion_cliente VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE Detalles_Pedido
(
  id_detalle     INT           NOT NULL AUTO_INCREMENT,
  cantidad_libro INT           NOT NULL,
  precio_libro   DECIMAL(10,2) NOT NULL,
  id_pedido      INT           NOT NULL,
  id_libro       INT           NOT NULL,
  PRIMARY KEY (id_detalle)
);

CREATE TABLE Libros
(
  id_libro            INT           NOT NULL AUTO_INCREMENT,
  titulo_libro        VARCHAR(255)  NOT NULL,
  autor_libro         VARCHAR(100)  NOT NULL,
  precio_libro        DECIMAL(10,2) NOT NULL,
  cantidad_disponible INT           NOT NULL,
  categoria_libro     VARCHAR(50)   NOT NULL,
  PRIMARY KEY (id_libro)
);

CREATE TABLE Pagos
(
  id_pago     INT           NOT NULL AUTO_INCREMENT,
  id_pedido   INT           NOT NULL,
  fecha_pago  DATE          NOT NULL,
  monto_pago  DECIMAL(10,2) NOT NULL,
  metodo_pago VARCHAR(50)   NOT NULL,
  PRIMARY KEY (id_pago)
);

CREATE TABLE Pedidos
(
  id_pedido      INT           NOT NULL AUTO_INCREMENT,
  id_cliente     INT           NOT NULL,
  id_libro       INT           NOT NULL,
  cantidad_libro INT           NOT NULL,
  precio_libro   DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_pedido)
);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Clientes_TO_Pedidos
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Libros_TO_Pedidos
    FOREIGN KEY (id_libro)
    REFERENCES Libros (id_libro);

ALTER TABLE Pagos
  ADD CONSTRAINT FK_Pedidos_TO_Pagos
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id_pedido);

ALTER TABLE Detalles_Pedido
  ADD CONSTRAINT FK_Pedidos_TO_Detalles_Pedido
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id_pedido);

ALTER TABLE Detalles_Pedido
  ADD CONSTRAINT FK_Libros_TO_Detalles_Pedido
    FOREIGN KEY (id_libro)
    REFERENCES Libros (id_libro);



INSERT INTO Clientes (nombre_cliente, correo_cliente, telefono_cliente, direccion_cliente) VALUES
('Juan Perez', 'gNl0N@example.com', '1234567890', 'Calle 123'),
('Maria Gomez', 'iHtD8@example.com', '9876543210', 'Avenida 456'),
('Carlos Sanchez', 'cDm0q@example.com', '5555555555', 'Plaza 789'),
('Ana Martinez', 'M3K9w@example.com', '1111111111', 'Calle 321'),   
('Luis Rodriguez', 'kDQlM@example.com', '9999999999', 'Avenida 654');

INSERT INTO Libros (titulo_libro, autor_libro, precio_libro, cantidad_disponible, categoria_libro) VALUES
('El Quijote', 'Miguel de Cervantes', 19.99, 10, 'Novela'),
('Cien Años de Soledad', 'Gabriel Garcia Marquez', 15.50, 5, 'Realismo Magico'),
('La Sombra del Viento', 'Carlos Ruiz Zafon', 12.75, 8, 'Misterio'),
('Donde los Árboles Cantan', 'Laura Gallego', 9.99, 20, 'Fantasía'),
('El Principito', 'Antoine de Saint-Exupéry', 7.50, 15, 'Infantil');

INSERT INTO Pedidos (id_cliente, id_libro, cantidad_libro, precio_libro) VALUES
(1, 1, 1, 19.99),
(2, 2, 2, 31.00),
(3, 3, 1, 12.75),
(4, 4, 3, 29.97),
(5, 5, 1, 7.50),
(1, 2, 1, 15.50),
(2, 3, 1, 12.75),
(3, 4, 2, 19.98),
(4, 5, 1, 7.50),
(5, 1, 1, 19.99),
(1, 3, 1, 12.75),
(2, 4, 1, 9.99),
(3, 5, 2, 15.00),
(4, 1, 1, 19.99),
(5, 2, 1, 15.50);

INSERT INTO Detalles_Pedido (cantidad_libro, precio_libro, id_pedido, id_libro) VALUES
(1, 19.99, 1, 1),
(2, 15.50, 2, 2),
(1, 12.75, 3, 3),
(3, 9.99, 4, 4),
(1, 7.50, 5, 5),
(1, 15.50, 6, 2),
(1, 12.75, 7, 3),
(2, 9.99, 8, 4),
(1, 7.50, 9, 5),
(1, 19.99, 10, 1),
(1, 12.75, 11, 3),
(1, 9.99, 12, 4),
(2, 7.50, 13, 5),
(1, 19.99, 14, 1),
(1, 15.50, 15, 2);

INSERT INTO Pagos (id_pedido, fecha_pago, monto_pago, metodo_pago) VALUES
(1, '2024-01-15', 19.99, 'Tarjeta de Crédito'),
(2, '2024-01-16', 31.00, 'PayPal'),
(3, '2024-01-17', 12.75, 'Tarjeta de Débito'),
(4, '2024-01-18', 29.97, 'Efectivo'),
(5, '2024-01-19', 7.50, 'Tarjeta de Crédito'),
(6, '2024-01-20', 15.50, 'PayPal'),
(7, '2024-01-21', 12.75, 'Tarjeta de Débito'),
(8, '2024-01-22', 19.98, 'Efectivo'),
(9, '2024-01-23', 7.50, 'Tarjeta de Crédito'),
(10, '2024-01-24', 19.99, 'PayPal'),
(11, '2024-01-25', 12.75, 'Tarjeta de Débito'),
(12, '2024-01-26', 9.99, 'Efectivo'),
(13, '2024-01-27', 15.00, 'Tarjeta de Crédito'),
(14, '2024-01-28', 19.99, 'PayPal'),
(15, '2024-01-29', 15.50, 'Tarjeta de Débito');


CREATE DATABASE libreria_db;
USE libreria_db;


CREATE TABLE Clientes
(
  id_cliente        INT          NOT NULL AUTO_INCREMENT,
  nombre_cliente    VARCHAR(20)  NOT NULL,
  correo_cliente    VARCHAR(100) NOT NULL,
  telefono_cliente  VARCHAR(15)  NOT NULL,
  direccion_cliente VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE Libros
(
  id_libro            INT           NOT NULL AUTO_INCREMENT,
  titulo_libro        VARCHAR(255)  NOT NULL,
  autor_libro         VARCHAR(100)  NOT NULL,
  precio_libro        DECIMAL(10,2) NOT NULL,
  cantidad_disponible INT           NOT NULL,
  categoria_libro     VARCHAR(50)   NOT NULL,
  PRIMARY KEY (id_libro)
);

CREATE TABLE Pagos
(
  id_pago     INT           NOT NULL AUTO_INCREMENT,
  id_pedido   INT           NOT NULL,
  fecha_pago  DATE          NOT NULL,
  monto_pago  DECIMAL(10,2) NOT NULL,
  metodo_pago VARCHAR(50)   NOT NULL,
  PRIMARY KEY (id_pago)
);

CREATE TABLE Pedidos
(
  id_pedido      INT           NOT NULL AUTO_INCREMENT,
  id_cliente     INT           NOT NULL,
  id_libro       INT           NOT NULL,
  cantidad_libro INT           NOT NULL,
  precio_libro   DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_pedido)
);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Clientes_TO_Pedidos
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);

ALTER TABLE Pedidos
  ADD CONSTRAINT FK_Libros_TO_Pedidos
    FOREIGN KEY (id_libro)
    REFERENCES Libros (id_libro);

ALTER TABLE Pagos
  ADD CONSTRAINT FK_Pedidos_TO_Pagos
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id_pedido);
