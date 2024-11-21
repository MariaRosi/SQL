SHOW VARIABLES LIKE 'hostname';

select database();

SHOW GRANTS FOR 'root'@'DESKTOP-8R1J4AO';
SHOW GRANTS FOR 'root'@'localhost';


GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;


GRANT ALL PRIVILEGES ON *.* TO 'root'@'DESKTOP-8R1J4AO' WITH GRANT OPTION;
FLUSH PRIVILEGES;

UPDATE mysql.user SET Grant_priv='Y' WHERE User='root' AND Host='localhost';
FLUSH PRIVILEGES;
