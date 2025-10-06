CREATE TABLE Peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    titulo_original VARCHAR(100),
    pais_origen VARCHAR(50),
    duracion INT NOT NULL,
    genero VARCHAR(50),
    clasificacion VARCHAR(10),
    director VARCHAR(100)
);

CREATE TABLE Salas (
    id_sala SERIAL PRIMARY KEY,
    nombre_sala VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    tipo_sala VARCHAR(20)
);

CREATE TABLE Funciones (
    id_funcion SERIAL PRIMARY KEY,
    id_pelicula INT NOT NULL,
    id_sala INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    idioma_version VARCHAR(20) NOT NULL,
    tipo_funcion varchar(20) NOT NULL, --matine, vespertina, noche
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas (id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES Salas (id_sala)
);

CREATE TABLE Ventas_Entradas (
    id_venta SERIAL PRIMARY KEY,
    id_funcion INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_funcion) REFERENCES Funciones (id_funcion)
);

CREATE TABLE Sillas (
	id_silla SERIAL PRIMARY KEY,
	id_sala int NOT NULL,
	tipo_silla varchar(20) NOT NULL,
	letra_fila varchar(1) NOT NULL,
	numero_silla INT NOT NULL,
	FOREIGN KEY (id_sala) REFERENCES Salas(id_sala),
	UNIQUE (id_silla, letra_fila, numero_silla)
);

CREATE TABLE Sillas_Funciones (
  id_silla_funcion SERIAL PRIMARY KEY,
  id_funcion INT NOT NULL,
  id_silla INT NOT NULL,
  disponible BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (id_funcion) REFERENCES Funciones(id_funcion),
  FOREIGN KEY (id_silla) REFERENCES Sillas(id_silla),
  UNIQUE (id_funcion, id_silla)
);
