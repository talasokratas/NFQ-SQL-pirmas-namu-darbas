/*
 * My First MySQL Script - Evaldas Vaitonis, NFQ Akademija
 */

 ALTER TABLE authors ENGINE=InnoDB; --change authors table engine to allow foreign keys

--
-- Table structure for table `book_author` - many to many relationship table
--

 CREATE TABLE IF NOT EXISTS `book_author` (
  authorId int(11) NOT NULL,
  bookId int(11) NOT NULL,
  FOREIGN KEY (bookId) REFERENCES books (bookId) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (authorID) REFERENCES authors (authorId) ON DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY (bookId, authorId)
);

--
-- Dumping data for table `book_author`
--

INSERT INTO book_author (bookId, authorId)
VALUES
(1,1),
(2,2),
(3,4),
(4,6),
(5,7),
(1,4),
(2,6),
(3,6),
(3,1);

ALTER TABLE books DROP authorId; --delete authorId column from books table

ALTER TABLE books MODIFY title varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci; --set title column's characters to utf8 format
ALTER TABLE books CHARACTER SET = utf8 COLLATE = utf8_lithuanian_ci; --we can also set the same format to table