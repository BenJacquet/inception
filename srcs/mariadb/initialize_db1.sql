CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'%' identified by 'wordpress';
GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;