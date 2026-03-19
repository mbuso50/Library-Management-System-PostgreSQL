# Library-Management-System-PostgreSQL


A PostgreSQL database for managing a library's books, authors, and patrons.

## How to Run

### Option A — pgAdmin
1. Open pgAdmin and connect to your PostgreSQL server
2. Right-click **Databases** → **Create** → **Database** → name it `LibraryDB`
3. Select `LibraryDB`, open the **Query Tool**
4. Open each `.sql` file in order and click **Execute (F5)**

### Option B — psql (terminal)
```bash
# Create the database
psql -U postgres -c "CREATE DATABASE LibraryDB;"

# Connect and run each file in order
psql -U postgres -d LibraryDB -f sprint1_setup.sql
psql -U postgres -d LibraryDB -f sprint2_insert.sql
psql -U postgres -d LibraryDB -f sprint3_read.sql
psql -U postgres -d LibraryDB -f sprint4_update.sql
psql -U postgres -d LibraryDB -f sprint5_delete.sql
psql -U postgres -d LibraryDB -f sprint6_advanced.sql
```

---

## Sprint Summary

### Sprint 1 — Setup (`sprint1_setup.sql`)
Creates three tables with the correct data types and relationships.
- `authors` table
- `books` table with `author_id` foreign key (`ON DELETE SET NULL`)
- `patrons` table with `borrowed_books` as an integer array

### Sprint 2 — Insert Data (`sprint2_insert.sql`)
```sql
INSERT INTO authors (id, name, nationality, birth_year, death_year) VALUES
(1, 'George Orwell', 'British', 1903, 1950), ...

INSERT INTO books (id, title, author_id, genres, published_year, available) VALUES
(1, '1984', 1, ARRAY['Dystopian', 'Political Fiction'], 1949, TRUE), ...

INSERT INTO patrons (id, name, email, borrowed_books) VALUES
(1, 'Alice Johnson', 'alice@example.com', ARRAY[]::INT[]), ...
```

### Sprint 3 — Read Operations (`sprint3_read.sql`)

**Get all books**
```sql
SELECT * FROM books;
```

**Get a book by title**
```sql
SELECT * FROM books WHERE title = '1984';
```

**Get all books by a specific author**
```sql
SELECT b.id, b.title, b.genres, b.published_year, b.available
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE a.name = 'George Orwell';
```

**Get all available books**
```sql
SELECT * FROM books WHERE available = TRUE;
```

### Sprint 4 — Update Operations (`sprint4_update.sql`)

**Mark a book as borrowed**
```sql
UPDATE books SET available = FALSE WHERE id = 1;
```

**Add a new genre to a book**
```sql
UPDATE books
SET genres = array_append(genres, 'Classic')
WHERE title = '1984';
```

**Add a borrowed book to a patron's record**
```sql
UPDATE patrons
SET borrowed_books = array_append(borrowed_books, 1)
WHERE id = 1;
```

**Remove a book from patron's record (return)**
```sql
UPDATE patrons
SET borrowed_books = array_remove(borrowed_books, 1)
WHERE id = 1;
```

### Sprint 5 — Delete Operations (`sprint5_delete.sql`)

**Delete a book by title**
```sql
DELETE FROM books WHERE title = 'The Hobbit';
```

**Delete an author by ID**
```sql
-- Books referencing this author will have author_id set to NULL
DELETE FROM authors WHERE id = 10;
```

### Sprint 6 — Advanced Queries (`sprint6_advanced.sql`)

**Books published after 1950**
```sql
SELECT * FROM books WHERE published_year > 1950;
```

**All American authors**
```sql
SELECT * FROM authors WHERE nationality = 'American';
```

**Set all books as available**
```sql
UPDATE books SET available = TRUE;
```

**Available books published after 1950**
```sql
SELECT * FROM books
WHERE available = TRUE AND published_year > 1950;
```

**Authors whose name contains "George"**
```sql
SELECT * FROM authors WHERE name ILIKE '%George%';
```

**Increment published year 1869 by 1**
```sql
UPDATE books
SET published_year = published_year + 1
WHERE published_year = 1869;
```

---
