USE imdb_analysis;


CREATE TABLE movies (
    tconst VARCHAR(20) PRIMARY KEY,
    titleType VARCHAR(20),
    primaryTitle VARCHAR(255),
    originalTitle VARCHAR(255),
    startYear INT,
    endYear INT,
    runtimeMinutes INT
);

CREATE TABLE ratings (
    tconst VARCHAR(20) PRIMARY KEY,
    averageRating FLOAT,
    numVotes INT,
    FOREIGN KEY (tconst) REFERENCES movies(tconst)
);

CREATE TABLE genres (
    tconst VARCHAR(20),
    genre VARCHAR(50),
    FOREIGN KEY (tconst) REFERENCES movies(tconst),
    PRIMARY KEY (tconst, genre)
);