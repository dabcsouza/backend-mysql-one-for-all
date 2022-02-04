DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    value DOUBLE NOT NULL, 
    CONSTRAINT PRIMARY KEY (id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    hiring_date DATE NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(plan_id) REFERENCES plans (id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY (id)  
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
	id INT NOT NULL AUTO_INCREMENT,
    artist_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artist (id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
	id INT NOT NULL AUTO_INCREMENT,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    `duration(secounds)` INT NOT NULL,
    release_year YEAR NOT NULL,
    CONSTRAINT PRIMARY KEY (id),
    FOREIGN KEY(artist_id) REFERENCES artist (id),
    FOREIGN KEY(album_id) REFERENCES album (id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
    song_id INT NOT NULL,
    user_id INT NOT NULL,
    reproduce_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(song_id, user_id),
    FOREIGN KEY(song_id) REFERENCES songs (id),
    FOREIGN KEY(user_id) REFERENCES users (id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.following(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY(user_id) REFERENCES users (id),
    FOREIGN KEY(artist_id) REFERENCES artist (id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (name, value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('pessoal', 6.99),
  ('universitário', 5.99);
  
INSERT INTO SpotifyClone.users (name, age, plan_id, hiring_date)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 4, '2019-06-05'),
  ('Roger', 45, 3, '2020-05-13'),
  ('Norman', 58, 3, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 4, '2018-01-05'),
  ('Carol', 19, 4, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');
  
INSERT INTO SpotifyClone.artist (name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.album (artist_id, name)
VALUES
	(1, 'Envious'),
	(1, 'Exuberant'),
	(2, 'Hallowed Steam'),
	(3, 'Incandescent'),
	(4, 'Temporary Culture'),
	(4, 'Library of liberty'),
	(5, 'Chained Down'),
	(5, 'Cabinet of fools'),
	(5, 'No guarantees'),
	(6, 'Apparatus');

INSERT INTO SpotifyClone.songs
	(artist_id, album_id, name, 
	`duration(secounds)`, release_year) VALUES
    (1, 1, 'Soul For Us', 200, '1990'),
    (1, 1, 'Reflections Of Magic', 163, '1990'),
    (1, 1, 'Dance With Her Own', 116, '1990'),
    (1, 2, 'Troubles Of My Inner Fire', 203, '1993'),
    (1, 2, 'Time Fireworks', 152, '1993'),
    (2, 3, 'Magic Circus', 105, '1995'),
    (2, 3, 'Honey, So Do I', 207, '1995'),
    (2, 3, "Sweetie, Let's Go Wild", 139, '1995'),
    (2, 3, 'She Knows', 244, '1995'),
    (3, 4, 'Fantasy For Me', 100, '1998'),
    (3, 4, 'Celebration Of More', 146, '1998'),
    (3, 4, 'Rock His Everything', 223, '1998'),
    (3, 4, 'Home Forever', 231, '1998'),
    (3, 4, 'Diamond Power', 241, '1998'),
    (3, 4, "Let's Be Silly", 132, '1998'),
    (4, 5, 'Thang Of Thunder', 240, '2001'),
    (4, 5, 'Words Of Her Life', 185, '2001'),
    (4, 5, 'Without My Streets', 176, '2001'),
    (4, 6, 'Need Of The Evening', 190, '2003'),
    (4, 6, 'History Of My Roses', 222, '2003'),
    (4, 6, 'Without My Love', 111, '2003'),
    (4, 6, 'Walking And Game', 123, '2003'),
    (4, 6, 'Young And Father', 197, '2003'),
    (5, 7, 'Finding My Traditions', 179, '2007'),
    (5, 7, 'Walking And Man', 229, '2007'),
    (5, 7, 'Hard And Time', 135, '2007'),
    (5, 7, "Honey, I'm A Lone Wolf", 150, '2007'),
    (5, 8, "She Thinks I Won't Stay Tonight", 166, '2012'),
    (5, 8, "He Heard You're Bad For Me", 154, '2012'),
    (5, 8, "He Hopes We Can't Stay", 210, '2012'),
    (5, 8, "I Know I Know", 117, '2012'),
    (5, 9, "He's Walking Away", 159, '2015'),
    (5, 9, "He's Trouble", 138, '2015'),
    (5, 9, "I Heard I Want To Bo Alone", 120, '2015'),
    (5, 9, "I Ride Alone", 151, '2015'),
    (6, 10, "Honey", 79, '2015'),
    (6, 10, "You Cheated On Me", 95, '2015'),
    (6, 10, "Wouldn't It Be Nice", 213, '2015'),
    (6, 10, "Baby", 136, '2015'),
    (6, 10, "You Make Me Feel So..", 83, '2015');
    
INSERT INTO SpotifyClone.history
	(song_id, user_id, reproduce_date) VALUES
    (36, 1, "2020-02-28 10:45:55"),
    (25, 1, "2020-05-02 05:30:35"),
    (23, 1, "2020-03-06 11:22:33"),
    (14, 1, "2020-08-05 08:05:17"),
    (15, 1, "2020-09-14 16:32:22"),
    (34, 2, "2020-01-02 07:40:33"),
    (24, 2, "2020-05-16 06:16:22"),
    (21, 2, "2020-10-09 12:27:48"),
    (39, 2, "2020-09-21 13:14:46"),
    (6, 3, "2020-11-13 16:55:13"),
    (3, 3, "2020-12-05 18:38:30"),
    (26, 3, "2020-07-30 10:00:00"),
    (2, 4, "2021-08-15 17:10:10"),
    (35, 4, "2021-07-10 15:20:30"),
    (27, 4, "2021-01-09 01:44:33"),
    (7, 5, "2020-07-03 19:33:28"),
    (12, 5, "2017-02-24 21:14:22"),
    (14, 5, "2020-08-06 15:23:43"),
    (38, 5, "2020-11-10 13:52:27"),
    (1, 6, "2019-02-07 20:33:48"),
    (29, 6, "2017-01-24 00:31:17"),
    (30, 6, "2017-10-12 12:35:20"),
    (22, 6, "2018-05-29 14:56:41"),
    (5, 7, "2018-05-09 22:30:49"),
    (4, 7, "2020-07-27 12:52:58"),
    (11, 7, "2018-01-16 18:40:43"),
    (39, 8, "2018-03-21 16:56:40"),
    (40, 8, "2020-10-18 13:38:05"),
    (32, 8, "2019-05-25 08:14:03"),
    (33, 8, "2021-08-15 21:37:09"),
    (16, 9, "2021-05-24 17:23:45"),
    (17, 9, "2018-12-07 22:48:52"),
    (8, 9, "2021-03-14 06:14:26"),
    (9, 9, "2020-04-01 03:36:00"),
    (36, 10, "2017-02-06 08:21:34"),
    (37, 10, "2017-12-04 05:33:43"),
    (39, 10, "2017-07-27 05:24:49"),
    (40, 10, "2017-12-25 01:03:57");
    
INSERT INTO SpotifyClone.following 
	(user_id, artist_id) VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);








