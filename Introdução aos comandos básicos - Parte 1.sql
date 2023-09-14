create database if not exists aula2;

use aula2;

create table if not exists usuario(
 id int not null auto_increment primary key,
 nome varchar(50),
 ano_nasc int,
 pais varchar(50)
 );

#INSERT 
INSERT INTO usuario(nome,ano_nasc,pais) VALUES ('Fulano',2001,'Brasil');
INSERT INTO usuario() VALUES(default,'Cicrano',1999,'Austrália');
INSERT INTO usuario(nome,ano_nasc,pais) VALUES ('Beltrano',1978,'Itália');
  
#UPDATE
UPDATE usuario SET nome = 'Usuario X' WHERE id = 2;
UPDATE usuario SET ano_nasc = 2002, pais = 'Argentina' WHERE id = 1;
  
#DELETE
DELETE FROM usuario WHERE id = 3;
DELETE FROM usuario WHERE id = 1;


  
 
  