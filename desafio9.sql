DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(50))
BEGIN
SELECT nome_artista AS `artista`, nome_album AS `album` FROM SpotifyClone.Artista 
AS Ar INNER JOIN SpotifyClone.Album AS Al ON Ar.artista_id = Al.artista_id
WHERE Ar.nome_artista = nomeArtista;
END $$
DELIMITER ;
