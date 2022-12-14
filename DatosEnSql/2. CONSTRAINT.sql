ALTER TABLE BOLETOS ADD CONSTRAINT PK_BOLETOS PRIMARY KEY ( ID_BOLETOS );

ALTER TABLE CLASIFICACION ADD CONSTRAINT PK_CLASIFICACION PRIMARY KEY ( ID_CLASI,JORNADA );

ALTER TABLE ENTRADAS ADD CONSTRAINT PK_ENTRADAS PRIMARY KEY ( ID_ENTRADA );

ALTER TABLE EQUIPO ADD CONSTRAINT PK_EQUIPO PRIMARY KEY ( ID_EQUIPO );

ALTER TABLE ESTADIO ADD CONSTRAINT PK_ESTADIO PRIMARY KEY ( ID_ESTADIO );

ALTER TABLE ESTADISTICAS ADD CONSTRAINT PK_ESTADISTICAS PRIMARY KEY ( ID_ESTADISTICAS );

ALTER TABLE FALTAS ADD CONSTRAINT PK_FALTAS PRIMARY KEY ( ID_FALTA );

ALTER TABLE GOL ADD CONSTRAINT PK_GOL PRIMARY KEY ( ID_GOL );

ALTER TABLE JUGADORES ADD CONSTRAINT PK_JUGADORES PRIMARY KEY ( ID_JUGADOR );

ALTER TABLE PARTIDO ADD CONSTRAINT PK_PART PRIMARY KEY ( ID_PARTIDO );

ALTER TABLE PASES ADD CONSTRAINT PK_PASES PRIMARY KEY ( ID_PASE );

ALTER TABLE PERSONAL ADD CONSTRAINT PK_PERSONAL PRIMARY KEY ( ID_PERSONAL );

ALTER TABLE PUESTO ADD CONSTRAINT PK_PUESTO PRIMARY KEY ( ID_PUESTO );

ALTER TABLE SEDES ADD CONSTRAINT PK_SEDES PRIMARY KEY ( ID_SEDE );

ALTER TABLE TJUGADO ADD CONSTRAINT PK_TJUGADO PRIMARY KEY ( ID_TIEMPO,JORNADA );
                                                            
 ALTER TABLE BOLETOS
    ADD CONSTRAINT FK_BOL_ENTR FOREIGN KEY ( ID_ENTRADA )
        REFERENCES ENTRADAS ( ID_ENTRADA );

ALTER TABLE CLASIFICACION
    ADD CONSTRAINT FK_CLASI_EQU FOREIGN KEY ( ID_EQUIPO )
        REFERENCES EQUIPO ( ID_EQUIPO );

ALTER TABLE ENTRADAS
    ADD CONSTRAINT FK_ENT_EST FOREIGN KEY ( ID_ESTADIO )
        REFERENCES ESTADIO ( ID_ESTADIO );

ALTER TABLE PARTIDO
    ADD CONSTRAINT FK_EQU_LOC FOREIGN KEY ( ID_LOCAL )
        REFERENCES EQUIPO ( ID_EQUIPO );

ALTER TABLE PARTIDO
    ADD CONSTRAINT FK_EQU_VIS FOREIGN KEY ( ID_VISITANTE )
        REFERENCES EQUIPO ( ID_EQUIPO );

ALTER TABLE ESTADISTICAS
    ADD CONSTRAINT FK_EST_JUG FOREIGN KEY ( ID_JUGADOR )
        REFERENCES JUGADORES ( ID_JUGADOR );

ALTER TABLE ESTADIO
    ADD CONSTRAINT FK_EST_SED FOREIGN KEY ( ID_SEDE )
        REFERENCES SEDES ( ID_SEDE );

ALTER TABLE FALTAS
    ADD CONSTRAINT FK_FALT_EST FOREIGN KEY ( ID_ESTADISTICAS )
        REFERENCES ESTADISTICAS ( ID_ESTADISTICAS );

ALTER TABLE GOL
    ADD CONSTRAINT FK_GOL_EST FOREIGN KEY ( ID_ESTADISTICAS )
        REFERENCES ESTADISTICAS ( ID_ESTADISTICAS );

ALTER TABLE JUGADORES
    ADD CONSTRAINT FK_JUG_DTEC FOREIGN KEY ( ID_DTECNICO )
        REFERENCES JUGADORES ( ID_JUGADOR );

ALTER TABLE JUGADORES
    ADD CONSTRAINT FK_JUG_EQU FOREIGN KEY ( ID_EQUIPO )
        REFERENCES EQUIPO ( ID_EQUIPO );

ALTER TABLE PARTIDO
    ADD CONSTRAINT FK_PART_EST FOREIGN KEY ( ID_ESTADIO )
        REFERENCES ESTADIO ( ID_ESTADIO );

ALTER TABLE PASES
    ADD CONSTRAINT FK_PAS_ESTA FOREIGN KEY ( ID_ESTADISTICAS )
        REFERENCES ESTADISTICAS ( ID_ESTADISTICAS );

ALTER TABLE PERSONAL
    ADD CONSTRAINT FK_PER_EST FOREIGN KEY ( ID_ESTADIO )
        REFERENCES ESTADIO ( ID_ESTADIO );

ALTER TABLE PERSONAL
    ADD CONSTRAINT FK_PER_PER FOREIGN KEY ( ID_JEFE )
        REFERENCES PERSONAL ( ID_PERSONAL );

ALTER TABLE PERSONAL
    ADD CONSTRAINT FK_PER_PUES FOREIGN KEY ( ID_PUESTO )
        REFERENCES PUESTO ( ID_PUESTO );

ALTER TABLE TJUGADO
    ADD CONSTRAINT FK_TJUG_EST FOREIGN KEY ( ID_ESTADISTICAS )
        REFERENCES ESTADISTICAS ( ID_ESTADISTICAS );
        

ALTER TABLE PERSONAL 
    ADD CONSTRAINT CK_PER CHECK(GENERO  IN('M','F','O'));
    
ALTER TABLE  FALTAS
    ADD CONSTRAINT CK_FAL CHECK(TIPO IN('A','R'));
    
ALTER TABLE PARTIDO 
    ADD CONSTRAINT UQ_PART UNIQUE(ID_LOCAL,ID_VISITANTE);