<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    $firstName = $_POST['first_name'];
    $lastName = $_POST['last_name'];
    $user = $_POST['username'];
    $location = $_POST['local'];
    $email = $_POST['email'];
    $work = $_POST['work'];
    $pic = $BASE_URL . 'images/assets/default.png';

    $name = $firstName . " " . $lastName;

    if (!isset($user) || !isset($name) || !isset($location) || !isset($work) || !isset($email)) {

        $_SESSION['error_messages'][] = 'All fields are mandatory';
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
        exit;
    }

    $inter = array();
    $i = 0;
    if ($_POST['sports']) {
        $inter[$i++] = 'sports';
    }
    if ($_POST['cinema']) {
        $inter[$i++] = 'cinema';
    }
    if ($_POST['news']) {
        $inter[$i++] = 'news';
    }
    if ($_POST['gastronomy']) {
        $inter[$i++] = 'gastronomy';
    }
    if ($_POST['football']) {
        $inter[$i++] = 'football';
    }
    if ($_POST['literature']) {
        $inter[$i++] = 'literature';
    }
    if ($_POST['agriculture']) {
        $inter[$i++] = 'agriculture';
    }
    if ($_POST['politics']) {
        $inter[$i++] = 'politics';
    }
    if ($_POST['sex']) {
        $inter[$i++] = 'sex';
    }
    if ($_POST['video-games']) {
        $inter[$i++] = 'video-games';
    }
    if ($_POST['meteorology']) {
        $inter[$i++] = 'meteorology';
    }
    if ($_POST['motor sports']) {
        $inter[$i++] = 'motor sports';
    }
    if ($_POST['culture']) {
        $inter[$i++] = 'culture';
    }

    $allowedExts = array("jpeg", "jpg", "png");
    $temp = explode(".", $_FILES["file"]["name"]);
    $extension = end($temp);

    if ($_FILES["file"]["name"] != "") {
        if ((($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/jpg") || ($_FILES["file"]["type"] == "image/pjpeg") || ($_FILES["file"]["type"] == "image/x-png") || ($_FILES["file"]["type"] == "image/png")) && ($_FILES["file"]["size"] < 100000) && in_array($extension, $allowedExts)) {
            if ($_FILES["file"]["error"] > 0) {
                $_SESSION['error_messages'][] = "Error uploading image";
                $_SESSION['form_values'] = $_POST;
                header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
                exit;
            } else {
                move_uploaded_file($_FILES["file"]["tmp_name"], $BASE_DIR . "images/" . $user);
                chmod($BASE_DIR . "images/" . $user, 0755);
                $pic = $BASE_URL . "images/" . $user;
            }
        } else {
            $_SESSION['error_messages'][] = "Error uploading image: Invalid file";
            $_SESSION['form_values'] = $_POST;
            header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
            exit;
        }
    }

    try {
        $result = editUser($user, $location, $work, $inter, $email, $name, $pic);
    } catch (PDOException $ex) {
        logError($ex->getMessage());
        $_SESSION['error_messages'][] = 'Error editing profile';
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
        exit;
    }
    if ($result != false) {
        $_SESSION['success_messages'][] = 'User edited successfully';
        header('Location: ' . $BASE_URL . 'pages/users/profile.php?username=' . $user);
        exit;
    } else {
        $_SESSION['form_values'] = $_POST;
        header("Location: $BASE_URL" . 'pages/users/edit_profile.php');
        exit;
    }

    //TODO HANDLE EXCEPTIONS