/*drop de todas as tabelas*/
DROP TABLE IF EXISTS Noticia;
DROP TABLE IF EXISTS Comentario;
DROP TABLE IF EXISTS Link;
DROP TABLE IF EXISTS LinkNoticia;
DROP TABLE IF EXISTS NoticiaCategoria;
DROP TABLE IF EXISTS Categoria;

CREATE TYPE TIPO AS ENUM ('editor' 'moderador');
CREATE TYPE ESTADO AS ENUM ('ban', 'bantemp', 'normal');

/* Notícias */
CREATE TABLE IF NOT EXISTS Noticia(
	idNoticia INTEGER SERIAL PRIMARY KEY,
	conteudo VARCHAR NOT NULL, 
	titulo VARCHAR(85) NOT NULL, 
	data  DATE DEFAULT CURRENT_DATE, 
	idEditor INTEGER REFERENCES Editor(idEditor)
	);

/* Comentários */
CREATE TABLE IF NOT EXISTS Comentario(
	idComentario INTEGER SERIAL PRIMARY KEY,
	conteudo VARCHAR(140) NOT NULL,
	idEditor INTEGER REFERENCES Editor(idEditor), 
	idNoticia INTEGER REFERENCES Noticia(idNoticia)
	);

/* Links */
CREATE TABLE IF NOT EXISTS Link(
	idLink INTEGER SERIAL PRIMARY KEY,
	HomeLink VARCHAR NOT NULL,
	href VARCHAR PRIMARY KEY NOT NULL
	);

/* Links para Noticias */
CREATE TABLE IF NOT EXISTS LinkNoticia(
	idNoticia INTEGER REFERENCES Noticia(idNoticia),
	idLink INTEGER REFERENCES Link(idLink)
	);

/* Categorias de Noticias */
CREATE TABLE IF NOT EXISTS NoticiaCategoria(
	idNoticia INTEGER REFERENCES Noticia(idNoticia),
	idCategoria INTEGER REFERENCES Categoria(idCategoria)
	);

/* Categorias */
CREATE TABLE IF NOT EXISTS Categoria(
	idCategoria INTEGER SERIAL PRIMARY KEY,
	Nome VARCHAR PRIMARY KEY NOT NULL
	);

/* Interesses */
CREATE TABLE IF NOT EXISTS Interesse(
	idEditor INTEGER REFERENCES Editor(idEditor),
	idCategoria INTEGER REFERENCES Categoria(idCategoria)
	);

/* Editor */
CREATE TABLE IF NOT EXISTS Editor(
	idEditor INTEGER SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL,
	localidade VARCHAR NOT NULL,
	username VARCHAR(15) UNIQUE NOT NULL,
	pass VARCHAR NOT NULL,
	profissao VARCHAR NOT NULL,
	fotografia VARCHAR,
	tipo TIPO NOT NULL,
	estado ESTADO NOT NULL,
	CHECK (char_length(pass) > 8),
	CHECK (char_length(username) > 6)
	);

/* Mensagem */
CREATE TABLE IF NOT EXISTS Mensagem(
	idMensagem INTEGER SERIAL PRIMARY KEY,
	emissor INTEGER REFERENCES Editor(idEditor),
	recetor INTEGER REFERENCES Editor(idEditor),
	titulo VARCHAR NOT NULL,
	conteudo VARCHAR(140) NOT NULL
	);

/* Amizade */
CREATE TABLE IF NOT EXISTS Amizade(
	amigo1 INTEGER REFERENCES Editor(idEditor),
	amigo2 INTEGER REFERENCES Editor(idEditor),
	CHECK (amigo1<amigo2)
	);

/* AvaliarNoticia */
CREATE TABLE IF NOT EXISTS AvaliarNoticia(
	chave INTEGER SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor(idEditor),
	idNoticia INTEGER REFERENCES Editor(idNoticia)
	);

/* AvaliarComentario */
CREATE TABLE IF NOT EXISTS AvaliarComentario(
	chave INTEGER SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor(idEditor),
	idComentario INTEGER REFERENCES Editor(idComentario)
	);
