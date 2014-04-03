/*Index*/
CREATE INDEX noticia ON Noticia (idNoticia);
CREATE INDEX noticiacategoria ON NoticiaCategoria (nome);
CREATE INDEX comentario ON Comentario (idNoticia);
CREATE INDEX linknoticia ON LinkNoticia (idNoticia);
CREATE INDEX user ON Editor ((lower(username)));
CREATE INDEX categoria ON Categoria (nome);
CREATE INDEX avalnoticia ON AvaliarNoticia (idNoticia);
CREATE INDEX avalcomentario ON AvaliarComentario (idComentario);

/* username, nome, localidade, pass, email, profissão, foto, tipo, estado */
INSERT INTO Editor VALUES('filetez','Joao Filetes','Ali acola','987654321','welele@fe.up.pt','autista','asasasa','moderador','normal');
INSERT INTO Editor VALUES('rabandaz','Wiwson Rabanadas','Ali alem','987654321','welelf@fe.up.pt','autista','asasasa','moderador','normal');    
INSERT INTO Editor VALUES('tiburoenz','Luis Tubarao','Ali no caralho','987654321','welela@fe.up.pt','autista','asasasa','moderador','normal');  
INSERT INTO Editor VALUES('franganitoz','Fabio Franganito','Ali no caralhao te foda','987654321','welile@fe.up.pt','autista','asasasa','moderador','normal');  
INSERT INTO Editor VALUES('geof22','Geoffrey Smith','Issy-les-Moulineaux','IGZ62ZKX9KL','ut.mi.Duis@tempor.ca','jornalista','asasasa','editor','normal');
INSERT INTO Editor VALUES('superDavis','Simon Davis','Grand-Rosiï¿½re-Hottomont','SAI17IAQ2YU','eget@Suspendissealiquet.org','fotografo','asasasa','editor','normal');
INSERT INTO Editor VALUES('willimwallace87','William Wallace','Termini Imerese','ZGN89CEI2RF','per@non.edu','policia','asasasa','editor','normal');
INSERT INTO Editor VALUES('iamaspy','Jonh Reese','LA','DEQ45BAO8MJ','nonummy@arcuacorci.com','spy',NULL,'editor'.'bantemp');
INSERT INTO Editor VALUES('tomscousin','Zane Cruise','Fort Saskatchewan','GQC66SBZ5QP','odio.Phasellus@magnaatortor.net','actor','afelis','editor','normal');
INSERT INTO Editor VALUES('DiCaprio','Leonardo di Caprio','Lens-Saint-Remy','ELT31TCU0DE','dui.augue@afelis.edu','actor','DiCapriophoto','editor','normal');
INSERT INTO Editor VALUES('donovan_95','Raymond Donova','California','JOR64XHP8RU','ipsum.Phasellus@Namac.ca','art student',NULL, 'editor', 'normal');
INSERT INTO Editor VALUES('JG_1968','Jorge Gabriel','Hull','LYA56WRS6GB','jorgeGabriel@rtp.pt','Apresentador',NULL, 'editor','bantemp');
INSERT INTO Editor VALUES('wolowizard','Erich Howard','Mumbai','UIB06QIM5KS','nulla@acfermentumvel.co.uk','student',NULL, 'editor', 'bantemp');
INSERT INTO Editor VALUES('HardenOP','James Harden','Houston','QLO99FBN3YB','consectetuer@gravidamaurisut.edu','NBA Player','jameshardenpic','editor','normal'); 

INSERT INTO Noticia VALUES(DEFAULT,'Pinto da Costa foi visto a sair de um quarto de hotel, no porto, com uma jovem loira atualmente desconhcida para 
	a comunicacao social.','Pinto da Costa em mais um caso extraconjugal','2000-12-16','filetez');
INSERT INTO Noticia VALUES(DEFAULT,'A meio de uma conferencia que antecipou o jogo do benfica, Jorge Jesus emitiu sons semelhantes ao 
	ladrar de um cao.','Jorge Jesus volta a ladrar','2000-12-16','rabandaz');
INSERT INTO Noticia VALUES(DEFAULT,'O atual treinador do benfica teve de ser assistido pelos paramedicos apos ter-se engasgado com agua.
	','Jorge Jesus engasga-se a falar','2000-12-16','tiburoenz');
INSERT INTO Noticia VALUES(DEFAULT,'Para vencer a crise, e apos uns meses de uma optima gestao por parte de Bruno de Carvalho, o Sporting decidiu 
	propor um contrato a Bruno de Carvalho com uma clausula de 150 milhoes de euros.','Bruno de Carvalho tem clausula de rescisao de 150 milhoes de euros','2000-12-16','franganitoz');
INSERT INTO Noticia VALUES(DEFAULT,'Apos 4 periodos muito renhidos, os Toronto Raptors conseguiram hoje uma vitoria crucial na sua caminhada rumo aos play-offs da NBA.'
	,'Houton Rockets vencidos por Toronto Raptors','2013-04-02','HardenOP');
INSERT INTO Noticia VALUES(DEFAULT,'Concurso Universitario de escala global volta a ter como vencedores um grupo de estudantes da Faculdade de Engenharia da Universidade do Porto. 
	Pela primeira vez na historia do concurso, a instituicao vencedora ja havia arrecadado o mesmo premio ha dois anos atras.'
	,'Made in FEUP','2013-02-02','rabandaz');
INSERT INTO Noticia VALUES(DEFAULT,'Javier Faus, vice-presidente do Barcelona, não tem dúvidas de que a proibição imposta pela FIFA ao clube catalão de contratar jogadores até ao verão 
	de 2015 resulta de uma campanha concertada que tem como objetivo denegrir a imagem do emblema "blaugrana".
	«Nada do que está a acontecer é casual ou fortuito. Há cinco anos que o Barça é vítima de uma série de acusações como o caso de doping ou as agressões a Guardiola e Tito [Vilanova].
	Agora é Messi e Neymar... Nada é inocente. Tentam apagar a imagem do Barça, mas não vão conseguir. Como instituição dissemos “Basta”», afirmou o dirigente, em declarações à Rádio 4.
	«Estamos a investigar quem está por detrás de tudo isto e quando o pudermos demonstrar, fá-lo-emos. Há muita gente que não digere a hegemonia do Barcelona nos últimos dez anos. 
	Não vamos ficar de braços cruzados e a resposta será contundente», prometeu.
	Para Javier Faus, «a regulamentação da FIFA é boa para a Ásia e para a América Latina, onde os fundos de investimento transferem 100 miúdos, ficam com um e abandonam os restantes».
	«No Barcelona formamos pessoas antes de futebolistas», realçou.'
	,'Há muita gente que não digere a hegemonia do Barcelona','2013-04-02','wolowizard');


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
INSERT INTO Categoria VALUES('cultura');
INSERT INTO Categoria VALUES('metereologia');
INSERT INTO Categoria VALUES('desportos motorizados');

INSERT INTO NoticiaCategoria VALUES(1,'desporto');
INSERT INTO NoticiaCategoria VALUES(2,'futebol');
INSERT INTO NoticiaCategoria VALUES(3,'cinema');
INSERT INTO NoticiaCategoria VALUES(4,'literatura');
INSERT INTO NoticiaCategoria VALUES(5,'desporto');
INSERT INTO NoticiaCategoria VALUES(6,'cultura');
INSERT INTO NoticiaCategoria VALUES(7,'desporto');
INSERT INTO NoticiaCategoria VALUES(7,'futebol');

INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',1,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'rabandaz',3,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',1,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'HardenOP',2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',5,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',5,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',5,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'rabandaz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'jorgeGabriel',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',1,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',7,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'wolowizard',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',7,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'iamaspy',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',7,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'jorgeGabriel',7,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'jorgeGabriel',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'rabandaz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'iamaspy',5,1);


/*Editor,Noticia*/
INSERT INTO Comentario VALUES(DEFAULT,'GANDA GAJA OH BELHOTE','filetez',1);
INSERT INTO Comentario VALUES(DEFAULT,'TCH NUNCA PENSEI','filetez',2);
INSERT INTO Comentario VALUES(DEFAULT,'POAH','tiburoenz',1);
INSERT INTO Comentario VALUES(DEFAULT,'WELELELELELE','rabandaz',3);
INSERT INTO Comentario VALUES(DEFAULT,'VOU TE MALABAAAAAAAAAAR','filetez',4);
INSERT INTO Comentario VALUES(DEFAULT,'Ganda jogo oh maninho!','filetez',5);
INSERT INTO Comentario VALUES(DEFAULT,'Sao meus colegas!','rabandaz',6);
INSERT INTO Comentario VALUES(DEFAULT,'O projeto deles foi mesmo interessante, espero que esteja disponivel de borla','filetez',6);
INSERT INTO Comentario VALUES(DEFAULT,'E SO AZIA OH BELHOTE','filetez',7);
INSERT INTO Comentario VALUES(DEFAULT,'SOMOS OS MAIORES','franganitoz',6);
INSERT INTO Comentario VALUES(DEFAULT,'So choram','franganitoz',7);
INSERT INTO Comentario VALUES(DEFAULT,'Parabens','HardenOP',6);
INSERT INTO Comentario VALUES(DEFAULT,'So para vender jornais','jorgeGabriel',7);

/* Editor,Comentario, Avaliacao*/
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',1,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',2,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'rabandaz',3,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'tiburoenz',1,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'franganitoz',3,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'tiburoenz',3,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'rabandaz',2,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'HardenOP',5,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'jorgeGabriel',2,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'wolowizard',1,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'willimwallace87',8,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'willimwallace87',10,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'franganitoz',8,1);

INSERT INTO Mensagem VALUES(DEFAULT,'filetez','rabandaz','sem titulo','ganda cena oh belhooooote');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','tiburoenz','sem titulo','ganda cena oh filhoooooteeeee');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','franganitoz','sem titulo','ganda cena oh velhoooooteeeee');
INSERT INTO Mensagem VALUES(DEFAULT,'rabandaz','willimwallace87','sem titulo','olha, cenas aconteceram');
INSERT INTO Mensagem VALUES(DEFAULT,'tiburoenz','filetez','sem titulo','olha, hoje nao vai pintar');
INSERT INTO Mensagem VALUES(DEFAULT,'tiburoenz','filetez','sem titulo','amanha vais estar em casa? Podiamos adiar');
INSERT INTO Mensagem VALUES(DEFAULT,'rabandaz','franganitoz','boleia','Vais para a paragem de carro? Das-me boleia?');
INSERT INTO Mensagem VALUES(DEFAULT,'willimwallace87','HardenOP','Futebolada','Falta-nos uma pessoa para o futebolada de logo, podes vir?');


INSERT INTO Amizade VALUES('filetez','rabandaz');
INSERT INTO Amizade VALUES('filetez','tiburoenz');
INSERT INTO Amizade VALUES('filetez','franganitoz');
INSERT INTO Amizade VALUES('rabandaz','tiburoenz');
INSERT INTO Amizade VALUES('franganitoz','rabandaz');
INSERT INTO Amizade VALUES('franganitoz','tiburoenz');
INSERT INTO Amizade VALUES('willimwallace87','wolowizard');
INSERT INTO Amizade VALUES('HardenOP','willimwallace87');
INSERT INTO Amizade VALUES('HardenOP','jorgeGabriel');
INSERT INTO Amizade VALUES('iamaspy','willimwallace87');
INSERT INTO Amizade VALUES('iamaspy','HardenOP');
INSERT INTO Amizade VALUES('iamaspy','wolowizard');



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
INSERT INTO Interesse VALUES('tiburoenz','cultura');
INSERT INTO Interesse VALUES('franganitoz','desporto');
INSERT INTO Interesse VALUES('franganitoz','futebol');
INSERT INTO Interesse VALUES('tiburoenz','desporto');
INSERT INTO Interesse VALUES('rabandaz','literatura');
INSERT INTO Interesse VALUES('rabandaz','desportos motorizados');
INSERT INTO Interesse VALUES('willimwallace87','literatura');
INSERT INTO Interesse VALUES('jorgeGabriel','cinema');
INSERT INTO Interesse VALUES('jorgeGabriel','cultura');
INSERT INTO Interesse VALUES('willimwallace87','desporto');
INSERT INTO Interesse VALUES('iamaspy','atualidade');
INSERT INTO Interesse VALUES('iamaspy','video-jogos');
INSERT INTO Interesse VALUES('willimwallace87','video-jogos');
INSERT INTO Interesse VALUES('franganitoz','video-jogos');
INSERT INTO Interesse VALUES('wolowizard','atualidade');
INSERT INTO Interesse VALUES('wolowizard','video-jogos');

