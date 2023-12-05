<?php
include "config.php";

if(isset($_GET['cpf'])){
  $cpf = $_GET['cpf'];

  $query = "DELETE FROM paciente WHERE cpf=:cpf";
  $stmt = $config->prepare($query);
  $stmt->bindValue(':cpf', $cpf);

  if($stmt->execute()){
      echo "Usuário excluído com sucesso!";
  } else {
      echo "Erro ao excluir usuário: " . $stmt->errorInfo()[2];
  }
}
?>
<div class="ancora">
 <a href="index.php" class="index">Voltar</a>
	</div>