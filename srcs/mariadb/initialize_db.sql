CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'wordpress';
GRANT ALL ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;