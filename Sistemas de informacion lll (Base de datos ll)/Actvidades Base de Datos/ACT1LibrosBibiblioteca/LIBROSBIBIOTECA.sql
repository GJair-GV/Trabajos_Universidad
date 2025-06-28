/*Creacion de tabla libros*/
CREATE TABLE REGISTROLIBROS.LIBROS (
    id_libro NUMBER PRIMARY KEY,
    titulo VARCHAR2(100) NOT NULL,
    autor VARCHAR2(100),
    fecha_publicacion DATE,
    disponible NUMBER(1) -- 1 = disponible, 0 = no disponible
);

/*Inserts de 5 libros-Registros*/
INSERT INTO REGISTROLIBROS.LIBROS (id_libro, titulo, autor, fecha_publicacion, disponible)
VALUES (1, 'Cien años de soledad', 'Gabriel García Márquez', TO_DATE('1967-06-05', 'YYYY-MM-DD'), 1);

INSERT INTO REGISTROLIBROS.LIBROS (id_libro, titulo, autor, fecha_publicacion, disponible)
VALUES (2, '1984', 'George Orwell', TO_DATE('1949-06-08', 'YYYY-MM-DD'), 0);

INSERT INTO REGISTROLIBROS.LIBROS (id_libro, titulo, autor, fecha_publicacion, disponible)
VALUES (3, 'Don Quijote de la Mancha', 'Miguel de Cervantes', TO_DATE('1605-01-16', 'YYYY-MM-DD'), 1);

INSERT INTO REGISTROLIBROS.LIBROS (id_libro, titulo, autor, fecha_publicacion, disponible)
VALUES (4, 'El Principito', 'Antoine de Saint-Exupéry', TO_DATE('1943-04-06', 'YYYY-MM-DD'), 0);

INSERT INTO REGISTROLIBROS.LIBROS (id_libro, titulo, autor, fecha_publicacion, disponible)
VALUES (5, 'La sombra del viento', 'Carlos Ruiz Zafón', TO_DATE('2001-01-01', 'YYYY-MM-DD'), 1);
COMMIT;

/*consultas*/
/*mostrar todos los libros*/
SELECT * FROM REGISTROLIBROS.LIBROS;
/*mostrar solo libros disponibles*/
SELECT * FROM REGISTROLIBROS.LIBROS WHERE disponible = 1;
/*mostrar de manera ascendente*/
SELECT titulo, autor FROM REGISTROLIBROS.LIBROS ORDER BY titulo ASC;
--Explicación: Usamos ORDER BY titulo ASC para ordenar alfabéticamente los títulos en orden ascendente (de la A a la Z).

/*actualizacion de un estado de un libro no disponible*/
UPDATE REGISTROLIBROS.LIBROS SET disponible = 0 WHERE id_libro = 3; 
/*eliminar libro por su ID*/
DELETE FROM REGISTROLIBROS.LIBROS WHERE id_libro = 2;
/*muestra resultados finales*/
SELECT * FROM REGISTROLIBROS.LIBROS;
 
