/* 
    *slow_query_log ==> gerer le temps d'attente d'une requete pour savoir si les requetes sont lentes ou pas;
    *log_bin ==> gerer la journalisation. s'il est a off ie que le fichier de journalisation n'est pas active;
    *log_error ==>
    *log_bin_trust_function_creators ==> gerer la creation des routines . s'il est a off on peut pas creer de 
     routines;
    * general_log ==>
*/
-- pour afficher les variables comportant la chaine 'log'
SHOW VARIABLES LIKE '%log%';

-- my.ini ==> 

-- datadir ==> le chemin ou se trouve les donnees des  bases de donnees (tables.frm et tables.ibd);
show variables like '%datadir%';
/*
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| datadir       | /var/lib/mysql/ | ==> fichier ou se trouve les donnees des enregistrements des BD;
+---------------+-----------------+
*/

show variables like '%default%';
/*
+----------------------------------+---------+
| Variable_name                    | Value   |
+----------------------------------+---------+
| default_master_connection        |         |
| default_password_lifetime        | 0       |
| default_regex_flags              |         |
| default_storage_engine           | InnoDB  | ==> le moteur de stockage par defaut
| default_tmp_storage_engine       |         |
| default_week_format              | 0       |
| explicit_defaults_for_timestamp  | OFF     |
| innodb_compression_default       | OFF     |
| innodb_default_encryption_key_id | 1       |
| innodb_default_row_format        | dynamic |
+----------------------------------+---------+
*/

show variables like '%basedir%';
/*
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| basedir       | /usr  |
+---------------+-------+
*/

--long-query-time=10 ==>

/*
Dans ce fichier `/etc/mysql/mariadb.conf.d/50-server.cnf`, vous pouvez configurer divers paramètres pour MariaDB, tels que le port d'écoute, le chemin 
des données, la mémoire allouée, etc. Pour changer le temps de log des requêtes lentes, vous pouvez ajouter 
ou modifier la ligne suivante :

slow_query_log_file = /var/log/mysql/mariadb-slow.log
long_query_time = 1
La première ligne définit le chemin et le nom du fichier de log des requêtes lentes. La seconde ligne définit
 le temps en secondes après lequel une requête sera considérée comme lente et enregistrée dans le fichier de log.

N'oubliez pas de redémarrer le serveur MariaDB pour que les modifications soient prises en compte. Vous pouvez
 le faire en utilisant la commande suivante :

sudo systemctl restart mariadb
*/

--Taille de chaque BASE DE DONNE
SELECT Table_Schema "DB name", Round(Sum(data_length + index_length) / 1024 / 1024, 1) "DBSize (MB)" 
FROM information_schema.tables GROUP BY table_schema ;

/*
+--------------------+-------------+
| DB name            | DBSize (MB) |
+--------------------+-------------+
| Agence             |         0.1 |
| information_schema |         0.2 |
| mysql              |         3.4 |
| performance_schema |         0.0 |
| School             |         0.1 |
| Scolarite          |         0.1 |
| sys                |         0.0 |
+--------------------+-------------+

*/

--Taille de chaque table d’une base de données
SELECT Table_name AS "Table", Round(((data_length + index_length) / 1024 / 1024), 2) "TableSize (MB)" 
FROM Information_Schema.TABLES WHERE Table_schema= "Scolarite";

/*
+---------------+----------------+
| Table         | TableSize (MB) |
+---------------+----------------+
| Informaticien |           NULL |
| Departement   |           0.03 |
| Servir        |           0.03 |
| Changer       |           0.03 |
| Enseignant    |           0.02 |
| Matiere       |           0.02 |
+---------------+----------------+
*/

----Exportation de données vers un fichier
-- Sous la console MySQL après connection
SELECT * INTO OUTFILE '/home/eadarak/Documents/Databases/Enseignant.csv' FIELDS TERMINATED BY ',' ENCLOSED BY'"' LINES TERMINATED BY '\n' FROM Enseignant