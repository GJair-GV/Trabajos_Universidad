# Act2 proveedor-productos
TABLA PRODUCTOS SE ELIGIO:

Se eligió el nombre PRODUCTOS para representar a la entidad que contiene la información de los productos.permite almacenar datos esenciales como el nombre, descripción, precio, existencia, fecha de creación y estado de cada producto. Es una entidad clave en cualquier sistema de inventario, ventas o catálogo de productos.

- ID_PRODUCTO: Se eligió NUMBER porque se necesita un identificador único para cada producto. Es la clave primaria de la tabla y permite la identificación rápida de cada registro.
   
- NOMBRE: Se eligió VARCHAR2(150) porque el nombre de un producto es una cadena de texto de longitud variable, y se estimó que 150 caracteres  son suficientes para nombrar cualquier producto.

- DESCRIPCION: Se usa VARCHAR2(300) para permitir una descripción más detallada del producto. Es texto de longitud variable y 300 caracteres  proporcionan espacio suficiente.
   
- PRECIO: Se utiliza FLOAT para representar el precio, ya que este puede tener valores decimales. Aunque se esperen dos decimales, el tipo FLOAT  permite flexibilidad en el manejo de precios.
   
- ESTATUS: Se usa NUMBER(1) porque solo se necesita un valor binario para indicar si el producto está activo (1) o inactivo (0).

CREATE TABLE EJEMPLO1.PRODUCTOS (
ID_PRODUCTO NUMBER PRIMARY KEY,
NOMBRE VARCHAR2(150) NOT NULL,
DESCRIPCION VARCHAR2(300) NOT NULL,
PRECIO FLOAT NOT NULL,
ESTATUS NUMBER(1) NOT NULL -> FALSE Y TRUE 1
);

CREAMOS LA TABLA PROVEEDORES YA QUE ESTA SOLO TENDRA PK Y PRODUCTOS TENDRA PK Y FK
TABLA PROVEEDORES SE ELIGIO:

Se eligió el nombre PROVEEDORES porque representa la entidad encargada de almacenar la información de las empresas o personas que abastecen productos o servicios a la organización. Esta tabla facilita el control y seguimiento de los proveedores, permitiendo saber quiénes están activos y sus datos de contacto. Es clave para procesos de compras, inventario y relaciones comerciales.
 
- ID_PROVEDOR: Se eligió NUMBER porque cada proveedor necesita un identificador único. Esta columna es la clave primaria, lo cual permite identificar cada proveedor sin ambigüedad.
   
- NOMBRE: Se usa VARCHAR2(150) porque el nombre del proveedor es una cadena de texto de longitud variable. Se estimó que 150 caracteres son suficientes para cubrir nombres de razón social o comerciales.
   
- TELEFONO: Se eligió NUMBER(10) porque los números telefónicos en México tienen 10 dígitos. Aunque existen otros formatos, para fines de práctica se limita a un solo número y a 10 dígitos.
   
- ESTATUS: Se utiliza NUMBER(1) para representar un estado binario: 1 = Activo, 0 = Inactivo. Esto permite un borrado lógico, manteniendo el historial sin eliminar físicamente el proveedor.

CREATE TABLE EJEMPLO1.PROVEEDOR (
	ID_PROVEEDOR NUMBER PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR2(150) NOT NULL,
	TELEFONO NUMBER(10) NOT NULL,
	ESTATUS NUMBER(1) NOT NULL
);

INSERTS PROVEEDOR
- INSERT INTO EJEMPLO1.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (1, 'Amazon Web Services', 2290872343, 0);

- INSERT INTO EJEMPLO1.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (2, 'Comercializadora del Norte', 5589876543, 1);

- INSERT INTO EJEMPLO1.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (3, 'Dell Technologies', 1678093461, 1);

- INSERT INTO EJEMPLO1.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (4, 'Fabricante de acero Peñascal', 2267890312, 0);

- INSERT INTO EJEMPLO1.PROVEEDOR (ID_PROVEEDOR, NOMBRE, TELEFONO, ESTATUS) VALUES (5, 'Oficial TREK Byker', 5576543210, 1);


PRODUCTOS
- INSERT INTO EJEMPLO1.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, PRECIO, ESTATUS)
VALUES (1, 'Laptop HUAWEI MATEBOOK 14"', 'Laptop HUAWEI con procesador AMD Ryzen 5, 16GB RAM y 1TB SSD', 12499.99, 1);

- INSERT INTO EJEMPLO1.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, PRECIO, ESTATUS)
VALUES (2, 'Bocina JBL"', 'Potente bocina JBL, USB, BT, contra el agua, durabilidda de bateria hasta 10hrs', 7500.50, 9);

- INSERT INTO EJEMPLO1.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, PRECIO, ESTATUS)
VALUES (3, 'Lavadora MABE', 'Capacidad MAX hasta 20k de ropa, lava, exprime(secado rapido)', 18800.00, 7);

- INSERT INTO EJEMPLO1.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, PRECIO, ESTATUS)
VALUES (4, 'Suspencion FOX MTB', 'Es reconocida por su alto rendimiento, durabilidad y tecnología avanzada', 275000.00, 9);

- INSERT INTO EJEMPLO1.PRODUCTOS (ID_PRODUCTO, NOMBRE, DESCRIPCION, PRECIO, ESTATUS)
VALUES (5, 'Bicicleta Trek Marlin 6', 'Cuadro aluminio, R29, Transmision 1x10, suspencion ROCXSHOX', 22500.00, 4);

Update
- UPDATE EJEMPLO1.PRODUCTOS SET ESTATUS = 1 WHERE ID_PRODUCTO = 5;
- SELECT * FROM EJEMPLO1.PRODUCTOS;

COMO YA SE TIENE LA TABLA CREADA SE OCUPARA EL SIGUIENTE QUERY PARA AGREGAR UNA COLUMNA
ALTER TABLE EJEMPLO1.PRODUCTOS ADD FK_ID_PROVEEDOR NUMBER;

PARA AGREGAR LA RELACION ENTRE LAS TABLAS SE NECESITA un QUERY
 * SE ALTERNARA LA TABLA PRODUCTOS, AGREGANDO UN CONSTRAINT FK_PRODUCTO_PROVEEDOR PARA LA LLAVE FORANEA FK_ID_PROVEEDOR REFERENCIADA
 * A PROVEEDOR CON EL ID_PROVEEDOR
ALTER TABLE EJEMPLO1.PRODUCTOS
ADD CONSTRAINT FK_PRODUCTO_PROVEEDOR
FOREIGN KEY (FK_ID_PROVEEDOR)
REFERENCES EJEMPLO1.PROVEEDOR (ID_PROVEEDOR);
DESCRIPCION: 
 * Se relaciona de esta forma ya que cada producto va a tener un proveedor que lo va a surtir por esa razon se eligio que fuera relacionado 
 * desde la tabla productos hacia la tabla proveedor para tener un catalogo independiente de proveedor y sera de FK_ID_PROVEEDOR en nuestra tabla
 * productos a ID_Proveedor de nuestra tabla PROVEEDOR

SELECTS PROVEEDOR Y PRDUCTOS
- SELECT * FROM EJEMPLO1.PROVEEDOR;
- SELECT * FROM EJEMPLO1.PRODUCTOS;

UPDATE DE PRODUCTOS LLAVES FORANEAS UPDATE
- UPDATE EJEMPLO1.PRODUCTOS SET FK_ID_PROVEEDOR = 1 WHERE ID_PRODUCTO = 1;
- UPDATE EJEMPLO1.PRODUCTOS SET FK_ID_PROVEEDOR = 2 WHERE ID_PRODUCTO = 2;
- UPDATE EJEMPLO1.PRODUCTOS SET FK_ID_PROVEEDOR = 3 WHERE ID_PRODUCTO = 3;
- UPDATE EJEMPLO1.PRODUCTOS SET FK_ID_PROVEEDOR = 5 WHERE ID_PRODUCTO = 5;

UPDATE DE ATRIBUTOS
- UPDATE EJEMPLO1.PRODUCTOS SET ESTATUS = 0 WHERE ID_PRODUCTO = 3;

COMENTARIOS NIVEL TABLA PRODUCTO
- COMMENT ON TABLE EJEMPLO1.PRODUCTOS IS 'El nombre de la tabla productos en representacion de la entidad, con sus atributos correspondinetes';
- COMMENT ON TABLE EJEMPLO1.PROVEEDOR IS 'El nombre de la tabla proveedor en representacion de la entidad, con sus atributos correspondinetes';

COMENTARIOS NIVEL ATRIBUTO de PRODUCTOS
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.ID_PRODUCTO IS 'Número único para identificar cada producto. Es la clave primaria.';
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.NOMBRE IS 'Nombre del producto. VARCHAR2(150) permite texto variable hasta 150 caracteres.';
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.DESCRIPCION IS 'Descripción detallada del producto. VARCHAR2(300) permite texto variable.';
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.PRECIO IS 'Precio del producto con decimales. FLOAT da flexibilidad.';
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.ESTATUS IS 'Número 1 o 0 para indicar si el producto está activo o inactivo.';
- COMMENT ON COLUMN EJEMPLO1.PRODUCTOS.FK_ID_PROVEEDOR IS 'Llave foránea que relaciona el producto con su proveedor.';

COMENTARIOS NIVEL ATRIBUTO DE PROVEEDOR
- COMMENT ON COLUMN EJEMPLO1.PROVEEDOR.ID_PROVEEDOR IS 'Identificador único del proveedor. Clave primaria.';
- COMMENT ON COLUMN EJEMPLO1.PROVEEDOR.NOMBRE IS 'Nombre del proveedor. Hasta 150 caracteres.';
- COMMENT ON COLUMN EJEMPLO1.PROVEEDOR.TELEFONO IS 'Número telefónico de 10 dígitos.';
- COMMENT ON COLUMN EJEMPLO1.PROVEEDOR.ESTATUS IS '1 = Activo, 0 = Inactivo. Para borrado lógico.';
