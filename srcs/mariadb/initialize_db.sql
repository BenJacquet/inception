CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress'@'localhost' IDENTIFIED BY 'wordpress_pwd';
GRANT ALL ON *.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;