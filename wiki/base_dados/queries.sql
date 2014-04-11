/* Todos os likes das Noticias */
SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) AS Pontuacao FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia GROUP BY Noticia.idNoticia ORDER BY Pontuacao DESC;

/* Todos os likes dos Comentarios */
SELECT Comentario.idComentario, SUM (AvaliarComentario.avaliacao) FROM AvaliarComentario,Comentario,Noticia WHERE AvaliarComentario.idComentario = Comentario.idComentario AND Comentario.idNoticia = Noticia.idNoticia  GROUP BY Comentario.idComentario ORDER BY idComentario ASC;

/* Vista dos likes da noticia */
CREATE VIEW likes_noticia AS SELECT SUM (AvaliarNoticia.avaliacao) FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia GROUP BY Noticia.idNoticia;

/* Buscar pontuacao de uma noticia */
SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1 GROUP BY Noticia.idNoticia;

/* Numero de comentarios de uma noticia */
SELECT COUNT(*) FROM Comentario,Noticia WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1;

/* Comentarios de uma noticia */
SELECT DISTINCT Noticia.idNoticia,Comentario.conteudo FROM Noticia,Comentario WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1;

/* Buscar noticia por categoria */
SELECT Noticia.idNoticia, Noticia.titulo, Noticia.Conteudo FROM NoticiaCategoria,Noticia,Categoria Where NoticiaCategoria.idNoticia = Noticia.idNoticia AND NoticiaCategoria.nome = Categoria.nome AND Categoria.nome LIKE 'desporto';

/* Buscar mensagens enviadas de um utilizador */
SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor = Editor.username AND Mensagem.recetor != Editor.username AND Editor.username LIKE 'filetez';

/* Buscar mensagens recebidas de um utilizador */
SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor != Editor.username AND Mensagem.recetor = Editor.username AND Editor.username LIKE 'filetez';

/* Buscar amigos */
SELECT e1.nome,e2.nome FROM Editor e1, Editor e2, Amizade WHERE e1.username = Amizade.amigo1 AND Amizade.amigo2 = e2.username AND (e1.username LIKE 'filetez' OR e2.username LIKE 'filetez');

/* Buscar links de uma noticia */
SELECT Noticia.idNoticia, Link.homeLink FROM Noticia,Link,LinkNoticia WHERE Noticia.idNoticia = LinkNoticia.idNoticia AND LinkNoticia.href = Link.href AND Noticia.idNoticia = 4;

/* Update estado de um utilizador */
Update Editor SET estado_user = 'ban' WHERE username LIKE 'filetez';


/* Update email de um utilizador */
Update Editor SET email = 'novomail@mail.com' WHERE username LIKE 'filetez';


/* Update tipo de um utilizador */
Update Editor SET tipo_user = 'moderador' WHERE username LIKE 'filetez';

/* Update password de um utilizador */
Update Editor SET pass = 'passhypersegura' WHERE username LIKE 'filetez';

/*Fazer login*/
SELECT username, pass FROM Editor WHERE Editor.username like 'something' and Editor.pass like 'fskfs';

/*Registo*/ 
BEGIN TRANSACTION;
SELECT username, pass FROM Editor WHERE Editor.username like 'something' and Editor.pass like 'fskfs';
INSERT INTO Editor VALUES('filetez','Joao Filetes','Ali acola','987654321','welele@fe.up.pt','autista','asasasa','moderador','normal');
COMMIT;

/* Buscar utilizador por username */
SELECT * FROM Editor Where username='filetez';

/* Buscar Noticias de um utilizador */
SELECT Noticia.titulo, Noticia.conteudo FROM Noticia,Editor WHERE Noticia.username = Editor.username AND Editor.username LIKE 'filetez';
SELECT Link.homeLink FROM LinkNoticia, Link WHERE LinkNoticia.idNoticia = 1 AND Link.href = LinkNoticia.href;

/*adicionar amizade*/
BEGIN;
SELECT username FROM Editor Where username='user1';
SELECT username FROM Editor Where username='user2';
INSERT INTO Amizade VALUES ('user1', 'user2');
COMMIT;

/*send message*/
BEGIN;
SELECT username FROM Editor Where username='user1';
SELECT username FROM Editor Where username='user2';
INSERT INTO Mensagem VALUES (DEFAULT, 'user1', 'user2', 'titulo', 'conteudo');
COMMIT;

/*avaliar*/
BEGIN TRANSACTION;
SELECT AvaliarNoticia.avaliacao FROM AvaliarNoticia WHERE AvaliarNoticia.idNoticia = 1 and AvaliarNoticia.username = 'user1';
/*se existe*/
UPDATE AvaliarNoticia SET avaliacao = 1 WHERE AvaliarNoticia.idNoticia = 1 and AvaliarNoticia.username = 'user1';
/*nao existe*/
INSERT INTO AvaliarNoticia VALUES (DEFAULT, username, idNoticia, 1);
COMMIT;

/*stuff friends liked*/
SELECT e1.username,e2.username FROM Editor e1, Editor e2, Amizade WHERE e1.username = Amizade.amigo1 AND Amizade.amigo2 = e2.username AND (e1.username LIKE 'filetez' OR e2.username LIKE 'filetez');
SELECT Noticia.idNoticia FROM Noticia, AvaliarNoticia WHERE AvaliarNoticia.username = 'friend' and AvaliarNoticia.avaliacao = 1 and Noticia.idNoticia = AvaliarNoticia.idNoticia;


/*post friends */
SELECT e1.username,e2.username FROM Editor e1, Editor e2, Amizade WHERE e1.username = Amizade.amigo1 AND Amizade.amigo2 = e2.username AND (e1.username LIKE 'filetez' OR e2.username LIKE 'filetez');
SELECT * FROM Noticia WHERE Noticia.username = 'friend';

/* pesquisas */
SELECT Noticia.idNoticia FROM Noticia WHERE Noticia.titulo LIKE '%something%';
SELECT Noticia.idNoticia FROM Noticia WHERE Noticia.conteudo LIKE '%something%';
SELECT Noticia.idNoticia FROM Noticia WHERE Noticia.data_post LIKE '2014-01-23';
SELECT Editor.username FROM Editor WHERE Editor.username LIKE '%user1%';
/* noticia de categoria */
SELECT Noticia.idNoticia FROM Noticia, NoticiaCategoria WHERE NoticiaCategoria.nome like 'nome' and Noticia.idNoticia = NoticiaCategoria.idNoticia;
/* user por interesse */
SELECT Editor.username FROM Editor, Interesse WHERE Interesse.nome like 'nome' and Editor.username = Interesse.username;

/* publicacao */
BEGIN TRANSACTION;
INSERT INTO Noticia VALUES (DEFAULT, conteudo, titulo, data, username);
INSERT INTO Link VALUES (href, homeLink);
INSERT INTO LinkNoticia VALUES (idNoticia, href);
COMMIT;

/* Editar Comentário */
SELECT Comentario.idComentario FROM Comentario, Noticia WHERE Comentario.username LIKE 'username' AND Comentario.idNoticia = Noticia.idNoticia;
UPDATE Comentario SET conteudo = 'texto editado' WHERE Comentario.idComentario = id;