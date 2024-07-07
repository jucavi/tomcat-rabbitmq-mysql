-- Create the user and grant all privileges
CREATE USER 'snc'@'%' IDENTIFIED BY 'snc123!';
GRANT ALL PRIVILEGES ON *.* TO 'snc'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;