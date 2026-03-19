
-- Sprint 1: Project Setup

CREATE TABLE authors (
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    nationality  VARCHAR(100),
    birth_year   INT,
    death_year   INT
);

CREATE TABLE books (
    id             SERIAL PRIMARY KEY,
    title          VARCHAR(200) NOT NULL,
    author_id      INT REFERENCES authors(id) ON DELETE SET NULL,
    genres         TEXT[],
    published_year INT,
    available      BOOLEAN DEFAULT TRUE
);

CREATE TABLE patrons (
    id             SERIAL PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    email          VARCHAR(150) UNIQUE,
    borrowed_books INT[] DEFAULT ARRAY[]::INT[]
);
