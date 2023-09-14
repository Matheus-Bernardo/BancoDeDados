 use aula02;
 
 create table if not exists Cliente(
  cpf varchar(11) primary key,
  nome varchar(50),
  idade int,
  telefone varchar(50),
  cidade varchar(50),
  TotalCompra float
  );

#INSERT
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('12379843256','João Lucas',24,'9845-6952','Pouso Alegre',145);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('95487361584','Joana',45,'9972-3348','Itajubá',130.25);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('65482751499','Pedro',33,'9822-5316','Itajubá',78.9);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('57778462358','Beatriz',17,'9735-4442','Extrema',113);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('26326578459','Mariana',28,'8437-6659','Barbacena',42.5);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('76125894362','Jonathan',38,'9233-7453','Pouso Alegre',85.4);
INSERT INTO Cliente(cpf,nome,idade,telefone,cidade,TotalCompra) VALUES ('46582739321','Ana Maria',57,'9118-4742','Varginha',92);
  
#SELECT DE TODOS OS REGISTROS
Select * from Cliente;
  
#SELECT COM FILTRO
SELECT nome,idade,cidade FROM Cliente WHERE cidade = 'Itajubá';
  
#SELECT COM OPERADORES LÓGICOS
SELECT nome,cidade,totalCompra FROM Cliente WHERE totalCompra >= 100 AND NOT cidade = 'Itajubá';
  
#SELECT COM FUNÇÕES PRONTAS
SELECT max(totalCompra), nome from Cliente;
  
#SELECT COM FILTRO DE TEXTO
SELECT * FROM Cliente WHERE nome like 'Jo____%';
  
#SELECT COM LIMITE DE LINHAS
SELECT nome,telefone from Cliente limit 3;
  
#SELECT SEM REPETIÇÕES
SELECT DISTINCT cidade FROM Cliente;