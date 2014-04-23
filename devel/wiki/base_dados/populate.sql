/* username, nome, localidade, pass, email, profissão, foto, tipo, estado */
INSERT INTO Editor VALUES('filetez','Joao Filetes','Ali acola','987654321','welele@fe.up.pt','superhyperdeveloper','asasasa','moderador','normal');
INSERT INTO Editor VALUES('rabandaz','Wiwson Rabanadas','Ali alem','987654321','welelf@fe.up.pt','superhyperdeveloper','asasasa','moderador','normal');    
INSERT INTO Editor VALUES('tiburoenz','Luis Tubarao','Porto','987654321','welela@fe.up.pt','superhyperdeveloper','asasasa','moderador','normal');  
INSERT INTO Editor VALUES('franganitoz','Fabio Franganito','Lisboa','987654321','welile@fe.up.pt','superhyperdeveloper','asasasa','moderador','normal');  
INSERT INTO Editor VALUES('geof222','Geoffrey Smith','Issy-les-Moulineaux','IGZ62ZKX9KL','ut.mi.Duis@tempor.ca','jornalista','asasasa','editor','normal');
INSERT INTO Editor VALUES('superDavis','Simon Davis','Grand-Hottomont','SAI17IAQ2YU','eget@Suspendissealiquet.org','fotografo','asasasa','editor','normal');
INSERT INTO Editor VALUES('willimwallace87','William Wallace','Termini Imerese','ZGN89CEI2RF','per@non.edu','policia','asasasa','editor','normal');
INSERT INTO Editor VALUES('iamaspy','Jonh Reese','LA','DEQ45BAO8MJ','nonummy@arcuacorci.com','spy',NULL,'editor','bantemp');
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
INSERT INTO Noticia VALUES(DEFAULT,'Barcelona continua a fazer falcatruas'
	,'Ha muita gente que não digere a hegemonia do Barcelona','2013-04-02','wolowizard');

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
INSERT INTO Categoria VALUES('meteorologia');
INSERT INTO Categoria VALUES('desportos motorizados');

INSERT INTO NoticiaCategoria VALUES(1,'desporto');
INSERT INTO NoticiaCategoria VALUES(1,'futebol');
INSERT INTO NoticiaCategoria VALUES(3,'cinema');
INSERT INTO NoticiaCategoria VALUES(4,'literatura');
INSERT INTO NoticiaCategoria VALUES(3,'desporto');
INSERT INTO NoticiaCategoria VALUES(6,'cultura');
INSERT INTO NoticiaCategoria VALUES(5,'desporto');
INSERT INTO NoticiaCategoria VALUES(4,'futebol');

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
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'geof222',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',1,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',2,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'wolowizard',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'iamaspy',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'geof222',2,-1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tomscousin',6,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'willimwallace87',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'geof222',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'rabandaz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'tiburoenz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'franganitoz',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'filetez',5,1);
INSERT INTO AvaliarNoticia VALUES(DEFAULT,'iamaspy',5,1);

/*Editor,Noticia*/
INSERT INTO Comentario VALUES(DEFAULT,'Esta noticia esta claramente incrivel','filetez',1);
INSERT INTO Comentario VALUES(DEFAULT,'QUe trigger espetacular','filetez',2);
INSERT INTO Comentario VALUES(DEFAULT,'Opa, isto nao me parece legit','tiburoenz',1);
INSERT INTO Comentario VALUES(DEFAULT,'Extremamente fantastico','rabandaz',3);
INSERT INTO Comentario VALUES(DEFAULT,'Que falta de noção','filetez',4);
INSERT INTO Comentario VALUES(DEFAULT,'Ganda jogo oh maninho!','filetez',5);
INSERT INTO Comentario VALUES(DEFAULT,'Sao meus colegas!','rabandaz',6);
INSERT INTO Comentario VALUES(DEFAULT,'O projeto deles foi mesmo interessante, espero que esteja disponivel de borla','filetez',6);
INSERT INTO Comentario VALUES(DEFAULT,'Boa noticia','filetez',2);
INSERT INTO Comentario VALUES(DEFAULT,'Apoio.','franganitoz',6);
INSERT INTO Comentario VALUES(DEFAULT,'So choram','franganitoz',2);
INSERT INTO Comentario VALUES(DEFAULT,'Parabens','HardenOP',6);
INSERT INTO Comentario VALUES(DEFAULT,'So para vender jornais','geof222',2);

/* Editor,Comentario, Avaliacao*/
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',1,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'filetez',2,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'rabandaz',3,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'tiburoenz',1,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'franganitoz',3,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'tiburoenz',3,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'rabandaz',2,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'HardenOP',5,-1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'geof222',2,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'wolowizard',1,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'willimwallace87',8,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'willimwallace87',10,1);
INSERT INTO AvaliarComentario VALUES(DEFAULT,'franganitoz',8,1);

INSERT INTO Mensagem VALUES(DEFAULT,'filetez','rabandaz','sem titulo','Amanha bora la?');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','tiburoenz','sem titulo','acho que nao');
INSERT INTO Mensagem VALUES(DEFAULT,'filetez','franganitoz','sem titulo','nao me parece');
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
INSERT INTO Amizade VALUES('geof222','HardenOP');
INSERT INTO Amizade VALUES('iamaspy','willimwallace87');
INSERT INTO Amizade VALUES('HardenOP','iamaspy');
INSERT INTO Amizade VALUES('iamaspy','wolowizard');



INSERT INTO Link VALUES('http://dioguinho.pt/francisco-macau-jamais-terei-algo-com-diana-ss4/','dioguinho.pt');
INSERT INTO Link VALUES('http://www.engadget.com/2014/04/02/windows-phone-8-1-official/','engadget.com');
INSERT INTO Link VALUES('http://www.jn.pt/PaginaInicial/Sociedade/Media/Interior.aspx?content_id=3792849','jn.pt');
INSERT INTO Link VALUES('http://pplware.sapo.pt/informacao/deputados-europeus-aprovam-fim-de-roaming-para-web/','pplware.sapo.pt');
INSERT INTO Link VALUES('http://abola.pt/nnh/ver.aspx?id=469627','abola.pt');
INSERT INTO Link VALUES('http://www.publico.pt/sociedade/noticia/crato-insiste-na-prova-dos-docentes-e-no-devido-tempo-dara-instrucoes-praticas-1630844','publico.pt');

/* Noticia, Link*/
INSERT INTO LinkNoticia VALUES(1,'http://www.engadget.com/2014/04/02/windows-phone-8-1-official/');
INSERT INTO LinkNoticia VALUES(2,'http://pplware.sapo.pt/informacao/deputados-europeus-aprovam-fim-de-roaming-para-web/');
INSERT INTO LinkNoticia VALUES(4,'http://www.publico.pt/sociedade/noticia/crato-insiste-na-prova-dos-docentes-e-no-devido-tempo-dara-instrucoes-praticas-1630844');
INSERT INTO LinkNoticia VALUES(4,'http://www.jn.pt/PaginaInicial/Sociedade/Media/Interior.aspx?content_id=3792849');

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
INSERT INTO Interesse VALUES('geof222','cinema');
INSERT INTO Interesse VALUES('geof222','cultura');
INSERT INTO Interesse VALUES('willimwallace87','desporto');
INSERT INTO Interesse VALUES('iamaspy','atualidade');
INSERT INTO Interesse VALUES('iamaspy','video-jogos');
INSERT INTO Interesse VALUES('willimwallace87','video-jogos');
INSERT INTO Interesse VALUES('franganitoz','video-jogos');
INSERT INTO Interesse VALUES('wolowizard','atualidade');
INSERT INTO Interesse VALUES('wolowizard','video-jogos');