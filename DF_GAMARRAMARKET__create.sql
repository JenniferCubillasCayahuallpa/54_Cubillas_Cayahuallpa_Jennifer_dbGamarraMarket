-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-11-05 14:54:42.613

-- tables
-- Table: customer
CREATE TABLE customer (
    id int  NOT NULL COMMENT 'identificador único',
    document_type char(3)  NOT NULL COMMENT 'DNI o CNE',
    document_number char(15)  NOT NULL COMMENT 'Número del documento DNI | CNE',
    name varchar(60)  NOT NULL COMMENT 'Nombres del usuario',
    surnames varchar(90)  NOT NULL COMMENT 'Apellidos del usuario',
    email varchar(80)  NOT NULL COMMENT 'Correo electrónico para poder comunicarnos con el usuario',
    phone char(9)  NOT NULL COMMENT 'Número de celular para ponernos en contácto con el usuario',
    date_of_birth date  NOT NULL COMMENT 'fecha de nacimeitno del suario',
    asset bool  NOT NULL COMMENT 'Si el cliente se encuentra activo o inactivo',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
) COMMENT 'Usuario que va a adquirir o comprar nuestras ropas';

-- Table: garment
CREATE TABLE garment (
    id int  NOT NULL COMMENT 'identificador único',
    salary varchar(90)  NOT NULL COMMENT 'decripción de la prenda',
    brand varchar(60)  NOT NULL COMMENT 'marca de la prenda',
    amount int  NOT NULL COMMENT 'cantidad de prendas de ese tipo o modelo',
    size varchar(10)  NOT NULL COMMENT 'talla de la prenda',
    price decimal(8,2)  NOT NULL COMMENT 'precio o costo',
    asset bool  NOT NULL COMMENT 'se encuentra esta prenda o ya no tenemos ',
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
) COMMENT 'Prenda o producto que tenemos';

-- Table: sale
CREATE TABLE sale (
    id int  NOT NULL COMMENT 'Identificador único',
    date_time int  NOT NULL COMMENT 'fecha y hora de la compra',
    asset int  NOT NULL COMMENT 'venta activa o inactiva',
    customer int  NOT NULL COMMENT 'identificador único',
    seller int  NOT NULL COMMENT 'identificador único',
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) COMMENT 'Venta realizada';

-- Table: sale_detail
CREATE TABLE sale_detail (
    id int  NOT NULL COMMENT 'identifiacdor  único',
    amount int  NOT NULL COMMENT 'la cantidad de ventas',
    sale int  NOT NULL COMMENT 'Identificador único',
    garment int  NOT NULL COMMENT 'identificador único',
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id)
) COMMENT 'Detalle de la venta';

-- Table: seller
CREATE TABLE seller (
    id int  NOT NULL COMMENT 'identificador único',
    document_type char(3)  NOT NULL COMMENT 'DNI | CNE',
    document_number char(15)  NOT NULL COMMENT 'número de DNI | CNE',
    name varchar(60)  NOT NULL COMMENT 'nombre del vendedor',
    surnames varchar(90)  NOT NULL COMMENT 'apellidos del vendedor',
    salary decimal(8,2)  NOT NULL COMMENT 'salario del vendedor',
    phone char(9)  NOT NULL COMMENT 'númeor de celular del vendedor',
    email varchar(80)  NOT NULL COMMENT 'email del vendedor',
    asset boolean  NOT NULL COMMENT 'el vendedor está activo o inactivo 1 trabaja o ya no',
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
) COMMENT 'Se encarga de vender los productos';

-- foreign keys
-- Reference: VENTA_CLIENTE (table: sale)
ALTER TABLE sale ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (customer)
    REFERENCES customer (id);

-- Reference: VENTA_DETALLE_PRENDA (table: sale_detail)
ALTER TABLE sale_detail ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (garment)
    REFERENCES garment (id);

-- Reference: VENTA_DETALLE_VENTA (table: sale_detail)
ALTER TABLE sale_detail ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (sale)
    REFERENCES sale (id);

-- Reference: VENTA_VENDEDOR (table: sale)
ALTER TABLE sale ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (seller)
    REFERENCES seller (id);

-- End of file.

