
-- Sprint 4: Update Operations

UPDATE books
SET available = FALSE
WHERE id = 1;

UPDATE books
SET available = TRUE
WHERE id = 1;

UPDATE books
SET genres = array_append(genres, 'Classic')
WHERE title = '1984';

UPDATE patrons
SET borrowed_books = array_append(borrowed_books, 1)
WHERE id = 1;

UPDATE patrons
SET borrowed_books = array_remove(borrowed_books, 1)
WHERE id = 1;
