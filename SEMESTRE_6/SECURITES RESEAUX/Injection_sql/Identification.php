<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Identification</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <div class="container">
        <h1>Identification</h1>
        <form method="POST" name="identif">
            <label for="identif">Identifiant (login):</label>
            <input type="text" name="identif" id="identif" size="30">
            <label for="mdp">Mot de passe:</label>
            <input type="password" name="mdp" id="mdp" size="30">
            <input type="hidden" name="ref" value="identification">
            <input type="submit" name="valider" value="Valider">
        </form>
        <?php
            // traitement du formulaire
            if ($_POST['ref'] == 'identification') {
                // récupération des données du formulaire
                echo "<div class='info'>Traitement du formulaire<br></div>";
                $identif = $_POST['identif'];
                $mdp = $_POST['mdp'];
                // connexion à la base de données
                try {   
                    $con = new PDO('mysql:host=localhost;dbname=ING2', 'Talla', 'Talla');
                    echo "<div class='info'>Connexion au serveur de BD<br></div>";
                    // envoi de la requête
                    $req = "SELECT nom, prenom FROM utilisateurs WHERE login='".$identif."' AND password='".$mdp."';";
                    echo "<div class='info'>Envoi de la requête $req <br></div>";
                    $resultat = $con->query($req);
                    if ($resultat) {
                        $lignes = $resultat->fetchAll();
                        if ($lignes) {
                            echo "<div class='success'><hr>Votre nom est " . $lignes[0]['nom'] . " et votre prénom est " . $lignes[0]['prenom'] . "</div>";
                        } else {
                            echo "<div class='error'>Erreur SQL</div>";
                        }
                            
                    } else {
                        echo "<div class='error'>Erreur BD</div>";
                        $con = null;
                    }
                } catch (PDOException $e) {
                    print "<div class='error'>Erreur de connexion!</div>";
                    die();
                }
            }
        ?>
    </div>
</body>
</html>

<!-- // Préparation de la requête SQL avec des paramètres
            $req = "SELECT nom, prenom FROM utilisateurs WHERE login=:identif AND password=:mdp";
            $stmt = $con->prepare($req);
            // Liaison des paramètres
            $stmt->bindParam(':identif', $identif);
            $stmt->bindParam(':mdp', $mdp);
            // Exécution de la requête préparée
            $stmt->execute();
            
            // Vérification des résultats
            $lignes = $stmt->fetchAll(); -->