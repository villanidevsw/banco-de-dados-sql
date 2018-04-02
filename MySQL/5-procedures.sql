/*STORED PROCEDURES - PROCEDURES*/
/*
1-SEMPRE QUE FOR FAZER PROCEDURES TROCAR O LIMITADOR DO BANCO
ESCOLHER QUALQUER UM (MAIS COMUNS: $,$$,#,##)
POIS ASSIM DENTRO DA PROCEDURE O BANCO CONTINUARÁ A EXECUTAR
A PROGRAMACAO
*/

/*PROCEDURE SEM PARAMETRO*/
/*A PARTIR DAQUI DEVE-SE VOLTAR O DELIMITADOR QUALQUER CARACTER*/
DELIMITER $

/*2- ESTRUTURA BASICA*/
CREATE PROCEDURE NOME()
BEGIN
	ACOES;
END
$

/*3 - CRIANDO A PROCEDURE*/
CREATE PROCEDURE CONTASIMPLES()
BEGIN
	SELECT 10 + 10 AS "RESULTADO";
END
$

/*4- CHAMAR UMA PROCEDURE*/
/*A PARTIR DAQUI DEVE-SE VOLTAR O DELIMITADOR PARA O PADRAO ;*/
DELIMITER ;
CALL CONTASIMPLES();

/*5- APAGAR UMA PROCEDURE*/
DROP PROCEDURE CONTASIMPLES;

/*PROCEDURE COM PARAMETRO*/
DELIMITER $

/*2- ESTRUTURA BASICA*/
CREATE PROCEDURE NOME(PARAM1 INT, PARAM2 VARCHAR)
BEGIN
	ACOES;
END
$

/*3 - CRIANDO A PROCEDURE*/
CREATE PROCEDURE CONTA(N1 INT, N2 INT)
BEGIN
	SELECT N1 + N2 AS "RESULTADO";
END
$

/*4- CHAMAR UMA PROCEDURE*/
/*A PARTIR DAQUI PODE-SE VOLTAR O DELIMITADOR PARA O PADRAO ;*/
DELIMITER ;
CALL CONTA(125,50);

/*5- APAGAR UMA PROCEDURE*/
DROP PROCEDURE CONTA;


/*PROCEDURES COM TABELAS*/
/*CRIA UMA NOVA TABELA PARA O EXEMPLO*/
CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30) NOT NULL,
	HORAS INT (3) NOT NULL,
	VALOR FLOAT (10,2) NOT NULL
);

INSERT INTO CURSOS VALUES (NULL,'BANCO DE DADOS FUNDAMENTAL',40,155.50);
/*INICIA A CRIACAO DE UMA PROCEDURE PARA INSERCAO DE DADOS*/
DELIMITER #

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),P_HORAS INT(3),P_PRECO FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS VALUES (NULL,P_NOME,P_HORAS,P_PRECO);
END
#

DELIMITER ;
CALL CAD_CURSO('LOGICA PROGRAMACAO',125,150.00);

/*CRIA UMA PROCEDURE DE LEITURA*/
DELIMITER #

CREATE PROCEDURE LISTAR_CURSOS()
BEGIN
	SELECT 	IDCURSO, 
			NOME AS "CURSO",
			HORAS AS "CARGA HORARIA",
			VALOR 
	FROM CURSOS;
END
#

DELIMITER ;
CALL LISTAR_CURSOS();