drop database dbGamarraMarket;
CREATE DATABASE  dbGamarraMarket;
USE dbGamarraMarket;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(10),
    numero_documento VARCHAR(15) UNIQUE,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    email VARCHAR(50),
    celular VARCHAR(15),
    fecha_nacimiento DATE,
    activo BOOLEAN DEFAULT 1
);

INSERT INTO cliente   
(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento) VALUES
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@gmail.com', '998456323', STR_TO_DATE('10/02/1970', '%d/%m/%Y')), 
('CNE', '457812330', 'Alicia', 'Garcia Campos', 'alicia.garcia@gmail.com', '998459872', STR_TO_DATE('20/03/1980', '%d/%m/%Y')), 
('DNI', '15487922', 'Juana', 'Ávila Chumpitas', 'juana.avila@gmail.com', '923568741', STR_TO_DATE('06/06/1986', '%d/%m/%Y')),
('CNE', '122116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '', STR_TO_DATE('10/02/1970', '%d/%m/%Y')), 
('CNE', '088741589', 'Claudia', 'Perales Ortíz', 'claudia.perales@yahoo.com', '997845263', STR_TO_DATE('25/07/1981', '%d/%m/%Y')), 
('DNI', '45122587', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525871', STR_TO_DATE('10/10/1987', '%d/%m/%Y')), 
('CNE', '175258564', 'Brunella', 'Tarazona Guerra', 'brunella.tarazona@gmail.com', '995236741', STR_TO_DATE('06/06/1990', '%d/%m/%Y')), 
('DNI', '47142536', 'Alejandro', 'Jimenez Huapaya', '', '941525365', STR_TO_DATE('01/06/1989', '%d/%m/%Y')), 
('DNI', '15352585', 'Claudia', 'Marquez Litano', 'claudia.marquez@gmail.com', '985814723', STR_TO_DATE('01/10/1991', '%d/%m/%Y')), 
('CNE', '465772587', 'Mario', 'Rodriguez Mayo', 'mario.rodriguez@outlook.com', '912662587', STR_TO_DATE('10/11/1987', '%d/%m/%Y')), 
('CNE', '837952514', 'Luisa', 'Guerra Ibararra', 'luisa.guerra@yahoo.com', '974422136', STR_TO_DATE('21/12/1988', '%d/%m/%Y')), 
('DNI', '74142585', 'Pedro Alberto', 'Candela Valenzuela', 'pedro.candela@gmail.com', '94148525', STR_TO_DATE('30/06/1995', '%d/%m/%Y')), 
('DNI', '53298147', 'Angel Miguel', 'Rojas Avila', 'angel.rojas@outlook.com', '', STR_TO_DATE('02/03/1975', '%d/%m/%Y')), 
('DNI', '11453265', 'Hilario Fernando', 'Avila Huapaya', '', '985514326', STR_TO_DATE('02/05/2000', '%d/%m/%Y')), 
('CNE', '757472186', 'Octavio Noe', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '967223141', STR_TO_DATE('22/09/2000', '%d/%m/%Y')), 
('CNE', '558693219', 'Manolo Enrique', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '966223141', STR_TO_DATE('22/09/2000', '%d/%m/%Y')), 
('DNI', '41552567', 'Genoveva', 'Ortíz Quispe', 'genoveva.ortiz@outlook.es', '92564137', STR_TO_DATE('12/04/2003', '%d/%m/%Y')), 
('DNI', '49985471', 'Oscar Carlos', 'Quiroz Zavala', '', '9988223145', STR_TO_DATE('10/12/2004', '%d/%m/%Y')), 
('DNI', '49992217', 'Veronica', 'Romero Vargas', 'veronica.romero@yahoo.es', '', STR_TO_DATE('25/08/2002', '%d/%m/%Y')), 
('DNI', '00253641', 'Eliseo', 'Prada Ortíz', 'eliseo.prada@yahoo.com', '', STR_TO_DATE('15/09/2004', '%d/%m/%Y'));

CREATE TABLE vendedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(10),
    numero_documento VARCHAR(15) UNIQUE,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    salario DECIMAL(10, 2),
    celular VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO vendedor (tipo_documento, numero_documento, nombres, apellidos, salario, celular, email) VALUES
('DNI', '85471236', 'Enrique', 'Perez Manco', '1500.00', '96521873', 'enrique.perez@outlook.com'),
('DNI', '47259136', 'Sofia', 'Ávila Solis', '1350.00', '', ''),
('DNI', '61542280', 'Marcela', 'Napaico Cama', '1600.00', '965874357', 'marcela.napaico@gmail.com'),
('CNE', '742536140', 'Carmela', 'Rodriguez Chauca', '1550.00', '', 'carmela.rodriguez@yahoo.com');


CREATE TABLE prenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50),
    marca VARCHAR(50),
    cantidad INT,
    talla VARCHAR(10),
    precio DECIMAL(10, 2)
);

INSERT INTO prenda (descripcion, marca, cantidad, talla, precio) VALUES
('Pantalon Jeans', 'Levis', 60, '28', 65.80),
('Camisa manga corta', 'Adams', 75, '16', 55.00),
('Polo sport', 'Australia', 100, '16', 40.00),
('Camisa manga larga', 'Newport', 150, '16', 42.50),
('Pijama para caballero', 'Adams', 180, '28', 79.50),
('Corbata', 'Maxwell', 85, '16', 14.50),
('Pijama para damas', 'Australia', 170, '24', 55.50),
('Camisa sport', 'John Holden', 85, '16', 88.50),
('Pantalon Jeans', 'Australia', 200, '28', 68.50),
('Shorts Jeans', 'Pepe Jeans', 185, '28', 77.20);


CREATE TABLE venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    vendedor_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

INSERT INTO venta (cliente_id, vendedor_id) VALUES
(4, 1),
(6, 3),
(10, 1),
(18, 4);

CREATE TABLE IF NOT EXISTS venta_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    prenda_id INT,
    cantidad INT,
    FOREIGN KEY (venta_id) REFERENCES venta(id),
    FOREIGN KEY (prenda_id) REFERENCES prenda(id)
);

INSERT INTO venta_detalle (venta_id, prenda_id, cantidad) VALUES
(1, 6, 3),
(1, 3, 5),
(1, 2, 7),
(2, 2, 3),
(3, 7, 4),
(3, 10, 6),
(3, 2, 6),
(3, 5, 7),
(4, 2, 4),
(4, 5, 3);

UPDATE cliente SET  numero_documento = '87952514' WHERE numero_documento = '837952514';
UPDATE cliente SET  numero_documento = '55869321' WHERE numero_documento = '558693219';
select * from cliente;

UPDATE cliente SET celular = '922881101' WHERE apellidos = 'Rodriguez Mayo';
UPDATE cliente SET celular = '977226604' WHERE numero_documento = '53298147';

UPDATE cliente SET activo = 0 WHERE numero_documento = '11453265';
UPDATE cliente SET activo = 0 WHERE numero_documento = '74142585';
UPDATE cliente SET activo = 0 WHERE numero_documento = '49985471';

UPDATE cliente SET celular = '' WHERE numero_documento = '837952514';
UPDATE cliente SET celular = '' WHERE numero_documento = '55869321';
UPDATE cliente SET celular = '' WHERE numero_documento = '74142585';

UPDATE cliente SET activo = 1, email = 'oscar.quiroz@yahoo.es' WHERE nombres = 'Oscar Carlos';


INSERT INTO cliente (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento) VALUES 
('DNI', '88225463', 'Gustavo Tadeo', 'Quispe Solano', 'gustavo.quispe@gmail.com', '', STR_TO_DATE('13/10/2001', '%d/%m/%Y')), 
('DNI', '15753595', 'Daniela', 'Solis Vargas', 'daniela.solis@outlook.com', '', STR_TO_DATE('09/11/1993', '%d/%m/%Y')), 
('DNI', '76314895', 'Milton Gregorio', 'Vasquez Iturrizaga', 'milton.vasquez@yahoo.es', '974815233', STR_TO_DATE('22/06/2004', '%d/%m/%Y')),
('DNI', '84725001', 'Veronica', 'Ancajima Araujo', 'veronica.ancajima@yahoo.com', '', STR_TO_DATE('07/11/1980', '%d/%m/%Y')), 
('DNI', '11228514', 'Felicita', 'Morraquin Candela', 'felicita.morraquin@outlook.com', '966001472', STR_TO_DATE('06/06/2006', '%d/%m/%Y')), 
('DNI', '51436952', 'Luhana', 'Ortiz Rodriguez', 'luhana.ortiz@outlook.com', '960405017', STR_TO_DATE('25/11/1980', '%d/%m/%Y'));

UPDATE prenda SET precio = '45.00' WHERE descripcion = 'Polo sport';

UPDATE prenda SET descripcion = 'Corbata Michi elegante' WHERE id = 6;

DELETE FROM prenda WHERE descripcion = 'Camisa manga corta';
DELETE FROM prenda WHERE descripcion = 'Camisa sport';

DELETE FROM cliente WHERE numero_documento = '47142536';
DELETE FROM cliente WHERE numero_documento = '77889955';
DELETE FROM cliente WHERE YEAR(fecha_nacimiento) = 1980;

SELECT * FROM cliente;
