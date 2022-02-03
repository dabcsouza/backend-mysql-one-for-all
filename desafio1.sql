DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.users(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL, 
    CONSTRAINT PRIMARY KEY(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.plans(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    value DOUBLE NOT NULL, 
    CONSTRAINT PRIMARY KEY(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(id)  
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
	id INT NOT NULL AUTO_INCREMENT,
    artist_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artist(id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.signings(
	id INT NOT NULL AUTO_INCREMENT,
    plan_id INT NOT NULL,
    hiring_date DATE NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(plan_id) REFERENCES plans(id),
    FOREIGN KEY(plan_id) REFERENCES users(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
	id INT NOT NULL AUTO_INCREMENT,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    `duration(secounds)` INT NOT NULL,
    release_year YEAR NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(artist_id) REFERENCES artist(id),
    FOREIGN KEY(album_id) REFERENCES album(id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
	id INT NOT NULL AUTO_INCREMENT,
    song_id INT NOT NULL,
    reproduce_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(id),
    FOREIGN KEY(song_id) REFERENCES songs(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history_link(
    user_id INT NOT NULL,
    history_id INT NOT NULL,
    CONSTRAINT
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(history_id) REFERENCES history(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_link(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT
    FOREIGN KEY(user_id) REFERENCES artist(id),
    FOREIGN KEY(artist_id) REFERENCES history(id)
) engine = InnoDB;

INSERT INTO SpotifyClone.users (name, age)
VALUES
  ('Thati', 23),
  ('Cintia', 35),
  ('Bill', 20),
  ('Roger', 45),
  ('Norman', 58),
  ('Patrick', 33),
  ('Vivian', 26),
  ('Carol', 19),
  ('Angelina', 42),
  ('Paul', 46);

INSERT INTO SpotifyClone.plans (name, value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('pessoal', 6.99),
  ('universitário', 5.99);
  
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

INSERT INTO SpotifyClone.signings 
	(plan_id, hiring_date) VALUES
    (1, '2019-10-20'),
    (2, '2017-12-30'),
    (4, '2019-06-05'),
    (3, '2020-05-13'),
    (3, '2017-02-17'),
    (2, '2017-01-06'),
    (4, '2018-01-05'),
    (4, '2018-02-14'),
    (2, '2018-04-29'),
    (2, '2017-01-17');

INSERT INTO SpotifyClone.songs
	(artist_id, album_id, name, 
	`duration(secounds)`, release_year) VALUES
    (1, 1, 'Soul For Us', 200, '1990'),
    (1, 1, 'Reflections Of Magic', 163, '1990'),
    (1, 1, 'Dance With Her Own', 116, '1990'),
    (1, 1, 'Troubles Of My Inner Fire', 203, '1993'),
    (1, 1, 'Time Fireworks', 152, '1993'),
    (1, 1, 'Magic Circus', 105, '1995'),
    (1, 1, 'Honey, So Do I', 207, '1995'),
    (1, 1, "Sweetie, Let's Go Wild", 139, '1995'),
    (1, 1, 'She Knows', 244, '1995'),
    (1, 1, 'Fantasy For Me', 100, '1998'),
    (1, 1, 'Celebration Of More', 146, '1998'),
    (1, 1, 'Rock His Everything', 223, '1998'),
    (1, 1, 'Home Forever', 231, '1998'),
    (1, 1, 'Diamond Power', 241, '1998'),
    (1, 1, "Let's Be Silly", 132, '1998'),
    (1, 1, 'Thang Of Thunder', 240, '2001'),
    (1, 1, 'Words Of Her Life', 185, '2001'),
    (1, 1, 'Without My Streets', 176, '2001'),
    (1, 1, 'Need Of The Evening', 190, '2003'),
    (1, 1, 'History Of My Roses', 222, '2003'),
    (1, 1, 'Without My Love', 111, '2003'),
    (1, 1, 'Walking And Game', 123, '2003'),
    (1, 1, 'Young And Father', 197, '2003'),
    (1, 1, 'Finding My Traditions', 179, '2007'),
    (1, 1, 'Walking And Man', 229, '2007'),
    (1, 1, 'Hard And Time', 135, '2007'),
    (1, 1, "Honey, I'm A Lone Wolf", 150, '2007'),
    (1, 1, "She Thinks I Won't Stay Tonight", 166, '2012'),
    (1, 1, "He Heard You're Bad For Me", 154, '2012'),
    (1, 1, "He Hopes We Can't Stay", 210, '2012'),
    (1, 1, "I Know I Know", 117, '2012'),
    (1, 1, "He's Walking Away", 159, '2015'),
    (1, 1, "He's Trouble", 138, '2015'),
    (1, 1, "I Heard I Want To Bo Alone", 120, '2015'),
    (1, 1, "I Ride Alone", 151, '2015'),
    (1, 1, "Honey", 79, '2015'),
    (1, 1, "You Cheated On Me", 95, '2015'),
    (1, 1, "Wouldn't It Be Nice", 213, '2015'),
    (1, 1, "Baby", 136, '2015'),
    (1, 1, "You Make Me Feel So..", 83, '2015');
    


    







