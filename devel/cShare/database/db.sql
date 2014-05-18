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
	fotografia VARCHAR NOT NULL,
	likes INTEGER NOT NULL,
	username VARCHAR(15) REFERENCES Editor ON DELETE CASCADE
	);

/* Comentários */
CREATE TABLE IF NOT EXISTS Comentario(
	idComentario SERIAL PRIMARY KEY,
	conteudo VARCHAR(140) NOT NULL,
	username VARCHAR(15) REFERENCES Editor ON DELETE CASCADE, 
	idNoticia INTEGER REFERENCES Noticia ON DELETE CASCADE
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
	FOREIGN KEY(idNoticia) REFERENCES Noticia ON DELETE CASCADE, 
	FOREIGN KEY(href) REFERENCES Link ON DELETE CASCADE
	);

/* Categorias */
CREATE TABLE IF NOT EXISTS Categoria(
	nome VARCHAR PRIMARY KEY NOT NULL
	);

/* Categorias de Noticias */
CREATE TABLE IF NOT EXISTS NoticiaCategoria(
	idNoticia INTEGER,
	nome VARCHAR,
	CONSTRAINT un UNIQUE(idNoticia,nome),
	FOREIGN KEY(idNoticia) REFERENCES Noticia ON DELETE CASCADE,
	FOREIGN KEY(nome) REFERENCES Categoria ON DELETE CASCADE
	);

/* Interesses */
CREATE TABLE IF NOT EXISTS Interesse(
	username VARCHAR(15),
	nome VARCHAR,
	FOREIGN KEY(username) REFERENCES Editor ON DELETE CASCADE,
	FOREIGN KEY(nome) REFERENCES Categoria ON DELETE CASCADE
	);

/* Mensagem */
CREATE TABLE IF NOT EXISTS Mensagem(
	idMensagem SERIAL PRIMARY KEY,
	emissor VARCHAR(15) REFERENCES Editor ON DELETE CASCADE,
	recetor VARCHAR(15) REFERENCES Editor ON DELETE CASCADE,
	titulo VARCHAR NOT NULL,
	conteudo VARCHAR(140) NOT NULL
	);

/* Amizade */
CREATE TABLE IF NOT EXISTS Amizade(
	amigo1 VARCHAR(15),
	amigo2 VARCHAR(15) REFERENCES Editor ON DELETE CASCADE,
	FOREIGN KEY(amigo1) REFERENCES Editor ON DELETE CASCADE,
	CONSTRAINT am UNIQUE(amigo1,amigo2),
	CHECK (amigo1<amigo2)
	);

/* AvaliarNoticia */
CREATE TABLE IF NOT EXISTS AvaliarNoticia(
	chave SERIAL PRIMARY KEY,
	username VARCHAR(15) REFERENCES Editor ON DELETE CASCADE,
	idNoticia INTEGER REFERENCES Noticia ON DELETE CASCADE,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);

/* AvaliarComentario */
CREATE TABLE IF NOT EXISTS AvaliarComentario(
	chave SERIAL PRIMARY KEY,
	username VARCHAR(15) REFERENCES Editor ON DELETE CASCADE,
	idComentario INTEGER REFERENCES Comentario ON DELETE CASCADE,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);

/*Index*/
CREATE INDEX notcat ON NoticiaCategoria (nome);
CREATE INDEX coment ON Comentario (idNoticia);
CREATE INDEX lknot ON LinkNoticia (idNoticia);
CREATE INDEX ON Editor ((lower(username)));
CREATE INDEX notIndex ON Noticia(likes);
CREATE INDEX avalnoticia ON AvaliarNoticia (idNoticia);
CREATE INDEX avalcomentario ON AvaliarComentario (idComentario);

CREATE OR REPLACE FUNCTION deleteEditor() RETURNS TRIGGER AS $deleteEditor$ 
	BEGIN
		DELETE FROM Amizade WHERE amigo1 = OLD.username OR amigo2 = OLD.username;
		DELETE FROM Interesse WHERE username = OLD.username;
		UPDATE Editor SET estado_user = 'ban' WHERE username = OLD.username;
		RETURN NULL;
	END;
$deleteEditor$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deleteCategoria() RETURNS TRIGGER AS $deleteCategoria$ 
	BEGIN
		DELETE FROM Noticia WHERE idNoticia IN (SELECT idNoticia FROM NoticiaCategoria WHERE nome = OLD.nome);
		RETURN OLD;
	END;
$deleteCategoria$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION updateLikes() RETURNS TRIGGER AS $updateLikes$ 
	BEGIN
		UPDATE Noticia SET likes = (SELECT SUM(avaliacao) FROM AvaliarNoticia WHERE idNoticia = OLD.idNoticia) WHERE idNoticia = (SELECT idNoticia FROM AvaliarNoticia WHERE idNoticia = OLD.idNoticia);
		RETURN OLD;
	END;
$updateLikes$ LANGUAGE plpgsql;

CREATE TRIGGER updateLikes AFTER INSERT ON AvaliarNoticia FOR EACH ROW EXECUTE PROCEDURE updateLikes();
CREATE TRIGGER delUser BEFORE DELETE ON Editor FOR EACH ROW EXECUTE PROCEDURE deleteEditor();
CREATE TRIGGER delCat BEFORE DELETE ON Categoria FOR EACH ROW EXECUTE PROCEDURE deleteCategoria();