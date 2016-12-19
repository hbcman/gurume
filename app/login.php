<?php

//さっき変更した場合はこちらも変更する
$salt = "mwefCMEP28DjwdW3lwdS239vVS";

//セッション開始
session_start();

$mysqli = new mysqli('localhost', 'itlbe', 'itlbeshindai', 'itlbe');

$status = "none";

//セッションにセットされていたらログイン済み
if(isset($_SESSION["username"]))
  $status = "logged_in";
else if(!empty($_POST["username"]) && !empty($_POST["password"])){
  //ユーザ名、パスワードが一致する行を探す
  $password = md5($_POST["password"] . $salt);
  $stmt = $mysqli->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
  $stmt->bind_param('ss', $_POST["username"], $password);
  $stmt->execute();

  //結果を保存
  $stmt->store_result();
  //結果の行数が1だったら成功
  if($stmt->num_rows == 1){
    $status = "ok";
    //セッションにユーザ名を保存
    $_SESSION["username"] = $_POST["username"];
  }else
    $status = "failed";
}

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ログイン</title>
  </head>
  <body>
    <h1>ログイン</h1>
    <?php if($status == "logged_in"): ?>
      <p>ログイン済み</p>
      </a href="logout.php>ログアウトする</a>
    <?php elseif($status == "ok"): ?>
      <p>ログイン成功</p>
      <a href="logout.php">ログアウト</a>
    <?php elseif($status == "failed"): ?>
      <p>ログイン失敗</p>
      <a href="register.php">新規登録する？</a>
    <?php else: ?>
      <form method="POST" action="login.php">
        ユーザ名：<input type="text" name="username" />
        パスワード：<input type="password" name="password" />
        <input type="submit" value="ログイン" />
      <a href="register.php">新規登録する？</a>
      </form>
    <?php endif; ?>
  </body>
</html>
