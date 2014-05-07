<?php

	function publish($username,$title,$body,$links) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("INSERT INTO Noticia VALUES(DEFAULT,?,?,?,?)");
		if(!$stmt->execute(array($body,$title,date('Y-m-d'),$username))) {
			$conn->rollBack();
			exit;
		}

		foreach($links as $key->$link) {
			$stmt = $conn->prepare("INSERT INTO Link VALUES(?,?)");
			if (!$stmt->execute(array($link['href'],$link['homeLink']))) {
				$conn->rollBack();
				exit;
			}
		}

		$stmt = $conn->prepare("INSERT INTO Noticia VALUES(DEFAULT,?,?,?,?)");
		if (!$stmt->execute(array($body,$title,date('Y-m-d'),$username))) {
			$conn->rollBack();
			exit;
		}	
		return $conn->commit();
	}

	function comment($contentId,$username,$content) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("SELECT idNoticia FROM Noticia WHERE idNoticia = ?");
		if (!$stmt->execute(array($contentId))) {
			$conn->rollback();
			exit;
		}
		$stmt = $conn->prepare("SELECT * FROM Editor WHERE username LIKE ?");
		if (!$stmt->execute(array($username))) {
			$conn->rollBack();
			exit;
		}
		$stmt = $conn->prepare("INSERT INTO Comentario VALUES (DEFAULT, ?, ?, ?)");
		if (!$stmt->execute(array($content,$username,$contentId))) {
			$conn->rollBack();
			exit;
		}
		return $conn->commit();
	}

	function getContentComments($contentId) {
		global $conn;
		$stmt = $conn->prepare("SELECT Noticia.idNoticia,Comentario.conteudo FROM Noticia,Comentario WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = ?");
		$stmt->execute(array($contentId));		
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	function getNumberOfContentComments($contentId) {
		global $conn;
		$stmt = $conn->prepare("SELECT COUNT(*) FROM Comentario,Noticia WHERE Comentario.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = ?");
		$stmt->execute(array($contentId));		
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}

	function getContentLikes($contentId) {
		global $conn;
		$stmt = $conn->prepare("SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) AS likes FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia AND Noticia.idNoticia = ? GROUP BY Noticia.idNoticia");
		$stmt->execute(array($contentId));		
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}

	function getAllCommentLikes() {
		global $conn;
		$stmt = $conn->prepare("SELECT Comentario.idComentario, SUM (AvaliarComentario.avaliacao) FROM AvaliarComentario,Comentario,Noticia WHERE AvaliarComentario.idComentario = Comentario.idComentario AND Comentario.idNoticia = Noticia.idNoticia  GROUP BY Comentario.idComentario ORDER BY idComentario ASC");
		$stmt->execute();		
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}

	function getUserContent($username) {
		global $conn;
		$stmt = $conn->prepare("SELECT Noticia.titulo, Noticia.conteudo FROM Noticia,Editor WHERE Noticia.username = Editor.username AND Editor.username LIKE ?");
		$stmt->execute(array($username));
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	function rateContent($contentId,$rate,$username) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("SELECT AvaliarNoticia.avaliacao FROM AvaliarNoticia WHERE AvaliarNoticia.idNoticia = ? AND AvaliarNoticia.username = ?");
		if (!$stmt->execute(array($contentId,$username))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("UPDATE AvaliarNoticia SET avaliacao = ? WHERE AvaliarNoticia.idNoticia = ? AND AvaliarNoticia.username = ?");
		if (!$stmt->execute(array($rate,$contentId,$username))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("INSERT INTO AvaliarNoticia VALUES (DEFAULT, ?, ?, ?)");
		if (!$stmt->execute(array($username,$contentId,$rate))) {
			$conn->rollBack();
			exit;
		}
		return $stmt->commit();
	}

	function rateComment($commentId,$rate,$username) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("SELECT AvaliarComentario.avaliacao FROM AvaliarComentario WHERE AvaliarComentario.idComentario = ? AND AvaliarComentario.username = ?");
		if (!$stmt->execute(array($commentId,$username))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("UPDATE AvaliarComentario SET avaliacao = ? WHERE AvaliarComentario.idComentario = ? AND AvaliarComentario.username = ?");
		if (!$stmt->execute(array($rate,$commentId,$username))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("INSERT INTO AvaliarComentario VALUES (DEFAULT, ?, ?, ?)");
		if(!$stmt->execute(array($username,$commentId,$rate))) {
			$conn->rollBack();
			exit;
		}
		return $stmt->commit();
	}

	function getContentByUsername($username) {
		global $conn;
		$stmt = $conn->prepare("SELECT * FROM Noticia WHERE Noticia.username = ?");
		$stmt->execute(array($username));
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	function getContentById($contentId) {
		global $conn;
		$stmt = $conn->prepare("SELECT * FROM Noticia WHERE Noticia.idNoticia = ?");
		$stmt->execute(array($contentId));
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}

	function editComment($username,$commentId,$content) {
		global $conn;
		$stmt = $conn->prepare("SELECT Comentario.idComentario FROM Comentario, Noticia WHERE Comentario.username LIKE ? AND Comentario.idNoticia = Noticia.idNoticia");
		if(!$stmt->execute(array($username))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("UPDATE Comentario SET conteudo = ? WHERE idComentario = ?");
		if(!$stmt->execute(array($content,$commentId))) {
			$conn->rollBack();
			exit;
		}
		return $stmt->commit();
	}

	function getAllContentLikes() {
		global $conn;
		$stmt = $conn->prepare("SELECT Noticia.idNoticia, SUM (AvaliarNoticia.avaliacao) AS likes FROM AvaliarNoticia,Noticia WHERE AvaliarNoticia.idNoticia = Noticia.idNoticia GROUP BY Noticia.idNoticia ORDER BY likes DESC");
		$stmt->execute();
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	function getContentLinks($contentId) {
		global $conn;
		$stmt = $conn->prepare("SELECT Noticia.idNoticia, Link.homeLink FROM Noticia,Link,LinkNoticia WHERE Noticia.idNoticia = LinkNoticia.idNoticia AND LinkNoticia.href = Link.href AND Noticia.idNoticia = ?");
		$stmt->execute(array($contentId));
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	function editContent($contentId,$title,$content,$deletedLinks,$addedLinks) {
		global $conn;
		$conn->beginTransaction();
		$stmt = $conn->prepare("SELECT Noticia.idNoticia FROM Noticia WHERE Noticia.idNoticia = ?");
		if (!$stmt->execute(array($contentId))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("UPDATE Noticia SET titulo = ? WHERE idNoticia = ?");
		if (!$stmt->execute(array($title,$contentId))) {
			$conn->rollBack();
			exit;
		}

		$stmt = $conn->prepare("UPDATE Noticia SET conteudo = ? WHERE idNoticia = ?");
		if (!$stmt->execute(array($content,$contentId))) {
			$conn->rollBack();
			exit;
		}

		foreach($deletedLinks as $link) {
			$stmt = $conn->prepare("DELETE FROM LinkNoticia WHERE Noticia.idNoticia = ? AND href LIKE ?");
			if (!$stmt->execute(array($contentId,$link['href']))) {
				$conn->rollBack();
				exit;
			}
		}

		foreach($addedLinks as $link) {
			$stmt = $conn->prepare("SELECT Link.href FROM Link WHERE Link.href = ?");
			$stmt->execute(array($link['href']));
			if ($stmt->fetch(PDO::FETCH_ASSOC) != NULL) {
				$stmt = $conn->prepare("INSERT INTO LinkNoticia VALUES (?, ?);");
				if (!$stmt->execute(array($contentId,$link['href']))) {
					$conn->rollBack();
					exit;
				}
			} else {
				$stmt = $conn->prepare("INSERT INTO Link VALUES (?, ?)");
				if (!$stmt->execute(array($link['href'],$link['homeLink']))) {
					$conn->rollBack();
					exit;
				}

				$stmt = $conn->prepare("INSERT INTO LinkNoticia VALUES (?, ?);");
				if (!$stmt->execute(array($contentId,$link['href']))) {
					$conn->rollBack();
					exit;
				}
			}
		}

		return $stmt->commit();
	}
?>