/*MODELO LOGICO - EXERCICIO OFICINA*/

CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30) NOT NULL,
	SEXO ENUM ('M','F'),
	ID_CARRO INT UNIQUE /*NESTA MODELAGEM 1 CLIENTE POSSUI APENAS 1 CARRO*/
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM ('CEL','RES','COM') NOT NULL,
	NUMERO VARCHAR (30) NOT NULL,
	ID_CLIENTE INT
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR (30) UNIQUE /*A MARCA É ÚNICA (NÃO SE REPETIR)*/	
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	PLACA VARCHAR (30) NOT NULL UNIQUE,
	ID_MARCA INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) UNIQUE /*PARA A COR NAO SE REPETIR*/
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_CARRO) /*CHAVE COMPOSTA - O CONJUNTO NAO SE REPETE*/
);

/*CONSTRAINTS*/

ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY (ID_CARRO) REFERENCES CARRO (IDCARRO);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE);

ALTER TABLE CARRO ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY (ID_MARCA) REFERENCES MARCA (IDMARCA);
/*TABELA ASSOCIATIVA*/
ALTER TABLE CARRO_COR ADD CONSTRAINT FK_CARRO_COR_COR
FOREIGN KEY(ID_COR) REFERENCES COR (IDCOR);

ALTER TABLE CARRO_COR ADD CONSTRAINT FK_CARRO_COR_CARRO
FOREIGN KEY (ID_CARRO) REFERENCES CARRO (IDCARRO);


/*POPULAR ...*/