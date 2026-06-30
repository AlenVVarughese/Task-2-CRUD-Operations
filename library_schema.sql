-- Create Database
CREATE DATABASE LibraryDB;

USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publication_year YEAR,
    author_id INT,
    category_id INT,

    FOREIGN KEY (author_id)
        REFERENCES Authors(author_id),

    FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (book_id)
        REFERENCES Books(book_id),

    FOREIGN KEY (member_id)
        REFERENCES Members(member_id)
);



INSERT INTO Authors (author_name, country)
VALUES
('J.K. Rowling', 'United Kingdom'),
('George Orwell', 'United Kingdom'),
('Paulo Coelho', 'Brazil'),
('Dan Brown', 'USA'),
('R.K. Narayan', 'India');

INSERT INTO Categories (category_name)
VALUES
('Fantasy'),
('Fiction'),
('Mystery'),
('Self Help'),
('Classic');


INSERT INTO Books (title, publication_year, author_id, category_id)
VALUES
('Harry Potter', 1997, 1, 1),
('1984', 1949, 2, 5),
('The Alchemist', 1988, 3, 2),
('The Da Vinci Code', 2003, 4, 3),
('Malgudi Days', 1943, 5, 2);

INSERT INTO Members (member_name, email, phone)
VALUES
('John', 'john@gmail.com', '9876543210'),
('Alice', 'alice@gmail.com', NULL),
('David', NULL, '9999999999'),
('Emma', 'emma@gmail.com', '8888888888'),
('Sophia', NULL, NULL);

INSERT INTO Loans (book_id, member_id, issue_date, return_date)
VALUES
(1,1,'2026-06-20','2026-06-30'),
(2,2,'2026-06-21',NULL),
(3,3,'2026-06-22','2026-07-01'),
(4,4,'2026-06-23',NULL),
(5,5,'2026-06-24',NULL);


UPDATE Members
SET email='david@gmail.com'
WHERE member_id=3;

UPDATE Books
SET title='Harry Potter and the Philosopher''s Stone'
WHERE book_id=1;

UPDATE Members
SET phone='9123456789'
WHERE member_id=2;

DELETE FROM Loans
WHERE loan_id=5;

DELETE FROM Categories
WHERE category_id=5;

SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loans;