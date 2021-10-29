CREATE SCHEMA IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano (
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    valor DOUBLE NOT NULL
)  ENGINE=INNODB;

CREATE TABLE Usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES Plano (plano_id)
)  ENGINE=INNODB;

CREATE TABLE Artista (
    artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(50) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE usuario_historico_artista (
    artista_id INT NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (artista_id , usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES Artista (artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (usuario_id)
);

CREATE TABLE Album (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artista (artista_id)
);

CREATE TABLE Cancoes (
    cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cancao VARCHAR(50),
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artista (artista_id),
    FOREIGN KEY (album_id)
        REFERENCES Album (album_id)
)  ENGINE=INNODB;

CREATE TABLE usuario_cancoes (
    usuario_id INT NOT NULL,
    cancoes_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , cancoes_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (usuario_id),
    FOREIGN KEY (cancoes_id)
        REFERENCES Cancoes (cancao_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.Plano(`nome`,`valor`) VALUES
('gratuito',0.00),
('familiar',7.99),
('universitário',5.99);

INSERT INTO SpotifyClone.Artista(`nome_artista`) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.Usuario(`nome`,`idade`,`plano_id`) VALUES
('Thati',23,1),
('Cintia',35,2),
('Bill',20,3),
('Roger',45,1);

INSERT INTO SpotifyClone.usuario_historico_artista(`usuario_id`,`artista_id`) VALUES
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);


INSERT INTO SpotifyClone.Album(`nome_album`,`artista_id`) VALUES
('Envious',1),
('Exuberant',1),
('Hallowed Steam',2),
('Incandescent',3),
('Temporary Culture',4);

INSERT INTO SpotifyClone.Cancoes(`nome_cancao`,`album_id`,`artista_id`) VALUES
('Soul For Us',1,1),
('Reflections Of Magic',1,1),
('Dance With Her Own',1,1),
('Troubles Of My Inner Fire',2,1),
('Time Fireworks',2,1),
('Magic Circus',3,2),
('Honey, So Do I',3,2),
("Sweetie, Let's Go Wild",3,2),
('She Knows',3,2),
('Fantasy For Me',4,3),
('Celebration Of More',4,3),
('Rock His Everything',4,3),
('Home Forever',4,3),
('Diamond Power',4,3),
("Honey, Let's Be Silly",4,3),
('Thang Of Thunder',5,4),
('Words Of Her Life',5,4),
('Without My Streets',5,4);

INSERT INTO SpotifyClone.usuario_cancoes(`usuario_id`,`cancoes_id`) VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);