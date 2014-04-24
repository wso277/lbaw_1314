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

function getUserByLocal($local)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Editor WHERE localidade LIKE ?");
    $stmt->execute(array($local));
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getUserByWork($work)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Editor WHERE profissao LIKE ?");
    $stmt->execute(array($work));
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function login($username, $pass)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Editor WHERE username LIKE ? AND pass LIKE ?");
    $stmt->execute(array($username, $pass));
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($user != FALSE) {
        return $user;
    } else {
        return false;
    }
}

function updatePassword($username, $pass) {
    global $conn;
    $conn->beginTransaction();
    $stmt = $conn->prepare("UPDATE Editor SET password = ? WHERE username LIKE ?");
    $stmt->execute(array($pass, $username));
    $result = $stmt->fetch();
    if ($result == false) {
        $conn->rollBack();
        return false;
    }

    return true;
}

function updatePhoto($username, $photo) {
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

function editUser($username, $localidade, $prof, $interesses, $email, $name)
{
    global $conn;
    $conn->beginTransaction();
    $stmt = $conn->prepare("UPDATE Editor SET localidade = '".$localidade."' , profissao = '".$prof . "' , email = '".$email ."' , nome = '".$name."' WHERE username LIKE '" . $username . "'");
    $result = $stmt->execute();
    if ($result == FALSE) {
        $conn->rollBack();
        return false;
    }
    $stmt = $conn->prepare("DELETE FROM Interesse WHERE username LIKE ?");
    $result = $stmt->execute(array($username));

    if ($result == FALSE) {
        $conn->rollBack();
        return false;
    }
    foreach ($interesses as $key => $interesse) {
        $stmt = $conn->prepare("INSERT INTO Interesse VALUES(?,?)");
        $result = $stmt->execute(array($username, $interesse));

        if ($result == FALSE) {
            $conn->rollBack();
            return false;
        }
    }
    $conn->commit();
    return true;
}

function addFriend($user1, $user2) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Amizade VALUES(?,?)");
    $stmt->execute(array($user1, $user2));
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($result != FALSE) {
        return $result;
    } else {
        return false;
    }
}

function removeUser($user1, $user2) {
    global $conn;
    $stmt = $conn->prepare("DELETE FROM Interesse WHERE amigo1 LIKE ? AND amigo2 LIKE ?");
    $stmt->execute(array($user1, $user2));
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($result != FALSE) {
        return $result;
    } else {
        return false;
    }
}

function sendMessage($sender, $receiver, $title, $body) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Mensagem VALUES(DEFAULT,?,?,?,?)");
    $stmt->execute(array($sender, $receiver, $title, $body));
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($result != FALSE) {
        return $result;
    } else {
        return false;
    }
}

function getSentMessages($username) {
    global $conn;
    $stmt = $conn->prepare("SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor = ? AND Mensagem.recetor != ? AND Editor.username LIKE ?");
    $stmt->execute(array($username, $username, $username));
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getReceivedMessages($username) {
    global $conn;
    $stmt = $conn->prepare("SELECT Editor.nome, Editor.username, Mensagem.titulo, Mensagem.conteudo FROM Editor,Mensagem WHERE Mensagem.emissor != ? AND Mensagem.recetor = ? AND Editor.username LIKE ?");
    $stmt->execute(array($username, $username, $username));
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function banUser($username) {
    global $conn;
    $stmt = $conn->prepare("UPDATE Editor SET estado_user = ? WHERE username LIKE ?");
    return stmt->execute(array("ban",$username));
}

function banUserTemp($username) {
    global $conn;
    $stmt = $conn->prepare("UPDATE Editor SET estado_user = ? WHERE username LIKE ?");
    return stmt->execute(array("bantemp",$username));
}

function promoteUser($username) {
    global $conn;
    $stmt = $conn->prepare("UPDATE Editor SET tipo_user = ? WHERE username LIKE ?");
    return stmt->execute(array("moderador",$username));
}

function dispromoteUser($username) {
    global $conn;
    $stmt = $conn->prepare("UPDATE Editor SET tipo_user = ? WHERE username LIKE ?");
    return stmt->execute(array("editor",$username));
}

