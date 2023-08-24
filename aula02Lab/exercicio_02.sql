DROP DATABASE aula02_pt2;
CREATE DATABASE IF NOT EXISTS aula02_pt2;


use aula02_pt2;

CREATE TABLE cliente(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	cpf varchar(15) ,
    nome varchar(30),
    idade int,
    telefone varchar(30),
    cidade varchar(30),
    total_compras float);
    
INSERT INTO cliente (cpf,nome,idade,telefone,cidade,total_compras) VALUES ("999.999.999.15",
"matheus","18","(35)99999-9999","santa rita","1900");

INSERT INTO cliente (cpf,nome,idade,telefone,cidade,total_compras) VALUES ("999.999.999.14",
"igor","19","(35)99999-8764","pouso alegre","1900");

INSERT INTO cliente (cpf,nome,idade,telefone,cidade,total_compras) VALUES ("999.999.999.13",
"jonas","23","(35)99879-9999","santa rita","1900");

SELECT * FROM cliente;


    