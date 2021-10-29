CREATE VIEW faturamento_atual AS
    SELECT 
        CONCAT(MIN(valor), '.00') AS `faturamento_minimo`,
        CONCAT(MAX(valor)) AS `faturamento_maximo`,
        CONCAT(ROUND(AVG(valor), 1), '0') AS `faturamento_medio`,
        CONCAT(SUM(valor)) AS `faturamento_total`
    FROM
        SpotifyClone.Plano AS P
            INNER JOIN
        SpotifyClone.Usuario AS U ON P.plano_id = U.plano_id;