-- TABLE
CREATE TABLE APOSTADORES(
	idApostador  INTEGER PRIMARY KEY AUTOINCREMENT,
  	nombre varchar(30),
  	apellidos varchar(50),
  	nro_documento varchar(15)
  
);
CREATE TABLE APUESTA(
	idApuesta INTEGER PRIMARY KEY AUTOINCREMENT,
  	fecha DATETIME,
  	estado bigint, --1 activo 0 inactivo
  	resultado bigint, --1 victoria 0 perdido
  	idApostador integer,
  	idPartidos integer,
  	FOREIGN key(idApostador) REFERENCES APOSTADORES(idApostador),
  	FOREIGN key(idPartidos) REFERENCES PARTIDOS(idPartidos)
);
create TABLE APOSTADORES(
	idApostador  INTEGER PRIMARY KEY AUTOINCREMENT,
  	nombre varchar(30),
  	apellidos varchar(50),
  	nro_documento varchar(15)
  
)
create table PARTIDOS(
	idPartidos INTEGER PRIMARY KEY AUTOINCREMENT ,
  	fecha DATETIME,
  	ciudad VARCHAR(30),
  	estado bigint
)

create table EQUIPOS(
	idEquipo INTEGER PRIMARY KEY AUTOINCREMENT,
  	nombre varchar(30)
)


create table DETALLE_PARTIDOS(
	idDetallePartidos  INTEGER PRIMARY KEY AUTOINCREMENT,
  	idEquipo INTEGER,
  	idPartidos Integer,
  	FOREIGN KEY(idEquipo) REFERENCES EQUIPOS(idEquipo),
  	FOREIGN KEY(idPartidos) REFERENCES PARTIDOS(idPartidos)
)

create table GANADOR(
	idGanador INTEGER PRIMARY KEY AUTOINCREMENT,
  	idPartidos integer,
  	idEquipo integer,
  	FOREIGN KEY(idPartidos) REFERENCES PARTIDOS(idPartidos),
  	FOREIGN key(idEquipo) REFERENCES EQUIPOS(idEquipo)
)

create table MARCARDOR_DEFINITIVO(
	idMarcadorDefinitvo INTEGER PRIMARY KEY AUTOINCREMENT,
  	idPartidos integer,
  	FOREIGN key(idPartidos) REFERENCES PARTIDOS(idPartidos)
)

create table DETALLE_MARCADOR_DEFINITIVO(
	idDetalleMarcadorDefinitivo INTEGER PRIMARY KEY AUTOINCREMENT,
  	idEquipo integer,
  	idMarcadorDefinitvo integer,
  	cant_goles integer,
  	FOREIGN key(idEquipo) REFERENCES EQUIPOS(idEquipo),
  	FOREIGN key(idMarcadorDefinitvo) REFERENCES MARCARDOR_DEFINITIVO(idMarcadorDefinitvo)
)

CREATE TABLE APUESTA(
	idApuesta INTEGER PRIMARY KEY AUTOINCREMENT,
  	fecha DATETIME,
  	estado bigint, --1 activo 0 inactivo
  	resultado bigint, --1 victoria 0 perdido
  	idApostador integer,
  	idPartidos integer,
  	FOREIGN key(idApostador) REFERENCES APOSTADORES(idApostador),
  	FOREIGN key(idPartidos) REFERENCES PARTIDOS(idPartidos)
)

create table MARCARDOR_APOSTADO(
	idMarcadorApostado INTEGER PRIMARY KEY AUTOINCREMENT,
  	idApuesta integer,
  	FOREIGN key(idApuesta) REFERENCES APUESTA(idApuesta)
)

create table DETALLE_MARCARDOR_APOSTADO(
	idDetalleMarcadorApostado INTEGER PRIMARY KEY AUTOINCREMENT,
  	idMarcadorApostado integer,
  	idEquipo integer,
  	cant_goles integer,
  	FOREIGN key(idEquipo) REFERENCES EQUIPOS(idEquipo),
  	FOREIGN key(idMarcadorApostado) REFERENCES MARCARDOR_APOSTADO(idMarcadorApostado)
)

--DATOS PARA INSERTARAPOSTADORES
insert into APOSTADORES values(1,'jaime', 'catari','12345678');
insert into APOSTADORES values(2,'pedro', 'picapiedra','12345678');
insert into APOSTADORES values(3,'carlos', 'peres','12345678');

insert into EQUIPOS values (1,'EQUIPO1');
insert into EQUIPOS values (2,'EQUIPO2');
insert into EQUIPOS values (3,'EQUIPO3');

--APUESTA NRO1
INSERT INTO PARTIDOS VALUES (1, '25/02/2022', 'CUSCO', 1);

INSERT INTO DETALLE_PARTIDOS VALUES(1,1,1);
INSERT INTO DETALLE_PARTIDOS VALUES(2,2,1);

INSERT INTO MARCARDOR_DEFINITIVO VALUES(1,1);
INSERT INTO DETALLE_MARCADOR_DEFINITIVO VALUES(1,1,1,3);
INSERT INTO DETALLE_MARCADOR_DEFINITIVO VALUES(2,2,1,2);

INSERT INTO GANADOR VALUES(1,1,1);

INSERT INTO APUESTA VALUES(1,'24/02/2022',1,1,1,1);

INSERT INTO MARCARDOR_APOSTADO VALUES(1,1);

INSERT INTO DETALLE_MARCARDOR_APOSTADO VALUES(1,1,1,3);
INSERT INTO DETALLE_MARCARDOR_APOSTADO VALUES(2,1,2,2);

--APUESTA NRO2
INSERT INTO PARTIDOS VALUES (2, '25/02/2022', 'CUSCO', 1);

INSERT INTO DETALLE_PARTIDOS VALUES(3,2,2);
INSERT INTO DETALLE_PARTIDOS VALUES(4,3,2);

INSERT INTO MARCARDOR_DEFINITIVO VALUES(2,2);
INSERT INTO DETALLE_MARCADOR_DEFINITIVO VALUES(3,2,2,1);
INSERT INTO DETALLE_MARCADOR_DEFINITIVO VALUES(4,3,2,2);

INSERT INTO GANADOR VALUES(2,2,3);

INSERT INTO APUESTA VALUES(2,'24/02/2022',1,0,2,2);

INSERT INTO MARCARDOR_APOSTADO VALUES(2,2);

INSERT INTO DETALLE_MARCARDOR_APOSTADO VALUES(2,2,2,4);
INSERT INTO DETALLE_MARCARDOR_APOSTADO VALUES(3,2,3,2);

--Nro de partidos activos 
SELECT COUNT(idPartidos) from PARTIDOS
where estado =1

--CANTIDAD DE APUESTAS POR APOSTADOR que si hicieron alguna apuesta
select idApostador,count(idApuesta) as NroApuestas from APUESTA
GROUP BY idapostador

--cantidad de apuestas
select idapuesta from APUESTA
where estado =1

--haga una consulta que indique cual o cuales apostadores han ganaado más apuestas
SELECT idApostador, max(NroApuestas) from (
select idApostador,count(idApuesta) as NroApuestas from APUESTA
where resultado = 1
GROUP BY idapostador) 
