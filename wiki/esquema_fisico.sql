/*drop de todas as tabelas*/
drop table if exists Noticia;
drop table if exists Comentario;
drop table if exists Link;
drop table if exists LinkNoticia;
drop table if exists NoticiaCategoria;
drop table if exists Categoria;

/* Notícias */
create table if not exists Noticia(
	idNoticia integer primary key not null,
	conteudo varchar(140) not null, 
	titulo varchar not null, 
	data default current_date, 
	idEditor integer references Editor(id)
	);

/* Comentários */
create table if not exists Comentario(
	idComentario integer primary key not null,
	conteudo varchar(140) not null,
	idEditor integer references Editor(id), 
	idNoticia integer references Noticia(id)
	);

/* Links */
create table if not exists Link(
	idLink integer primary key not null,
	HomeLink varchar not null,
	href varchar primary key not null
	);

/* Links para Noticias */
create table if not exists LinkNoticia(
	idNoticia integer references Noticia(id),
	idLink integer references Link(id),
	);

/* Categorias de Noticias */
create table if not exists NoticiaCategoria(
	idNoticia integer references Noticia(id),
	idCategoria integer references Categoria(id),
	);

/* Categorias */
create table if exists Categoria(
	idCategoria integer primary key not null,
	Nome varchar primary key not null,
	);

/*  */