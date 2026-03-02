CREATE TABLE empresas (
    id_empresa INT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150) NOT NULL
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    email_empleado VARCHAR(100) UNIQUE NOT NULL,
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);


CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE contratos (
    id_contrato VARCHAR(20) PRIMARY KEY,
    pago_total DECIMAL(10,2) NOT NULL,
    id_empresa INT,
    id_cliente INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE contrato_servicio (
    id_contrato VARCHAR(20),
    id_servicio INT,
    PRIMARY KEY (id_contrato, id_servicio),
    FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);