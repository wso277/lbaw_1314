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
	data_post  DATE DEFAULT CURRENT_DATE, 
	idEditor INTEGER REFERENCES Editor
	);

/* Comentários */
CREATE TABLE IF NOT EXISTS Comentario(
	idComentario SERIAL PRIMARY KEY,
	conteudo VARCHAR(140) NOT NULL,
	idEditor INTEGER REFERENCES Editor, 
	idNoticia INTEGER REFERENCES Noticia
	);

/* Links */
CREATE TABLE IF NOT EXISTS Link(
	idLink SERIAL PRIMARY KEY,
	HomeLink VARCHAR NOT NULL,
	href VARCHAR NOT NULL
	);

/* Links para Noticias */
CREATE TABLE IF NOT EXISTS LinkNoticia(
	idNoticia INTEGER REFERENCES Noticia,
	idLink INTEGER REFERENCES Link
	);

/* Categorias */
CREATE TABLE IF NOT EXISTS Categoria(
	idCategoria SERIAL PRIMARY KEY,
	Nome VARCHAR NOT NULL
	);

/* Categorias de Noticias */
CREATE TABLE IF NOT EXISTS NoticiaCategoria(
	idNoticia INTEGER REFERENCES Noticia,
	idCategoria INTEGER REFERENCES Categoria
	);

/* Interesses */
CREATE TABLE IF NOT EXISTS Interesse(
	idEditor INTEGER REFERENCES Editor,
	idCategoria INTEGER REFERENCES Categoria
	);

/* Editor */
CREATE TABLE IF NOT EXISTS Editor(
	idEditor SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL,
	localidade VARCHAR NOT NULL,
	username VARCHAR(15) UNIQUE NOT NULL,
	pass VARCHAR NOT NULL,
	email VARCHAR UNIQUE NOT NULL,
	profissao VARCHAR NOT NULL,
	fotografia VARCHAR,
	tipo_user tipo,
	estado_user estado,
	CHECK (char_length(pass) > 8),
	CHECK (char_length(username) > 6)
	);

/* Mensagem */
CREATE TABLE IF NOT EXISTS Mensagem(
	idMensagem SERIAL PRIMARY KEY,
	emissor INTEGER REFERENCES Editor,
	recetor INTEGER REFERENCES Editor,
	titulo VARCHAR NOT NULL,
	conteudo VARCHAR(140) NOT NULL
	);

/* Amizade */
CREATE TABLE IF NOT EXISTS Amizade(
	amigo1 INTEGER REFERENCES Editor,
	amigo2 INTEGER REFERENCES Editor,
	CHECK (amigo1<amigo2)
	);

/* AvaliarNoticia */
CREATE TABLE IF NOT EXISTS AvaliarNoticia(
	chave SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor,
	idNoticia INTEGER REFERENCES Noticia,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);

/* AvaliarComentario */
CREATE TABLE IF NOT EXISTS AvaliarComentario(
	chave SERIAL PRIMARY KEY,
	idEditor INTEGER REFERENCES Editor,
	idComentario INTEGER REFERENCES Comentario,
	avaliacao INTEGER NOT NULL,
	CHECK (avaliacao = -1 OR avaliacao = 1)
	);

INSERT INTO Editor VALUES (DEFAULT,'Joao Filetes','Ali acola','filetez','987654321','welele@fe.up.pt','autista','asasasa','editor','bantemp');
INSERT INTO Editor VALUES (DEFAULT,'Wiwson Rabanadas','Ali alem','rabandaz','987654321','welelf@fe.up.pt','autista','asasasa','editor','bantemp');    
INSERT INTO Editor VALUES (DEFAULT,'Luis Salmao','Ali no caralho','salmaez','987654321','welela@fe.up.pt','autista','asasasa','editor','bantemp');  
INSERT INTO Editor VALUES (DEFAULT,'Fabio Franganito','Ali no caralhao te foda','franganitoz','987654321','welile@fe.up.pt','autista','asasasa','editor','bantemp');  

INSERT INTO Noticia VALUES(DEFAULT,'Pinto da Costa acaba de comer outra gaja','titulo','2000-12-16',1);
INSERT Noticia INTO VALUES(DEFAULT,'Jorge Jesus volta a ladrar','titulo','2000-12-16',2);
INSERT INTO Noticia VALUES(DEFAULT,'Jorge Jesus engasga-se a falar','titulo','2000-12-16',3);
INSERT INTO Noticia VALUES(DEFAULT,'Bruno de Carvalho tem clausula de rescisao de 150 milhoes de euros','titulo','2000-12-16',4);

INSERT INTO Categoria VALUES(DEFAULT, 'desporto');
INSERT INTO Categoria VALUES(DEFAULT, 'futebol');
INSERT INTO Categoria VALUES(DEFAULT, 'cinema');
INSERT INTO Categoria VALUES(DEFAULT, 'literatura');
INSERT INTO Categoria VALUES(DEFAULT, 'agricultura');
INSERT INTO Categoria VALUES(DEFAULT, 'politica');
INSERT INTO Categoria VALUES(DEFAULT, 'sexo');
INSERT INTO Categoria VALUES(DEFAULT, 'video-jogos');
INSERT INTO Categoria VALUES(DEFAULT, 'atualidade');
INSERT INTO Categoria VALUES(DEFAULT, 'gastronomia'); 

INSERT INTO NoticiaCategoria VALUES(1,1);
INSERT INTO NoticiaCategoria VALUES(2,2);
INSERT INTO NoticiaCategoria VALUES(3,3);
INSERT INTO NoticiaCategoria VALUES(4,4);

INSERT INTO AvaliarNoticia VALUES(DEFAULT,1,1,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,1,2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,2,3,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,3,1,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,4,2,-1);

INSERT INTO Comentario VALUES(DEFAULT,'GANDA GAJA OH BELHOTE',4,1);
INSERT INTO Comentario VALUES(DEFAULT,'TCH NUNCA PENSEI',3,2);
INSERT INTO Comentario VALUES(DEFAULT,'POAH',3,1);
INSERT INTO Comentario VALUES(DEFAULT,'WELELELELELE',2,3);
INSERT INTO Comentario VALUES(DEFAULT,'VOU TE MALABAAAAAAAAAAR',1,4);
INSERT INTO Comentario VALUES(DEFAULT,'TEMOS QUE MUDAR ESTA MERDA',4,1);
