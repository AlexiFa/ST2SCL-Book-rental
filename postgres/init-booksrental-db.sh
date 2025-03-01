#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE booksrental;
    GRANT ALL PRIVILEGES ON DATABASE booksrental TO dbuser;
EOSQL

# connect to database and create table then insert data
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "booksrental" <<-EOSQL
    CREATE TABLE IF NOT EXISTS books (
        isbn VARCHAR(50) PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        author VARCHAR(100) NOT NULL,
        price INT NOT NULL CHECK (price > 0)
    );

    INSERT INTO books (isbn, title, author, price) VALUES
    ('978-0132350884', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', 250),
    ('978-0201633610', 'Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides', 300),
    ('978-0321125217', 'The Pragmatic Programmer: Your Journey to Mastery', 'Andrew Hunt, David Thomas', 200),
    ('978-0321336385', 'Refactoring: Improving the Design of Existing Code', 'Martin Fowler', 150),
    ('978-0321812186', 'Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation', 'Jez Humble, David Farley', 200);
EOSQL