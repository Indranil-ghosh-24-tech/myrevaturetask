create database imdb_movies;


CREATE TABLE imdb_movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(100),
    description TEXT,
    director VARCHAR(255),
    actors TEXT,
    year INT,
    runtime INT,
    rating FLOAT,
    votes INT,
    revenue FLOAT,
    metascore FLOAT
);

