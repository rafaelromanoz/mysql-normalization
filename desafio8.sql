DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usuario_cancoes
WHERE OLD.usuario_id = usuario_id;
DELETE FROM SpotifyClone.usuario_historico_artista WHERE OLD.usuario_id = usuario_id;
END $$
DELIMITER ;
