Queries importantes:

/* Todos os likes das Noticias */
SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) AS Pontuacao FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia GROUP BY Noticia.idNoticia ORDER BY Pontuacao DESC;

/* Todos os likes dos Comentarios */
SELECT Comentario.idComentario, SUM (AvaliarComentario.avaliacao) FROM AvaliarComentario,Comentario,Noticia WHERE AvaliarComentario.idComentario = Comentario.idComentario AND Comentario.idNoticia = Noticia.idNoticia  GROUP BY Comentario.idComentario ORDER BY idComentario ASC;

/* Buscar utilizador por username */
SELECT * FROM Editor Where username='filetez';

/* Vista dos likes da noticia */
CREATE VIEW likes_noticia AS SELECT SUM (AvaliarNoticia.avaliacao) FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia GROUP BY Noticia.idNoticia;

/* Buscar pontuacao de uma noticia */
SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1 GROUP BY Noticia.idNoticia;

/* Numero de comentarios de uma noticia */
SELECT COUNT(*) FROM Comentario,Noticia WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1;

/* Comentarios de uma noticia */
SELECT DISTINCT Noticia.idNoticia,Comentario.conteudo FROM Noticia,Comentario WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = 1;

/* Buscar noticia por categoria */
SELECT Noticia.idNoticia, Noticia.titulo, Noticia.Conteudo FROM NoticiaCategoria,Noticia,Categoria Where NoticiaCategoria.idNoticia = Noticia.idNoticia AND NoticiaCategoria.idCategoria = Categoria.idCategoria AND Categoria.nome LIKE 'desporto';

/* Buscar mensagens enviadas de um utilizador */
SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor = Editor.idEditor AND Mensagem.recetor != Editor.idEditor AND Editor.username LIKE 'filetez';

/* Buscar mensagens recebidas de um utilizador */
SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor != Editor.idEditor AND Mensagem.recetor = Editor.idEditor AND Editor.username LIKE 'filetez';

/* Buscar amigos */
SELECT e1.nome,e2.nome FROM Editor e1, Editor e2, Amizade WHERE e1.idEditor = Amizade.amigo1 AND Amizade.amigo2 = e2.idEditor AND e1.username LIKE 'filetez';

/* Buscar links de uma noticia */
SELECT Noticia.idNoticia, Link.homeLink FROM Noticia,Link,LinkNoticia WHERE Noticia.idNoticia = LinkNoticia.idNoticia AND LinkNoticia.idLink = Link.idLink AND Noticia.idNoticia = 4;

/* Buscar Noticias de um utilizador */
SELECT Noticia.titulo, Editor.username FROM Noticia,Editor WHERE Noticia.idEditor = Editor.idEditor AND Editor.username LIKE 'filetez';

/* Update estado de um utilizador */
Update Editor SET estado='ban' WHERE username LIKE 'filetez';


/* Update email de um utilizador */
Update Editor SET email='novomail@mail.com' WHERE username LIKE 'filetez';


/* Update tipo de um utilizador */
Update Editor SET tipo='moderador' WHERE username LIKE 'filetez';

/* Update password de um utilizador */
Update Editor SET pass='passhypersegura' WHERE username LIKE 'filetez';