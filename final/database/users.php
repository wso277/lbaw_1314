<?php

    function createUser($name, $username, $local, $work, $email, $pass, $pic)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO Editor VALUES(?,?,?,?,?,?,?,?,?)");
        $result = $stmt->execute(array($username, $name, $local, $pass, $email, $work, $pic, "editor", "normal"));

        return $result;
    }

    function getUserByUsername($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Editor WHERE username LIKE ?");
        $stmt->execute(array($username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function searchUserByUsername($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Editor WHERE UPPER(username) LIKE ?");
        $stmt->execute(array($username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function getuserPhoto($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT fotografia FROM Editor WHERE username LIKE ?");
        $stmt->execute(array($username));

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function getUserByLocal($local)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Editor WHERE UPPER(localidade) LIKE ?");
        $stmt->execute(array($local));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function getUserByWork($work)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Editor WHERE UPPER(profissao) LIKE ?");
        $stmt->execute(array($work));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function getInterests($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Interesse WHERE username LIKE ?");
        $stmt->execute(array($username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function login($username, $pass)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Editor WHERE username LIKE ? AND pass LIKE ?");
        $stmt->execute(array($username, $pass));
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user != false) {
            return $user;
        } else {
            return false;
        }
    }

    function updatePassword($username, $pass)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET pass = ? WHERE username LIKE ?");

        return $stmt->execute(array($pass, $username));
    }

    function updatePhoto($username, $photo)
    {
        global $conn;
        $conn->beginTransaction();
        $stmt = $conn->prepare("UPDATE Editor SET fotografia = ? WHERE username LIKE ?");
        $stmt->execute(array($photo, $username));
        $result = $stmt->fetch();
        if ($result == false) {
            $conn->rollBack();

            return false;
        }

        return true;
    }

    function editUser($username, $localidade, $prof, $interesses, $email, $name, $pic)
    {
        global $conn;
        $conn->beginTransaction();
        $stmt = $conn->prepare("UPDATE Editor SET localidade = '" . $localidade . "' , profissao = '" . $prof . "' , email = '" . $email . "' , nome = '" . $name . "' , fotografia = '" . $pic . "' WHERE username LIKE '" . $username . "'");
        $result = $stmt->execute();
        if ($result == false) {
            $conn->rollBack();

            return false;
        }
        $stmt = $conn->prepare("DELETE FROM Interesse WHERE username LIKE ?");
        $result = $stmt->execute(array($username));

        if ($result == false) {
            $conn->rollBack();

            return false;
        }
        foreach ($interesses as $key => $interesse) {
            $stmt = $conn->prepare("INSERT INTO Interesse VALUES(?,?)");
            $result = $stmt->execute(array($username, $interesse));

            if ($result == false) {
                $conn->rollBack();

                return false;
            }
        }
        $conn->commit();

        return true;
    }

    function addFriend($user1, $user2)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO Amizade VALUES(?,?)");

        return $stmt->execute(array($user1, $user2));
    }

    function removeFriend($user1, $user2)
    {
        global $conn;
        $stmt = $conn->prepare("DELETE FROM Amizade WHERE amigo1 LIKE ? AND amigo2 LIKE ?");

        return $stmt->execute(array($user1, $user2));
    }

    function sendMessage($sender, $receiver, $title, $body)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO Mensagem VALUES(DEFAULT,?,?,?,?)");

        return $stmt->execute(array($sender, $receiver, $title, $body));
    }

    function getSentMessages($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT Mensagem.idMensagem, Mensagem.recetor, Mensagem.titulo FROM Mensagem WHERE Mensagem.emissor = ? AND Mensagem.recetor != ? ORDER BY Mensagem.idMensagem DESC");
        $stmt->execute(array($username, $username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function getReceivedMessages($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT Mensagem.idMensagem, Mensagem.titulo FROM Mensagem WHERE Mensagem.emissor != ? AND Mensagem.recetor = ? ORDER BY Mensagem.idMensagem DESC");
        $stmt->execute(array($username, $username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    function getMessage($id)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT Mensagem.recetor, Mensagem.emissor, Mensagem.titulo, Mensagem.conteudo FROM Mensagem WHERE Mensagem.idMensagem = ?");
        $stmt->execute(array($id));

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    function deleteMessage($idMensagem)
    {
        global $conn;
        $stmt = $conn->prepare("DELETE FROM Mensagem WHERE idMensagem = ?");

        return $stmt->execute(array($idMensagem));
    }

    function banUser($username)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET estado_user = ? WHERE username LIKE ?");

        return $stmt->execute(array("ban", $username));
    }

    function banUserTemp($username)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET estado_user = ? WHERE username LIKE ?");

        return $stmt->execute(array("bantemp", $username));
    }

    function unbanUser($username)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET estado_user = ? WHERE username LIKE ?");

        return $stmt->execute(array("normal", $username));
    }

    function promoteUser($username)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET tipo_user = ? WHERE username LIKE ?");

        return $stmt->execute(array("moderador", $username));
    }

    function demoteUser($username)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE Editor SET tipo_user = ? WHERE username LIKE ?");

        return $stmt->execute(array("editor", $username));
    }

    function getFriends($username)
    {
        global $conn;
        $stmt = $conn->prepare("SELECT e1.username AS amigo1,e2.username AS amigo2 FROM Editor e1, Editor e2, Amizade WHERE e1.username = Amizade.amigo1 AND Amizade.amigo2 = e2.username AND (e1.username LIKE ? OR e2.username LIKE ?)");
        $stmt->execute(array($username, $username));

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }