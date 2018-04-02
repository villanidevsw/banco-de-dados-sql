/*TRIGGERS - COMANDOS QUE DISPARAM ANTES OU DEPOIS 
(BEFORE/AFTER)
DE CADA ACAO EM UMA TABELA (INSERT/UPDATE/DELETE)

NAO SE PODE COLOCAR 2 TRIGGERS NA MESMA TABELA, DISPARANDO 
NO MESMO MOMENTO.
EX: NAO SE PODE COLOCAR 2 TRIGGERS "OLHANDO" ANTES(BEFORE)
DE  UM DELETE NA MESMA TABELA.
MAS TODAS AS ACOES PODEM SER EXECUTADAS EM UMA MESMA TABELA 
(DESDE QUE NAO SEJA NO MESMO MOMENTO)

***NEW E OLD***

1- INSERT POSSUI UM MOMENTO ANTES E UM DEPOIS
ANTES DE FAZER O INSERT O NOVO REGISTRO É CONSIDERADO
NEW, ENTAO QUALQUER REFERENCIA DEVE-SE USAR ESTE PREFIXO.

2- UPDATE POSSUI UM MOMENTO ANTES E UM DEPOIS
ANTES DE FAZER O UPDATE O NOVO REGISTRO É CONSIDERADO
NEW, E O REGISTRO QUE FOI SUBSTITUÍDO É CONSIDERADO OLD
ENTAO QUALQUER PARA QUALQUER REFERENCIA DEVE-SE REFERENCIAR
QUAL ESTADO QUEREMOS USAR 

3 - DELETE POSSUI UM MOMENTO ANTES E UM DEPOIS
ANTES DE FAZER O DELETE O REGISTRO É CONSIDERADO
OLD, ENTAO QUALQUER REFERENCIA DEVE-SE USAR ESTE PREFIXO

*/




/*A PARTIR DAQUI DEVE-SE ALTERAR O DELIMITADOR PARA QUALQUER CARACTER*/
DELIMITER $

/*ESTRUTURA DE UMA TRIGGER*/
CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW 
BEGIN 
		AÇOES;
END  
$

/*A PARTIR DAQUI DEVE-SE VOLTAR O DELIMITADOR PARA O PADRAO ;*/
DELIMITER ;

/*APAGAR UMA TRIGGER*/
DROP TRIGGER NOME;

/*ONDE FICAM AS TRIGGERS?*/
USE INFORMATION_SCHEMA;
DESC TRIGGERS;
/*+----------------------------+---------------+------+-----+---------+-------+
| Field                      | Type          | Null | Key | Default | Extra |
+----------------------------+---------------+------+-----+---------+-------+
| TRIGGER_CATALOG            | varchar(512)  | NO   |     |         |       |
| TRIGGER_SCHEMA             | varchar(64)   | NO   |     |         |       |
| TRIGGER_NAME               | varchar(64)   | NO   |     |         |       |
| EVENT_MANIPULATION         | varchar(6)    | NO   |     |         |       |
| EVENT_OBJECT_CATALOG       | varchar(512)  | NO   |     |         |       |
| EVENT_OBJECT_SCHEMA        | varchar(64)   | NO   |     |         |       |
| EVENT_OBJECT_TABLE         | varchar(64)   | NO   |     |         |       |
| ACTION_ORDER               | bigint(4)     | NO   |     | 0       |       |
| ACTION_CONDITION           | longtext      | YES  |     | NULL    |       |
| ACTION_STATEMENT           | longtext      | NO   |     | NULL    |       |
| ACTION_ORIENTATION         | varchar(9)    | NO   |     |         |       |
| ACTION_TIMING              | varchar(6)    | NO   |     |         |       |
| ACTION_REFERENCE_OLD_TABLE | varchar(64)   | YES  |     | NULL    |       |
| ACTION_REFERENCE_NEW_TABLE | varchar(64)   | YES  |     | NULL    |       |
| ACTION_REFERENCE_OLD_ROW   | varchar(3)    | NO   |     |         |       |
| ACTION_REFERENCE_NEW_ROW   | varchar(3)    | NO   |     |         |       |
| CREATED                    | datetime(2)   | YES  |     | NULL    |       |
| SQL_MODE                   | varchar(8192) | NO   |     |         |       |
| DEFINER                    | varchar(93)   | NO   |     |         |       |
| CHARACTER_SET_CLIENT       | varchar(32)   | NO   |     |         |       |
| COLLATION_CONNECTION       | varchar(32)   | NO   |     |         |       |
| DATABASE_COLLATION         | varchar(32)   | NO   |     |         |       |
+----------------------------+---------------+------+-----+---------+-------+*/

/*TESTANDO AS TRIGGERS*/
CREATE DATABASE TESTE_TRIGGERS;
USE TESTE_TRIGGERS;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR (30),
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN(30)
);

/*CRIANDO*/

/*1 - MUDA O DELIMITADOR*/
DELIMITER $

/*2 - CRIA-SE A TRIGGER*/
CREATE TRIGGER FAZER_BACKUP_USUARIO
BEFORE DELETE ON USUARIO
FOR EACH ROW 
BEGIN  
		INSERT INTO BKP_USUARIO VALUES
		(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);
END 
$

/*3 - VOLTA-SE O DELIMITADOR PARA O PADRAO*/
DELIMITER ;

/*TESTE*/
INSERT INTO USUARIO VALUES (NULL, 'JOSE','JOSE.PORTUGA');

SELECT * FROM USUARIO;
SELECT * FROM BKP_USUARIO;

DELETE FROM USUARIO WHERE LOGIN = 'JOSE.PORTUGA';

SELECT * FROM USUARIO;
SELECT * FROM BKP_USUARIO;

