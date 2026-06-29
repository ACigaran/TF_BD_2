USE tf_bd;

INSERT INTO DEPARTAMENTO (nombre) VALUES
('Montevideo'),
('Canelones'),
('Maldonado'),
('Salto'),
('Paysandú'),
('Rivera'),
('Colonia'),
('Flores');


INSERT INTO TIPO_ELECCION (nombre, descripcion) VALUES
('Elecciones Nacionales',      'Elección de Presidente, Vicepresidente y Parlamento nacional'),
('Elecciones Departamentales', 'Elección de Intendentes y Juntas Departamentales'),
('Elecciones Municipales',     'Elección de Alcaldes y Concejos Municipales'),
('Referéndum',                 'Consulta popular sobre una norma o política pública'),
('Plebiscito',                 'Consulta popular sobre reforma constitucional');


INSERT INTO PARTIDO (nombre, direccion_sede, presidente, vicepresidente) VALUES
('Frente Amplio',         'Colonia 1367, Montevideo',    'Carolina Cosse',       'Mario Bergara'),
('Partido Nacional',      '18 de Julio 1478, Montevideo','Álvaro Delgado',       'Valeria Ripoll'),
('Partido Colorado',      'Av. Brasil 2955, Montevideo', 'Andrés Ojeda',         'Robert Silva'),
('Partido Independiente', 'Yi 1440, Montevideo',         'Pablo Mieres',         'Iván Posada'),
('Cabildo Abierto',       'Mercedes 1170, Montevideo',   'Guido Manini Ríos',    'Guillermo Domenech');


INSERT INTO CIUDADANO (ci, credencial_civica, nombre_completo, fecha_nacimiento, tiene_credencial) VALUES
('1.234.567-8', 'AAA0001', 'Ana García López',        '1985-03-12', TRUE),
('2.345.678-9', 'AAA0002', 'Carlos Rodríguez Pérez',  '1978-07-22', TRUE),
('3.456.789-0', 'AAA0003', 'María Fernández Suárez',  '1992-11-05', TRUE),
('4.567.890-1', 'AAA0004', 'Luis Martínez Silva',     '1965-01-30', TRUE),
('5.678.901-2', 'AAA0005', 'Sofía López Acosta',      '1990-09-18', TRUE),
('6.789.012-3', 'AAA0006', 'Pedro Núñez Castro',      '1983-04-25', TRUE),
('7.890.123-4', 'AAA0007', 'Laura Sánchez Viera',     '1995-06-14', TRUE),
('8.901.234-5', 'AAA0008', 'Diego Herrera Moreira',   '1970-12-03', TRUE),
('9.012.345-6', 'AAA0009', 'Valentina Torres Benítez','2000-02-28', TRUE),
('1.111.111-1', 'BBB0001', 'Roberto Álvarez Ríos',    '1955-08-10', TRUE),
('2.222.222-2', 'BBB0002', 'Elena Cabrera Méndez',    '1988-05-17', TRUE),
('3.333.333-3', 'BBB0003', 'Martín Delgado Falco',    '1975-10-22', TRUE),
('4.444.444-4', 'BBB0004', 'Patricia Ibarra Ponce',   '1962-03-08', TRUE),
('5.555.555-5', 'BBB0005', 'Andrés Ramos Ferreira',   '1998-07-31', FALSE),
('6.666.666-6', 'BBB0006', 'Natalia Vargas Pose',     '2001-01-15', TRUE),
('7.777.777-7', 'BBB0007', 'Fernando Pereyra Gómez',  '1945-09-20', TRUE),
('8.888.888-8', 'BBB0008', 'Cristina Mora Figueira',  '1980-04-11', TRUE),
('9.999.999-9', 'BBB0009', 'Javier Peña Larrañaga',   '1993-11-29', TRUE),
('1.010.101-0', 'CCC0001', 'Gabriela Suárez Da Rosa', '1987-08-04', TRUE),
('2.020.202-0', 'CCC0002', 'Nicolás Vidal Barrios',   '1972-06-16', TRUE);


INSERT INTO LOCALIDAD (nombre, tipo_localidad, id_departamento) VALUES
('Montevideo Centro',   'Ciudad',  1),
('Pocitos',             'Barrio',  1),
('Ciudad de la Costa',  'Ciudad',  2),
('Las Piedras',         'Ciudad',  2),
('Punta del Este',      'Ciudad',  3),
('Maldonado',           'Ciudad',  3),
('Salto',               'Ciudad',  4),
('Paysandú',            'Ciudad',  5),
('Rivera',              'Ciudad',  6),
('Colonia del Sacramento','Ciudad',7),
('Trinidad',            'Ciudad',  8);

INSERT INTO ELECCION (nombre, fecha, estado, id_tipo_eleccion) VALUES
('Elecciones Nacionales 2024',        '2024-10-27', 'Finalizada',  1),
('Elecciones Departamentales 2025',   '2025-05-11', 'Finalizada',  2),
('Referéndum Seguridad Pública 2024', '2024-10-27', 'Finalizada',  4),
('Plebiscito Reforma Jubilatoria',    '2024-10-27', 'Finalizada',  5),
('Elecciones Municipales 2025',       '2025-05-11', 'Finalizada',  3);

INSERT INTO CANDIDATO (ci, credencial_civica, nombre_completo, id_partido) VALUES
('1.111.222-3', 'CAND001', 'Yamandú Orsi Martínez',       1),
('1.111.333-4', 'CAND002', 'Carolina Cosse Palazzo',      1),
('1.111.444-5', 'CAND003', 'Álvaro Delgado Ceretta',      2),
('1.111.555-6', 'CAND004', 'Valeria Ripoll González',     2),
('1.111.666-7', 'CAND005', 'Andrés Ojeda Spitz',          3),
('1.111.777-8', 'CAND006', 'Robert Silva Pérez',          3),
('1.111.888-9', 'CAND007', 'Pablo Mieres Gómez',          4),
('1.111.999-0', 'CAND008', 'Guido Manini Ríos Ballestrino',5),
('2.222.111-3', 'CAND009', 'Mario Bergara Caffaro',       1),

INSERT INTO ESTABLECIMIENTO (nombre, tipo_establecimiento, direccion, id_localidad) VALUES
('Escuela N° 1 Artigas',          'Escuela',    'Av. 18 de Julio 1000, Montevideo',   1),
('Liceo N° 3 Miranda',            'Liceo',      'Rivera 2134, Montevideo',             1),
('Escuela N° 45 Pocitos',         'Escuela',    'Benito Blanco 1234, Montevideo',      2),
('Liceo Ciudad de la Costa',      'Liceo',      'Ruta Interbalnearia km 24, Canelones',3),
('Escuela Las Piedras',           'Escuela',    'Treinta y Tres 567, Las Piedras',    4),
('Liceo Punta del Este',          'Liceo',      'Gorlero 890, Punta del Este',        5),
('Escuela Maldonado Centro',      'Escuela',    'Dodera 345, Maldonado',              6),
('Liceo Salto N° 1',              'Liceo',      'Uruguay 678, Salto',                 7),
('Escuela Paysandú Centro',       'Escuela',    '18 de Julio 432, Paysandú',          8),
('Liceo Rivera N° 2',             'Liceo',      'Sarandí 211, Rivera',                9);


INSERT INTO PAPELETA (tipo_papeleta, descripcion, color, opcion_consulta, id_eleccion) VALUES

('Lista',       'Papeleta de lista para elección nacional',      'Blanco',   NULL,  1),
('Lista',       'Papeleta de lista para senado',                 'Celeste',  NULL,  1),

('Lista',       'Papeleta de intendencia',                       'Amarillo', NULL,  2),
('Lista',       'Papeleta de junta departamental',               'Verde',    NULL,  2),

('Consulta',    'Referéndum Seguridad Pública – Opción SÍ',      'Rosado',   'SÍ',  3),
('Consulta',    'Referéndum Seguridad Pública – Opción NO',      'Celeste',  'NO',  3),

('Consulta',    'Plebiscito Reforma Jubilatoria – Opción SÍ',    'Naranja',  'SÍ',  4),
('Consulta',    'Plebiscito Reforma Jubilatoria – Opción NO',    'Verde',    'NO',  4),

('Lista',       'Papeleta de alcaldía municipal',                'Lila',     NULL,  5);


INSERT INTO CIRCUITO (numero_circuito, barrio_zona, accesible, estado, votos_emitidos, id_establecimiento) VALUES
(101, 'Centro',           TRUE,  'Cerrado', 320, 1),
(102, 'Centro',           FALSE, 'Cerrado', 285, 1),
(201, 'Cordón',           TRUE,  'Cerrado', 410, 2),
(301, 'Pocitos',          TRUE,  'Cerrado', 398, 3),
(401, 'Ciudad de la Costa',FALSE,'Cerrado', 275, 4),
(501, 'Las Piedras',      TRUE,  'Cerrado', 340, 5),
(601, 'Punta del Este',   TRUE,  'Cerrado', 215, 6),
(701, 'Maldonado',        FALSE, 'Cerrado', 190, 7),
(801, 'Salto',            TRUE,  'Cerrado', 360, 8),
(901, 'Paysandú',         TRUE,  'Cerrado', 295, 9),
(103, 'Centro',           TRUE,  'Cerrado', 310, 2);


INSERT INTO PARTICIPACION_ELECTORAL (fecha_hora, observado, id_ciudadano, id_eleccion) VALUES
('2024-10-27 09:15:00', FALSE, 1,  1),
('2024-10-27 10:30:00', FALSE, 2,  1),
('2024-10-27 11:00:00', FALSE, 3,  1),
('2024-10-27 08:45:00', FALSE, 4,  1),
('2024-10-27 14:20:00', FALSE, 5,  1),
('2024-10-27 09:50:00', TRUE,  6,  1),
('2024-10-27 12:10:00', FALSE, 7,  1),
('2024-10-27 15:30:00', FALSE, 8,  1),
('2024-10-27 10:05:00', FALSE, 9,  1),
('2024-10-27 16:00:00', FALSE, 10, 1),
('2025-05-11 09:00:00', FALSE, 1,  2),
('2025-05-11 10:15:00', FALSE, 2,  2),
('2025-05-11 11:30:00', FALSE, 3,  2),
('2025-05-11 08:30:00', FALSE, 11, 2),
('2025-05-11 13:45:00', FALSE, 12, 2),
('2024-10-27 09:20:00', FALSE, 11, 3),
('2024-10-27 10:40:00', FALSE, 12, 3),
('2024-10-27 11:15:00', FALSE, 13, 3),
('2024-10-27 09:20:00', FALSE, 14, 4),
('2024-10-27 10:40:00', FALSE, 15, 4);


INSERT INTO MESA (fecha_apertura, fecha_cierre, estado, id_circuito, id_eleccion) VALUES
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 1,  1),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 2,  1),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 3,  1),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 4,  1),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 5,  1),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 6,  3),
('2024-10-27 08:00:00', '2024-10-27 19:30:00', 'Cerrada', 7,  4),
('2025-05-11 08:00:00', '2025-05-11 19:30:00', 'Cerrada', 1,  2),
('2025-05-11 08:00:00', '2025-05-11 19:30:00', 'Cerrada', 8,  2),
('2025-05-11 08:00:00', '2025-05-11 19:30:00', 'Cerrada', 9,  5);


INSERT INTO LISTA (id_lista, numero_lista, id_partido, id_candidato_principal, id_organo, id_departamento) VALUES
(1, 609,  1, 1, NULL, 1),
(2, 609,  1, 9, NULL, 1),
(3, 2005, 2, 3, NULL, 1),
(4, 2005, 2, 4, NULL, 1),
(9, 100,  3, 5, NULL, 1);


INSERT INTO MIEMBRO_MESA (rol_mesa, organismo_estado, id_ciudadano, id_mesa) VALUES
('Presidente de Mesa', 'Corte Electoral', 16, 1),
('Secretario',         'Corte Electoral', 17, 1),
('Escrutador',         'Corte Electoral', 18, 1),
('Presidente de Mesa', 'Corte Electoral', 19, 2),
('Secretario',         'Corte Electoral', 20, 2),
('Presidente de Mesa', 'Corte Electoral', 16, 3),
('Secretario',         'Corte Electoral', 17, 3),
('Presidente de Mesa', 'Corte Electoral', 18, 4),
('Presidente de Mesa', 'Corte Electoral', 19, 5),
('Presidente de Mesa', 'Corte Electoral', 20, 6),
('Escrutador',         'Corte Electoral', 16, 7),
('Presidente de Mesa', 'Corte Electoral', 17, 8),
('Presidente de Mesa', 'Corte Electoral', 18, 9),
('Presidente de Mesa', 'Corte Electoral', 19, 10);


INSERT INTO VOTO (fecha_hora, estado_voto, observado, id_mesa) VALUES
('2024-10-27 09:16:00', 'Válido',    FALSE, 1),
('2024-10-27 10:31:00', 'Válido',    FALSE, 1),
('2024-10-27 11:01:00', 'Válido',    FALSE, 1),
('2024-10-27 08:46:00', 'Válido',    FALSE, 2),
('2024-10-27 14:21:00', 'Válido',    FALSE, 2),
('2024-10-27 09:51:00', 'Observado', TRUE,  2),
('2024-10-27 12:11:00', 'Válido',    FALSE, 3),
('2024-10-27 15:31:00', 'Nulo',      FALSE, 3),
('2024-10-27 10:06:00', 'Válido',    FALSE, 4),
('2024-10-27 16:01:00', 'Válido',    FALSE, 4),
('2024-10-27 09:21:00', 'Válido',    FALSE, 6),
('2024-10-27 10:41:00', 'Válido',    FALSE, 6),
('2024-10-27 11:16:00', 'Blanco',    FALSE, 7),
('2024-10-27 09:22:00', 'Válido',    FALSE, 7),
('2025-05-11 09:01:00', 'Válido',    FALSE, 8),
('2025-05-11 10:16:00', 'Válido',    FALSE, 8),
('2025-05-11 11:31:00', 'Válido',    FALSE, 9),
('2025-05-11 08:31:00', 'Nulo',      FALSE, 9),
('2025-05-11 13:46:00', 'Válido',    FALSE, 10),
('2025-05-11 09:05:00', 'Válido',    FALSE, 10);

INSERT INTO DETALLE_VOTO (id_voto, id_papeleta) VALUES

(1,  1), (1,  2),
(2,  1), (2,  2),
(3,  1), (3,  2),
(4,  1), (4,  2),
(5,  1), (5,  2),
(6,  1),
(7,  1), (7,  2),
(8,  1),
(9,  1), (9,  2),
(10, 1), (10, 2),

(11, 5),
(12, 6),
(13, 5),
(14, 6),

(15, 3), (15, 4),
(16, 3), (16, 4),
(17, 3), (17, 4),
(18, 3),

(19, 9),
(20, 9);


INSERT INTO INTEGRACION_LISTA (id_lista, id_candidato, orden_aparicion) VALUES

(1, 1, 1),
(1, 2, 2),

(2, 9, 1),

(3, 3, 1),
(3, 4, 2),

(4, 4, 1),
(4, 10, 2),

(9, 5, 1),
(9, 6, 2);