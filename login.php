<?php
include 'config.php';

if(isset($_POST['entrar'])) {
    $cpf = $_POST['cpf'];
    $senha = $_POST['senha'];

    $query = "SELECT * FROM paciente WHERE cpf=:cpf";
    $stmt = $config->prepare($query);
    $stmt->bindValue(':cpf', $cpf);
    $stmt->execute();

    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if($usuario){
        if(password_verify($senha, $usuario['Senha'])){
            header('Location: index.php');
        } else {
            echo "Senha inválida!";
        }
    } else {
        echo "CPF inválido!";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form method="post" action="login.php">
        <label>CPF:</label>
        <input type="text" name="cpf" required>
        <br>
        <label>Senha:</label>
        <input type="password" name="senha" required>
        <br>
        <input type="submit" name="entrar" value="Entrar">
    </form>
	<div class="ancora">
 <a href="cadastro.php" class="cadastro">Não possui uma conta? Cadastre-se!</a>
 <br/>
 <a href="index.php" class="index">Voltar</a>
	</div>
</body>
</html>