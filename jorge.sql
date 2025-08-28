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
