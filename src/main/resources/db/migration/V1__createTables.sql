CREATE TABLE Genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Author(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

CREATE TABLE Music(
    id SERIAL PRIMARY KEY,
    title VARCHAR(90) NOT NULL,
    genre_id INTEGER REFERENCES Genre(id),
    author_id INTEGER REFERENCES Author(id),
    duration INTEGER,
    likes INTEGER DEFAULT 0
);