/* Eliminar Utilizador */
DELETE * FROM Editor WHERE Editor.username = 'filetez';

/* Eliminar Notícia */
DELETE * FROM Noticia WHERE Notica.id = 1;

/* Eliminar Comentário */ 
DELETE * FROM Comentario WHERE Comentario.id = 1;

/* Eliminar Link e LinkNoticia */
DELETE * FROM Link,LinkNoticia WHERE Link.href = 'href' AND LinkNoticia.href = 'href';

/* Eliminar Categoria E NoticiaCategoria */
DELETE * FROM Categoria,NoticiaCategoria WHERE NoticiaCategoria.idNoticia = 1 AND Categoria.nome = 'nome';

/* Eliminar Interesse */
DELETE * FROM Interesse WHERE Interesse.nome = 'nome' AND username = 'filetez';

/* Eliminar Mensagem */ 
DELETE * FROM Mensagem WHERE Mensagem.id = 1;

/* Eliminar Amizade */
DELETE * FROM Amizade WHERE amigo1.username = 'filetez' AND amigo2.username = 'franganitoz';