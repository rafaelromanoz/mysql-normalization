CREATE VIEW perfil_artistas AS
    SELECT 
        Ar.nome_artista AS `artista`,
        A.nome_album AS `album`,
        COUNT(uh.usuario_id) AS `seguidores`
    FROM
        SpotifyClone.Artista AS Ar
            INNER JOIN
        SpotifyClone.usuario_historico_artista AS uh ON Ar.artista_id = uh.artista_id
            INNER JOIN
        SpotifyClone.Album AS A ON A.artista_id = Ar.artista_id
    GROUP BY `album`
    ORDER BY `seguidores` DESC , `artista`;


