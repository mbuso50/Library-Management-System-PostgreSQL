
-- Sprint 6: Advanced Queries

SELECT * FROM books
WHERE published_year > 1950;

SELECT * FROM authors
WHERE nationality = 'American';

UPDATE books
SET available = TRUE;

SELECT * FROM books
WHERE available = TRUE
AND published_year > 1950;

SELECT * FROM authors
WHERE name ILIKE '%George%';

UPDATE books
SET published_year = published_year + 1
WHERE published_year = 1869;

SELECT
    b.id,
    b.title,
    a.name        AS author,
    a.nationality,
    b.genres,
    b.published_year,
    b.available
FROM books b
JOIN authors a ON b.author_id = a.id
ORDER BY b.published_year ASC;

SELECT
    p.id,
    p.name,
    p.email,
    p.borrowed_books
FROM patrons p
WHERE array_length(p.borrowed_books, 1) > 0;
