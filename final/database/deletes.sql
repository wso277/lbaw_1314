/* Eliminar Utilizador */
DELETE * FROM Editor WHERE Editor.username LIKE 'filetez';

/* Eliminar Notícia */
DELETE * FROM Noticia WHERE Notica.id = 1;

/* Eliminar Comentário */ 
DELETE * FROM Comentario WHERE Comentario.id = 1;

/* Eliminar Link e LinkNoticia */
DELETE * FROM Link,LinkNoticia WHERE Link.href LIKE 'href' AND LinkNoticia.href LIKE 'href';

/* Eliminar Categoria E NoticiaCategoria */
DELETE * FROM Categoria,NoticiaCategoria WHERE NoticiaCategoria.idNoticia = 1 AND Categoria.nome LIKE 'nome';

/* Eliminar Interesse */
DELETE * FROM Interesse WHERE Interesse.nome LIKE 'nome' AND username LIKE 'filetez';

/* Eliminar Mensagem */ 
DELETE * FROM Mensagem WHERE Mensagem.id = 1;

/* Eliminar Amizade */
DELETE * FROM Amizade WHERE amigo1.username LIKE 'filetez' AND amigo2.username LIKE 'franganitoz';