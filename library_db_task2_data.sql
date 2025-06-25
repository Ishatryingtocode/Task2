-- INSERT INTO author
INSERT INTO author (name, bio) VALUES 
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George Orwell', 'English novelist and essayist, famous for 1984 and Animal Farm.'),
('Agatha Christie', NULL), -- bio is NULL
('Haruki Murakami', 'Japanese writer known for surreal fiction.');

-- INSERT INTO category
INSERT INTO category (category_name) VALUES
('Fantasy'),
('Dystopian'),
('Mystery'),
('Literary Fiction');

-- INSERT INTO book
INSERT INTO book (title, isbn, publication_year, category_id, status) VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532699', 1997, 1, 'available'),
('1984', '9780451524935', 1949, 2, 'available'),
('Murder on the Orient Express', '9780007119318', 1934, 3, 'available'),
('Kafka on the Shore', NULL, 2002, 4, DEFAULT); -- ISBN is NULL

-- INSERT INTO book_author (Many-to-Many)
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1), -- HP by Rowling
(2, 2), -- 1984 by Orwell
(3, 3), -- Christie
(4, 4); -- Kafka by Murakami

-- INSERT INTO member
INSERT INTO member (first_name, last_name, email, address) VALUES
('Alice', 'Smith', 'alice@example.com', '123 Library Lane'),
('Bob', 'Johnson', 'bob.johnson@example.com', NULL), -- address is NULL
('Charlie', 'Rose', 'charlie.rose@example.com', '789 Reading Blvd');

-- INSERT INTO loan
INSERT INTO loan (book_id, member_id, loan_date, return_date) VALUES
(2, 1, '2025-06-01', NULL), -- currently borrowed
(3, 2, '2025-06-05', '2025-06-15');

-- Step 1: Insert Authors (avoid duplicates)
INSERT INTO author (name, bio) VALUES
('Suzanne Collins', 'American author known for The Hunger Games trilogy.'),
('Jay Asher', 'Author of the bestselling novel 13 Reasons Why.'),
('Jeff Kinney', 'Creator of the Diary of a Wimpy Kid series.'),
('C.S. Lewis', 'British writer and scholar, famous for The Chronicles of Narnia.');

-- Step 2: Insert "Young Adult" category if not exists
-- First check if it already exists
INSERT INTO category (category_name)
SELECT 'Young Adult'
WHERE NOT EXISTS (
    SELECT 1 FROM category WHERE category_name = 'Young Adult'
);

INSERT INTO book (title, isbn, publication_year, category_id, status) VALUES
('The Hunger Games', '9780439023481', 2008, 5, DEFAULT),
('13 Reasons Why', '9781595141712', 2007, 5, DEFAULT),
('Diary of a Wimpy Kid', '9780810993136', 2007, 5, DEFAULT),
('The Chronicles of Narnia', '9780066238500', 1956, 5, DEFAULT);

-- Step 4: Link Books with Authors (get actual book_id and author_id)
INSERT INTO book_author (book_id, author_id) VALUES
(5,5),
(6,6),
(7,7),
(8,8);

-- UPDATE Operations
-- Add missing bio for Agatha Christie
UPDATE author
SET bio = 'Known for her detective novels including Hercule Poirot and Miss Marple.'
WHERE author_id = 3;

-- Correct a misspelled email
UPDATE member
SET email = 'charlie.rose99@example.com'
WHERE email = 'charlie.rose@example.com';

-- DELETE Operations
-- Remove a member who was entered by mistake
DELETE FROM member
WHERE email = 'alice@example.com'; 


