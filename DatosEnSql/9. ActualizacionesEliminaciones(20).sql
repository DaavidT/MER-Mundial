UPDATE JUGADORES SET EDAD = 19 WHERE EDAD = 18;
UPDATE JUGADORES SET SUELDO = 20000 WHERE SUELDO BETWEEN 19000 and 21000;
UPDATE PERSONAL SET  NOMBRE = 'CARLOS' WHERE NOMBRE = 'CARLOS BENJAMIN';
UPDATE TJUGADO SET TIEMPOJUGADO = 15 WHERE TIEMPOJUGADO < 20;
UPDATE PASES SET TIPO= 'INCOMPLETO' WHERE ID_PASE = 55;

ALTER TABLE ENTRADAS MODIFY COSTO NUMBER(10);
ALTER TABLE BOLETOS MODIFY RFC VARCHAR(25);
ALTER TABLE EQUIPO MODIFY GRUPO VARCHAR(5);
ALTER TABLE JUGADORES MODIFY SUELDO NUMBER(20);

DELETE FALTAS WHERE MINUTO = 45;
DELETE GOL WHERE MINUTO = 120;
DELETE BOLETOS WHERE CANTIDAD < 2;
DELETE PERSONAL WHERE ID_JEFE = 5;
DELETE CLASIFICACION WHERE PUNTOS = 10;

DROP SEQUENCE SQ_TJUGADO;
DROP SEQUENCE SQ_ESTADIO;
DROP SEQUENCE SQ_PRUEBA;
DROP SEQUENCE SQ_SEDES;
DROP  VIEW Portero;
