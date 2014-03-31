/*drop de todas as tabelas*/
DROP TABLE IF EXISTS Noticia CASCADE;
DROP TABLE IF EXISTS Comentario CASCADE;
DROP TABLE IF EXISTS Link CASCADE;
DROP TABLE IF EXISTS LinkNoticia CASCADE;
DROP TABLE IF EXISTS NoticiaCategoria CASCADE;
DROP TABLE IF EXISTS Categoria CASCADE;
DROP TYPE IF EXISTS tipo CASCADE;
DROP TYPE IF EXISTS estado CASCADE;

CREATE TYPE tipo AS ENUM ('editor','moderador');
CREATE TYPE estado AS ENUM ('ban', 'bantemp', 'normal');

/* Notícias */
CREATE TABLE IF NOT EXISTS Noticia(
	idNoticia SERIAL PRIMARY KEY,
	conteudo VARCHAR NOT NULL, 
	titulo VARCHAR(85) NOT NULL, 
	data  DATE DEFAULT CURRENT_DATE, 
	idEditor INTEGER REFERENCES Editor(idEditor)
	);

/* Comentários */
CREATE TABLE IF NOT EXISTS Comentario(
	idComentario SERIAL PRIMARY KEY,
	conteudo VARCHAR(140) NOT NULL,
	idEditor INTEGER REFERENCES Editor(idEditor), 
	idNoticia INTEGER REFERENCES Noticia(idNoticia)
	);

/* Links */
CREATE TABLE IF NOT EXISTS Link(
	idLink SERIAL PRIMARY KEY,
	HomeLink VARCHAR NOT NULL,
	href VARCHAR NOT NULL
	);

/* Links para Noticias */
CREATE TABLE IF NOT EXISTS LinkNoticia(
	idNoticia INTEGER REFERENCES Noticia(idNoticia),
	idLink INTEGER REFERENCES Link(idLink)
	);

/* Categorias */
CREATE TABLE IF NOT EXISTS Categoria(
	idCategoria SERIAL PRIMARY KEY,
	Nome VARCHAR NOT NULL
	);

/* Categorias de Noticias */
CREATE TABLE IF NOT EXISTS NoticiaCategoria(
	idNoticia INTEGER REFERENCES Noticia(idNoticia),
	idCategoria INTEGER REFERENCES Categoria(idCategoria)
	);

/* Interesses */
CREATE TABLE IF NOT EXISTS Interesse(
	idEditor INTEGER REFERENCES Editor(idEditor),
	idCategoria INTEGER REFERENCES Categoria(idCategoria)
	);

/* Editor */
CREATE TABLE IF NOT EXISTS Editor(
	idEditor SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL,
	localidade VARCHAR NOT NULL,
	username VARCHAR(15) UNIQUE NOT NULL,
	pass VARCHAR NOT NULL,
	profissao VARCHAR NOT NULL,
	fotografia VARCHAR,
	tipo tipo NOT NULL,
	estado estado NOT NULL,
	CHECK (char_length(pass) > 8),
	CHECK (char_length(username) > 6)
	);

/* Mensagem */
CREATE TABLE IF NOT EXISTS Mensagem(
	idMensagem SERIAL PRIMARY KEY,
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
	chave SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor(idEditor),
	idNoticia INTEGER REFERENCES Noticia(idNoticia)
	);

/* AvaliarComentario */
CREATE TABLE IF NOT EXISTS AvaliarComentario(
	chave SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor(idEditor),
	idComentario INTEGER REFERENCES Comentario(idComentario)
	);
