/*drop de todas as tabelas*/
DROP TABLE IF EXISTS Noticia CASCADE;
DROP TABLE IF EXISTS Comentario CASCADE;
DROP TABLE IF EXISTS Link CASCADE;
DROP TABLE IF EXISTS LinkNoticia CASCADE;
DROP TABLE IF EXISTS NoticiaCategoria CASCADE;
DROP TABLE IF EXISTS Categoria CASCADE;
DROP TABLE IF EXISTS Interesse CASCADE;
DROP TABLE IF EXISTS Editor CASCADE;
DROP TABLE IF EXISTS Mensagem CASCADE;
DROP TABLE IF EXISTS Amizade CASCADE;
DROP TABLE IF EXISTS AvaliarNoticia CASCADE;
DROP TABLE IF EXISTS AvaliarComentario CASCADE;
DROP TYPE IF EXISTS tipo CASCADE;
DROP TYPE IF EXISTS estado CASCADE;

CREATE TYPE tipo AS ENUM ('editor','moderador');
CREATE TYPE estado AS ENUM ('ban', 'bantemp', 'normal');

/* Editor */
CREATE TABLE IF NOT EXISTS Editor(
	username VARCHAR(15) PRIMARY KEY NOT NULL,
	nome VARCHAR NOT NULL,
	localidade VARCHAR NOT NULL,
	pass VARCHAR NOT NULL,
	email VARCHAR UNIQUE NOT NULL,
	profissao VARCHAR NOT NULL,
	fotografia VARCHAR,
	tipo_user tipo,
	estado_user estado,
	CHECK (char_length(pass) > 8),
	CHECK (char_length(username) > 6)
	);

/* Notícias */
CREATE TABLE IF NOT EXISTS Noticia(
	idNoticia SERIAL PRIMARY KEY,
	conteudo VARCHAR NOT NULL, 
	titulo VARCHAR(85) NOT NULL, 
	data_post  DATE DEFAULT CURRENT_DATE, 
	username VARCHAR(15) REFERENCES Editor
	);

/* Comentários */
CREATE TABLE IF NOT EXISTS Comentario(
	idComentario SERIAL PRIMARY KEY,
	conteudo VARCHAR(140) NOT NULL,
	username VARCHAR(15) REFERENCES Editor, 
	idNoticia INTEGER REFERENCES Noticia
	);

/* Links */
CREATE TABLE IF NOT EXISTS Link(
	href VARCHAR PRIMARY KEY NOT NULL,
	homeLink VARCHAR NOT NULL
	);

/* Links para Noticias */
CREATE TABLE IF NOT EXISTS LinkNoticia(
	idNoticia INTEGER, 
	href VARCHAR,
	FOREIGN KEY(idNoticia) REFERENCES Noticia, 
	FOREIGN KEY(href) REFERENCES Link,
	);

/* Categorias */
CREATE TABLE IF NOT EXISTS Categoria(
	nome VARCHAR PRIMARY KEY NOT NULL
	);

/* Categorias de Noticias */
CREATE TABLE IF NOT EXISTS NoticiaCategoria(
	idNoticia INTEGER,
	nome VARCHAR,
	FOREIGN KEY(idNoticia) REFERENCES Noticia,
	FOREIGN KEY(nome) REFERENCES Categoria
	);

/* Interesses */
CREATE TABLE IF NOT EXISTS Interesse(
	username VARCHAR(15),
	nome VARCHAR,
	FOREIGN KEY(username) REFERENCES Editor,
	FOREIGN KEY(nome) REFERENCES Categoria
	);

/* Mensagem */
CREATE TABLE IF NOT EXISTS Mensagem(
	idMensagem SERIAL PRIMARY KEY,
	emissor VARCHAR(15) REFERENCES Editor,
	recetor VARCHAR(15) REFERENCES Editor,
	titulo VARCHAR NOT NULL,
	conteudo VARCHAR(140) NOT NULL
	);

/* Amizade */
CREATE TABLE IF NOT EXISTS Amizade(
	amigo1 VARCHAR(15) 
	amigo2 VARCHAR(15) REFERENCES Editor,
	FOREIGN KEY(amigo1) REFERENCES Editor,
	CHECK (amigo1<amigo2)
	);

/* AvaliarNoticia */
CREATE TABLE IF NOT EXISTS AvaliarNoticia(
	chave SERIAL PRIMARY KEY,
	username VARCHAR(15) REFERENCES Editor,
	idNoticia INTEGER REFERENCES Noticia,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);

/* AvaliarComentario */
CREATE TABLE IF NOT EXISTS AvaliarComentario(
	chave SERIAL PRIMARY KEY,
	username VARCHAR(15) REFERENCES Editor,
	idComentario INTEGER REFERENCES Comentario,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);
