/*Index*/
CREATE INDEX noticia ON Noticia (idNoticia);
CREATE INDEX noticiacategoria ON NoticiaCategoria (nome);
CREATE INDEX comentario ON Comentario (idNoticia);
CREATE INDEX linknoticia ON LinkNoticia (idNoticia);
CREATE INDEX user ON Editor ((lower(username)));
CREATE INDEX categoria ON Categoria (nome);
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