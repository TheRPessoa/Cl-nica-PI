<?php
require 'config.php';

if(isset($_POST['cadastrar'])){
    $nome = $_POST['nome'];
    $cpf = $_POST['cpf'];
    $telefone = $_POST['telefone'];
    $endereco = $_POST['endereco'];
    $senha = $_POST['senha'];

    //Criptografia da senha
    $senhaCriptografada = password_hash($senha, PASSWORD_DEFAULT);

    $sql = "INSERT INTO paciente (Nome, CPF, Telefone, Endereco, Senha) VALUES (:nome, :cpf, :telefone, :endereco, :senha)";

    $stmt = $config->prepare($sql);

    $stmt->bindValue(':nome', $nome);
    $stmt->bindValue(':cpf', $cpf);
    $stmt->bindValue(':telefone', $telefone);
    $stmt->bindValue(':endereco', $endereco);
    $stmt->bindValue(':senha', $senhaCriptografada);

    if($stmt->execute()){
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro ao cadastrar: " . $stmt->errorInfo()[2];
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro</title>
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
    <form method="post" action="cadastro.php">
        <label>Nome:</label>
        <input type="text" name="nome" required>
        <br>
        <label>CPF:</label>
        <input type="text" name="cpf" required>
        <br>
        <label>Telefone:</label>
        <input type="text" name="telefone" required>
        <br>
        <label>Endereço:</label>
        <input type="text" name="endereco" required>
        <br>
        <label>Senha:</label>
        <input type="password" name="senha" required>
        <br>
        <input type="submit" name="cadastrar" value="Cadastrar">
    </form>
	<div class="ancora">
  <a href="login.php" class="login">Login</a>
  <br/>
  <a href="index.php" class="index">Voltar</a>
	</div>
</body>
</html>