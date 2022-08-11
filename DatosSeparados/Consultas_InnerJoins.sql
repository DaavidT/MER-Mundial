5.mostrar todos los jugadores que tengan el mismo numero de goles que el numero 10 de brasil o el 9 de alemania.
SELECT J.NOMBRE, COUNT(G.TIPO) AS GOLES
FROM JUGADORES J INNER JOIN GOL G
ON J.ID_JUGADOR = G.ID_GOL
WHERE G.TIPO = 'GOL' AND ((J.PAIS_ORIGEN = 'Brasil' OR J.ID_JUGADOR = 10) OR (J.PAIS_ORIGEN = 'Alemania' OR J.ID_JUGADOR = 9))
GROUP BY J.NOMBRE
HAVING COUNT(G.TIPO)>1;

SUB *6.cuantos entrenadores dirijen a la seleccion de su pais.


9.del punto anterior mostrar quienes han anotado esos goles.
SELECT J.NOMBRE, SUM(P.GOL_L)
FROM JUGADORES J INNER JOIN PARTIDO P
ON J.ID_JUGADOR = P.ID_PARTIDO
WHERE ID_LOCAL = '&EQUIPO' ;
SELECT J.NOMBRE, SUM(P.GOL_V)
FROM JUGADORES J INNER JOIN PARTIDO P
ON J.ID_JUGADOR = P.ID_PARTIDO
WHERE ID_VISITANTE = '&EQUIPO' ;

10.mostrar los 10 primeros goleadores del mundial.
CREATE VIEW GOLEADORES AS(
SELECT J.NOMBRE, COUNT(G.TIPO) AS GOLES
FROM JUGADORES J INNER JOIN GOL G
ON J.ID_JUGADOR = G.ID_GOL
GROUP BY J.NOMBRE);

12.mostrar el promedio de asistencia por estadio de la segunda jornada.
SELECT E.NOMBRE, AVG(E.CAPACIDAD) AS PROMEDIO
FROM ESTADIO E INNER JOIN ENTRADAS EN
ON E.ID_ESTADIO = EN.ID_ENTRADA
WHERE EN.FECHA LIKE '1_/12/21'
GROUP BY E.NOMBRE;

*14.cuantas amarillas y rojas se registraron de partidos donde hubieran del continente africano o americano.
SELECT F.MINUTO, COUNT(F.TIPO) AS TOTAL_TARJETAS
FROM FALTAS F INNER JOIN EQUIPO E
ON F.ID_FALTA = E.ID_EQUIPO
INNER JOIN JUGADORES J
ON E.ID_EQUIPO = J.ID_JUGADOR
INNER JOIN ESTADISTICAS ES
ON J.ID_JUGADOR = ES.ID_ESTADISTICAS 
WHERE E.PAIS = 'Egypt' OR E.PAIS = 'Morocco' OR E.PAIS = 'Nigeria' OR E.PAIS = 'Tunisia'
OR E.PAIS = 'Senegal' OR E.PAIS = 'Uruguay' OR E.PAIS = 'Peru' OR E.PAIS = 'Argentina'
OR E.PAIS = 'Brazil' OR E.PAIS = 'Costa Rica' OR E.PAIS = 'Mexico' OR E.PAIS = 'Panama' 
OR E.PAIS = 'Colombia'
GROUP BY F.MINUTO;

*15.cuantas rojas se registraron donde argentina,brasil o mexico fueran locales o bien alemania, francia o españa fueran visitantes.
SELECT F.MINUTO, COUNT(F.TIPO) AS TOTAL_TARJETASROJAS
FROM FALTAS F INNER JOIN EQUIPO E
ON F.ID_FALTA = E.ID_EQUIPO
WHERE ((E.EQUIPO LIKE 'Argentina' OR E.EQUIPO LIKE 'Brazil' OR E.EQUIPO LIKE 'Mexico' OR E.EQUIPO LIKE 'Germany'
OR E.EQUIPO LIKE 'Spain' OR E.EQUIPO LIKE 'France') AND F.TIPO = 'R')
GROUP BY F.MINUTO;

16.cual fue la forma mas comun de pago.
CREATE VIEW FORMACOMUN_PAGO AS(
SELECT METODO_PAGO, COUNT(METODO_PAGO) AS FORMACOMUN_PAGO
FROM BOLETOS
GROUP BY METODO_PAGO);
SELECT * FROM FORMACOMUN_PAGO;

17.indicar en que grupo estaban los dos paises que llegaron a la final.
SELECT E.GRUPO AS FINAL
FROM EQUIPO E INNER JOIN CLASIFICACION C
ON E.ID_EQUIPO = C.ID_CLASI
WHERE JORNADA = '5'; 

SUB 19.cuantos paises del continente americano superaron la ronda de octavos de final.
SELECT PAIS AS OCTAVOS_FINAL
FROM EQUIPO 
WHERE ID_EQUIPO IN (SELECT ID_CLASI
FROM CLASIFICACION
WHERE JORNADA = '2');

*20.quien fue el pais que perdio mas partidos, incluir diferencia de goles.
SELECT E.PAIS AS PARTIDOS_PERDIDOS, G.GOLES AS GOLESEN_CONTRA
FROM EQUIPO E INNER JOIN CLASIFICACION C
ON E.ID_EQUIPO = C.ID_CLASI
INNER JOIN GOL 
ON C.ID_CLASI = G.ID_CLASI
WHERE P_PERDIDOS >= '3' AND G.TIPO = 'GOL';

SUB 21.que pais del continente asiatico fue el que mas partidos empató.
SELECT PAIS 
FROM EQUIPO
WHERE ID_EQUIPO IN (SELECT ID_CLASI
FROM CLASIFICACION
WHERE P_EMPATE >='2');

SUB 22.mostrar los puntos hechos por aquellos paises que su nombre comience con m o termine con a pero que sean del continente americano o europeo.
SELECT PUNTOS
FROM CLASIFICACION
WHERE ID_CLASI IN (SELECT ID_EQUIPO
FROM EQUIPO
WHERE PAIS LIKE 'M%' OR PAIS LIKE'%a');

SUB 23.cual fue el portero mas goleado y el menos goleado.
SELECT TIPO AS GOLES
FROM GOL
WHERE ID_GOL IN (SELECT ID_JUGADOR
FROM JUGADORES
WHERE POSICION = 'Portero');

*24.mostrar los jugadores que tengan un promedio de pases correctos mayor al promedio de pases correctos de mexico pero solo de sus primeros 3 juegos.
