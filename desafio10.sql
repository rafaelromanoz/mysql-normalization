DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idUsuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidadeMusicas INT;
SELECT COUNT(uc.usuario_id) AS `quantidade_musicas_no_historico` FROM SpotifyClone.usuario_cancoes AS uc INNER JOIN SpotifyClone.Usuario AS U ON uc.usuario_id = U.usuario_id WHERE uc.usuario_id = idUsuario INTO quantidadeMusicas;
RETURN quantidadeMusicas;
END $$

DELIMITER ;
