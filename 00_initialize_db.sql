CREATE USER article password 'article';
CREATE DATABASE article WITH OWNER=article ENCODING = 'UTF8' TEMPLATE template0;
GRANT ALL PRIVILEGES ON DATABASE article TO article;

CREATE EXTENSION ltree; -- l'extension ltree nous servira plus tard
CREATE EXTENSION postgis;
CREATE EXTENSION "uuid-ossp"; -- Nous allons manipuler des identifiants uniques par la suite
