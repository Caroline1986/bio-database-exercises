USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR (50),
    name VARCHAR (100),
    release_date INT,
    sales FLOAT (5,2),
    genre VARCHAR (20),
    PRIMARY KEY (id)
    );
    DESCRIBE albums;