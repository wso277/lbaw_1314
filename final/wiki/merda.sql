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
	FOREIGN KEY(href) REFERENCES Link
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
	amigo1 VARCHAR(15),
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

/*Index*/
CREATE INDEX noticia_index ON Noticia (idNoticia);
CREATE INDEX notcat ON NoticiaCategoria (nome);
CREATE INDEX coment ON Comentario (idNoticia);
CREATE INDEX lknot ON LinkNoticia (idNoticia);
CREATE INDEX ON Editor ((lower(username)));
CREATE INDEX cat ON Categoria (nome);
CREATE INDEX avalnoticia ON AvaliarNoticia (idNoticia);
CREATE INDEX avalcomentario ON AvaliarComentario (idComentario);

INSERT INTO Editor VALUES('filetez','Joao Filetes','Ali acola','987654321','welele@fe.up.pt','autista','asasasa','editor','bantemp');
INSERT INTO Editor VALUES('rabandaz','Wiwson Rabanadas','Ali alem','987654321','welelf@fe.up.pt','autista','asasasa','editor','bantemp');    
INSERT INTO Editor VALUES('tiburoenz','Luis Tubarao','Ali no caralho','987654321','welela@fe.up.pt','autista','asasasa','editor','bantemp');  
INSERT INTO Editor VALUES('franganitoz','Fabio Franganito','Ali no caralhao te foda','987654321','welile@fe.up.pt','autista','asasasa','editor','bantemp');  

INSERT INTO Noticia VALUES(DEFAULT,'Pinto da Costa acaba de comer outra gaja','titulo','2000-12-16','filetez');
INSERT INTO Noticia VALUES(DEFAULT,'Jorge Jesus volta a ladrar','titulo','2000-12-16','rabandaz');
INSERT INTO Noticia VALUES(DEFAULT,'Jorge Jesus engasga-se a falar','titulo','2000-12-16','tiburoenz');
INSERT INTO Noticia VALUES(DEFAULT,'Bruno de Carvalho tem clausula de rescisao de 150 milhoes de euros','titulo','2000-12-16','franganitoz');

INSERT INTO Categoria VALUES('desporto');
INSERT INTO Categoria VALUES('futebol');
INSERT INTO Categoria VALUES('cinema');
INSERT INTO Categoria VALUES('literatura');
INSERT INTO Categoria VALUES('agricultura');
INSERT INTO Categoria VALUES('politica');
INSERT INTO Categoria VALUES('sexo');
INSERT INTO Categoria VALUES('video-jogos');
INSERT INTO Categoria VALUES('atualidade');
INSERT INTO Categoria VALUES('gastronomia'); 

INSERT INTO NoticiaCategoria VALUES(1,'desporto');
INSERT INTO NoticiaCategoria VALUES(2,'futebol');
INSERT INTO NoticiaCategoria VALUES(3,'cinema');
INSERT INTO NoticiaCategoria VALUES(4,'literatura');

INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',1,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'rabandaz',3,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',1,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',2,-1);

/*Editor,Noticia*/
INSERT INTO Comentario VALUES(DEFAULT,'GANDA GAJA OH BELHOTE','filetez',1);
INSERT INTO Comentario VALUES(DEFAULT,'TCH NUNCA PENSEI','filetez',2);
INSERT INTO Comentario VALUES(DEFAULT,'POAH','tiburoenz',1);
INSERT INTO Comentario VALUES(DEFAULT,'WELELELELELE','rabandaz',3);
INSERT INTO Comentario VALUES(DEFAULT,'VOU TE MALABAAAAAAAAAAR','filetez',4);
INSERT INTO Comentario VALUES(DEFAULT,'TEMOS QUE MUDAR ESTA MERDA','franganitoz',2);

/* Editor,Comentario, Avaliacao*/
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',1,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',2,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'rabandaz',3,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'tiburoenz',1,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'franganitoz',2,-1);

INSERT INTO Mensagem VALUES(DEFAULT,'filetez','rabandaz','titulo1','ganda cena oh belhoooooteeeee');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','tiburoenz','titulo2','ganda cena oh filhoooooteeeee');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','franganitoz','titulo3','ganda cena oh velhoooooteeeee');
INSERT INTO Mensagem VALUES(DEFAULT,'rabandaz','filetez','titulo4','olha, cenas aconteceram');
INSERT INTO Mensagem VALUES(DEFAULT,'tiburoenz','filetez','titulo4','olha, hoje nao vai pintar');

INSERT INTO Amizade VALUES('filetez','rabandaz');
INSERT INTO Amizade VALUES('filetez','tiburoenz');
INSERT INTO Amizade VALUES('filetez','franganitoz');
INSERT INTO Amizade VALUES('rabandaz','tiburoenz');

INSERT INTO Link VALUES('http://www.abola.pt/ojorgejesusladrou','abola.pt');
INSERT INTO Link VALUES('http://www.abola.pt/ojorgejesusengasgouse','abola.pt');
INSERT INTO Link VALUES('http://www.abola.pt/fonsecapensaquestaem2013','abola.pt');
INSERT INTO Link VALUES('http://www.abola.pt/marcosilvacoiso','abola.pt');
INSERT INTO Link VALUES('http://www.abola.pt/olaeusouox','abola.pt');
INSERT INTO Link VALUES('http://www.abola.pt/olacomoestas','abola.pt');

/* Noticia, Link*/
INSERT INTO LinkNoticia VALUES(1,'http://www.abola.pt/ojorgejesusladrou');
INSERT INTO LinkNoticia VALUES(2,'http://www.abola.pt/fonsecapensaquestaem2013');
INSERT INTO LinkNoticia VALUES(4,'http://www.abola.pt/ojorgejesusengasgouse');
INSERT INTO LinkNoticia VALUES(4,'http://www.abola.pt/fonsecapensaquestaem2013');

/* Editor, Categoria */
INSERT INTO Interesse VALUES('filetez','desporto');
INSERT INTO Interesse VALUES('filetez','futebol');
INSERT INTO Interesse VALUES('filetez','cinema');
INSERT INTO Interesse VALUES('filetez','literatura');
INSERT INTO Interesse VALUES('rabandaz','desporto');
INSERT INTO Interesse VALUES('tiburoenz','cinema');
INSERT INTO Interesse VALUES('franganitoz','atualidade');
INSERT INTO Interesse VALUES('rabandaz','sexo');
INSERT INTO Interesse VALUES('tiburoenz','video-jogos');
INSERT INTO Interesse VALUES('franganitoz','literatura');

CREATE OR REPLACE FUNCTION deleteComentario() RETURNS TRIGGER AS $deleteComentario$ 
	BEGIN
		DELETE FROM AvaliarComentario WHERE idComentario = OLD.idComentario;
		RETURN OLD;
	END;
$deleteComentario$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deleteNoticia() RETURNS TRIGGER AS $deleteNoticia$ 
	BEGIN
		DELETE FROM AvaliarNoticia WHERE idNoticia = OLD.idNoticia;
		DELETE FROM Comentario WHERE idNoticia = OLD.idNoticia;
		DELETE FROM NoticiaCategoria WHERE idNoticia = OLD.idNoticia;
		DELETE FROM LinkNoticia WHERE idNoticia = OLD.idNoticia;
		RETURN OLD;
	END;
$deleteNoticia$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deleteEditor() RETURNS TRIGGER AS $deleteEditor$ 
	BEGIN
		DELETE FROM Amizade WHERE amigo1 = OLD.username OR amigo2 = OLD.username;
		DELETE FROM Interesse WHERE username = OLD.username;
		UPDATE Editor SET estado_user = 'ban' WHERE username = OLD.username;
		RETURN NULL;
	END;
$deleteEditor$ LANGUAGE plpgsql;

CREATE TRIGGER delComm BEFORE DELETE ON Comentario FOR EACH ROW EXECUTE PROCEDURE deleteComentario();
CREATE TRIGGER delNot BEFORE DELETE ON Noticia FOR EACH ROW EXECUTE PROCEDURE deleteNoticia();
CREATE TRIGGER delUser BEFORE DELETE ON Editor FOR EACH ROW EXECUTE PROCEDURE deleteEditor(); 