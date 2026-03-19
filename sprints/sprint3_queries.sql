
-- Sprint 3: Read Operations (Queries)

SELECT * FROM books;

SELECT * FROM books
WHERE title = '1984';

-- Join books with authors to search by author name
SELECT b.id, b.title, b.genres, b.published_year, b.available
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE a.name = 'George Orwell';

SELECT * FROM books
WHERE available = TRUE;
