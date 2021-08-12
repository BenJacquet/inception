CREATE DATABASE wordpress;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpassword';
CREATE USER 'wordpress'@'%' identified by 'wordpress';
GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;