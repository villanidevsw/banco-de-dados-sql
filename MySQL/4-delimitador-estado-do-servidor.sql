/*DELIMITADOR / STATUS*/
STATUS /*EXIBE INFORMACOES DO SERVIDOR*/
mysql> STATUS
--------------
C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.16,
 for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ; /*DELIMITADOR EM USO*/
Server version:         5.7.16-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 5 hours 48 min 28 sec

Threads: 1  Questions: 84  Slow queries: 0  Opens: 115  Flush tables: 1  Open ta
bles: 108  Queries per second avg: 0.004

/*TROCAR DELIMITADOR (FINAL DE LINHA-PADRAO É ";")*/
DELIMITER $

mysql> DELIMITER $
mysql> SELECT * FROM CLIENTE$
+-----------+----------+------+--------------------+-------------+
| IDCLIENTE | NOME     | SEXO | EMAIL              | CPF         |
+-----------+----------+------+--------------------+-------------+
|         1 | JOAO     | M    | JOAO@GMAIL.COM     | 22426071702 |
|         2 | JOSE     | M    | NULL               | 12240928212 |
|         3 | MARIO    | F    | MARIO@GMAIL.COM    | 80474078485 |
|         4 | MARIA    | F    | MARIA@GMAIL.COM    | 17937101202 |
|         5 | JOSEFINA | F    | JOSEFINA@GMAIL.COM | 47721441293 |
|         6 | ANGELA   | M    | ANGELA@GMAIL.COM   | 25681521419 |
+-----------+----------+------+--------------------+-------------+
6 rows in set (0.00 sec)

mysql> STATUS
--------------
C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.16,
 for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        $ /*DELIMITADOR EM USO*/
Server version:         5.7.16-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 5 hours 52 min 5 sec

Threads: 1  Questions: 88  Slow queries: 0  Opens: 115  Flush tables: 1  Open ta
bles: 108  Queries per second avg: 0.004
--------------