CREATE DATABASE pedidos;

USE pedidos;


CREATE TABLE Cliente (
    NumCliente INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50),
    CONSTRAINT pk_Cliente PRIMARY KEY (NumCliente)
);
GO
 
CREATE TABLE Pedido (
    NumPedido INT IDENTITY(1,1) NOT NULL,
    FechaPedido DATE NOT NULL,
    NumCliente INT NOT NULL,
    CONSTRAINT pk_Pedido PRIMARY KEY (NumPedido),
    CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (NumCliente)
        REFERENCES Cliente (NumCliente)
);
GO
 

CREATE TABLE Producto (
    NumProducto INT IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_Producto PRIMARY KEY (NumProducto),
    CONSTRAINT uq_Producto_Nombre UNIQUE (Nombre)
);
GO


CREATE TABLE DetallePedido (
    NumPedido INT NOT NULL,
    NumProducto INT NOT NULL,
    PrecioVenta DECIMAL(10,2) NOT NULL,
    CantidadVendida INT NOT NULL,
    CONSTRAINT pk_DetallePedido PRIMARY KEY (NumPedido, NumProducto),
    CONSTRAINT fk_DetallePedido_Pedido FOREIGN KEY (NumPedido)
        REFERENCES Pedido (NumPedido),
    CONSTRAINT fk_DetallePedido_Producto FOREIGN KEY (NumProducto)
        REFERENCES Producto (NumProducto)
);
GO


 