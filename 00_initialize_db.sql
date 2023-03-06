CREATE USER article WITH ENCRYPTED PASSWORD 'article';
CREATE DATABASE article WITH OWNER article;

CREATE EXTENSION ltree; -- l'extension ltree nous servira plus tard
CREATE EXTENSION postgis;
CREATE EXTENSION "uuid-ossp"; -- Nous allons manipuler des identifiants uniques par la suite
