USE codeup_test_db;

-- SELECT  'Genre: Rock => ', id, artist, name, release_date, sales, genre FROM albums WHERE genre = 'Rock';

SELECT * AS 'The name of all albums by Pink Floyd.' FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date AS 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT genre AS 'The genre for Nevermind' FROM albums WHERE name = 'Nevermind';
SELECT * AS 'Albums Released in the 1990s' FROM albums WHERE release_date BETWEEN 1990 AND 2000;
SELECT * AS 'Which albums had less than 20 million certified sales' FROM albums WHERE sales > 20;
SELECT * AS 'All the albums with a genre of "Rock"' FROM albums WHERE genre = 'Rock';