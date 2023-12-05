<?php
include "config.php";
if(isset($_GET['cpf'])){
  $cpf = $_GET['cpf'];

  $query = "SELECT * FROM paciente WHERE cpf=:cpf";
  $stmt = $config->prepare($query);
  $stmt->bindValue(':cpf', $cpf);
  $stmt->execute();

  $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>
<!-- Formulário de alteração -->
<form method="post" action="">
    Nome: <input type="text" name="nome" value="<?php echo $usuario['Nome']; ?>"><br>
    CPF: <input type="text" name="cpf" value="<?php echo $usuario['CPF']; ?>"><br>
    Telefone: <input type="text" name="telefone" value="<?php echo $usuario['Telefone']; ?>"><br>
    Endereço: <input type="text" name="endereco" value="<?php echo $usuario['Endereco']; ?>"><br>
    Senha: <input type="password" name="senha"><br>
    <input type="submit" name="alterar" value="Alterar">
</form>
<?php
if(isset($_POST['alterar'])){
    $nome = $_POST['nome'];
    $cpf = $_POST['cpf'];
    $telefone = $_POST['telefone'];
    $endereco = $_POST['endereco'];
    $senha = $_POST['senha'];
  
    //Criptografia da senha
    $senhaCriptografada = password_hash($senha, PASSWORD_DEFAULT);
  
    $query = "UPDATE paciente SET Nome=:nome, Telefone=:telefone, Endereco=:endereco, Senha=:senha WHERE cpf=:cpf";
    $stmt = $config->prepare($query);
  
    $stmt->bindValue(':nome', $nome);
    $stmt->bindValue(':cpf', $cpf);
    $stmt->bindValue(':telefone', $telefone);
    $stmt->bindValue(':endereco', $endereco);
    $stmt->bindValue(':senha', $senhaCriptografada);
  
    if($stmt->execute()){
        echo "Informações do usuário atualizadas com sucesso!";
    } else {
        echo "Erro ao atualizar informações do usuário: " . $stmt->errorInfo()[2];
    }
}
?>
<div class="ancora">
 <a href="index.php" class="index">Voltar</a>
	</div>