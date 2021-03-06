/*VIEWS - VISOES*/
/*DADA ESTA QUERY, IREMOS CRIAR UMA VIEW
COMO ESTA QUERY PRECISA SER UTILIZADA VARIAS VEZES, CRIAREMOS UMA VIEW

*/
SELECT C.NOME,
		C.SEXO,IFNULL(C.EMAIL,'SEM EMAIL') AS EMAIL,
		E.BAIRRO,
		E.CIDADE,
		T.TIPO,
		T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

/*CRIANDO A VIEW*/
CREATE VIEW V_RELATORIO_PADRAO AS
SELECT C.NOME,
		C.SEXO,IFNULL(C.EMAIL,'SEM EMAIL') AS EMAIL,
		E.BAIRRO,
		E.CIDADE,
		T.TIPO,
		T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

/*PARA USA-LA BASTA SELECIONA-LA PELO NOME*/
SELECT * FROM RELATORIO_PADRAO;
SELECT * FROM RELATORIO_PADRAO WHERE SEXO = 'M';
/*OBS:NÃO É POSSÍVEL INSERIR/APAGAR REGISTROS EM UMA VIEW QUE POSSUI JOINS*/

/*APAGANDO UMA VIEW*/
SHOW TABLES;
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| v_relatorio_padrao |
| telefone           |
+--------------------+

DROP VIEW V_RELATORIO_PADRAO;

