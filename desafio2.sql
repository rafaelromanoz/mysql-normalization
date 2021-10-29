CREATE VIEW estatisticas_musicais AS SELECT(SELECT COUNT(nome_cancao)  FROM SpotifyClone.Cancoes) AS cancoes,
(SELECT COUNT(nome_artista) FROM SpotifyClone.Artista) AS artistas, COUNT(nome_album) AS albuns FROM SpotifyClone.Album;
