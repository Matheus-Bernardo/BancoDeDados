#Matheus henrique Lourenço bernardo - matricula 75

#questao 1- resposta letraA
create database if not exists prova;
use prova;

create table if not exists aluno(
 matricula int not null primary key,
 nome varchar(50),
 idade int,
 periodo varchar(50),
 curso varchar(50)
 );
 
 #questao 2-
 #letra A)
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (901234,'Larissa',21,"GEB","3°");
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (789012,'Rodrigo',22,"GEA","4°");
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (567890,'Beatriz',20,"GET","2°");
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (234567,'Gabriel',19,"GEC","1°");
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (345678,'Amanda',23,"GES","5°");
INSERT INTO aluno(matricula,nome,idade,periodo,curso) VALUES (123456,'Matheus',24,"GEB","6°");

set SQL_SAFE_UPDATES = 0;

#letra b
UPDATE aluno SET idade = 23 WHERE nome = 'Larissa';

#letra c
SELECT * FROM aluno WHERE curso = 'GEB';

#letra d
DELETE FROM aluno WHERE matricula = 345678;

#letra e
SELECT nome FROM aluno WHERE curso = 'GET';

#Letra f
SELECT max(idade), nome from aluno;

#letra g
SELECT * FROM aluno LIMIT 3;

#letra h
SELECT * FROM aluno WHERE nome like 'G______%';

#letra i)
SELECT count(*) FROM aluno WHERE periodo = '4°';


