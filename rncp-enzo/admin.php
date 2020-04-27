<?php
session_start();
$conn = mysqli_connect("localhost", "root", "", "rncp");
include 'header.php';
?>
<div id="alignAdmin" class="flexc">
    <?php
    if ($_SESSION['rang'] == 'admin') {
        echo '<h2 class="adminH2">Bonjour admin</h2></br>';
        echo '<div id="nav_admin" class="selectioncategorie">';
    ?>

        <a href='#admin_utilisateurs'>
            <h2>Utilisateurs</h2>
        </a>
        <a href='#admin_commande'>
            <h2>Commandes</h2>
        </a>
        <a href='#admin_stock'>
            <h2>Stock</h2>
        </a>
        <a href='#admin_article'>
            <h2>Articles</h2>
        </a>
        <?php

        echo '</div>';

        echo '<section id="admin_utilisateurs" class="adminBox"><h2 class="adminH2">liste des utilisateurs</h2></br>';
        $requestadmin = 'SELECT * FROM utilisateurs';
        $sqlad = mysqli_query($conn, $requestadmin);
        $row4 = mysqli_fetch_all($sqlad);

        $i = 0;
        while ($i < count($row4)) {
            echo "<div class='flexr justsb'>";
            echo "<div>";
            echo '<p>' . $row4[$i][1] . '</p><br>'; //login
            echo '<p>' . $row4[$i][4] . '</p><br>'; //email
            echo '<p>' . $row4[$i][3] . '</p><br>'; //adresse
            echo "</div>";
        ?>
            <div>
                <form action="" method="post">
                    <button class="button" type="submit" name="<?php echo $row4[$i][1]; ?>">supprimer utilisateur</button>
                </form>
                <?php
                if (isset($_POST[$row4[$i][1]])) {
                    $sql = "DELETE FROM utilisateurs WHERE id =" . $row4[$i][0];
                    $sqlremove = mysqli_query($conn, $sql);
                    header("location:admin.php");
                }
                ?>
            </div>
</div>
<hr>
<br>
<?php
            $i = $i + 1;
        }
?>
</section>

<?php
        echo '<section id="admin_commande" class="adminBox"><h2 class="adminH2">liste des commandes</h2></br>';
        echo '<hr>';
        $comandesadmin = 'SELECT * FROM commande ';
        $sqlad2 = mysqli_query($conn, $comandesadmin);
        $row5 = mysqli_fetch_all($sqlad2);
        //affichage des commandes
        $i = 0;
        while ($i < count($row5)) {
            echo '</br><p>Nom : ';
            echo $row5[$i][2]; //nom
            echo '</p></br><p>Date : ';
            echo $row5[$i][5]; //date
            echo '</p></br><p> Descriptif de la commande : <br><br>';
            echo $row5[$i][4]; //desciption commande
            echo '</p><p>total :';
            echo $row5[$i][3] . " €"; //total
            echo '</p></br><hr>';
            $i = $i + 1;
        }
        echo '</section>';

        echo '<section id="admin_stock" class="adminBox"><h2 class="adminH2">gestion des stock et des prix</h2>';
        $requestadmin3 = 'SELECT * FROM article';
        $sqlad3 = mysqli_query($conn, $requestadmin3);
        $row6 = mysqli_fetch_all($sqlad3);
        foreach ($row6 as $key => $value) {
            echo '<section class ="gameTile"><h2 class="adminH2">' . $value[2] . '</h2>';
?>
    <form action="profil.php" method="POST" class="flexr">
        <div class="flexc mr1rem">
            <label for='prix'>prix</label>
            <input class="nbrSelect" type="number" name="prix" value='<?php echo $value[4] ?>'>
        </div>
        <div class="flexc">
            <label for='qtt'>quantité stock</label>
            <input class="nbrSelect" type="number" name="qtt" value='<?php echo $value[5] ?>'>
        </div>
        <input class="button1" type="submit" name='<?php echo $value[0] ?>'>
    </form>
    </section>
<?php
            if (isset($_POST[$value[0]])) {
                $modifarticle = "UPDATE article SET price='$_POST[prix]', qtt='$_POST[qtt]' WHERE id = $value[0]";
                $modifquery = mysqli_query($conn, $modifarticle);
            }
        }
        echo '</section>';
        echo "<section id='admin_article' class='adminBox'><h2 class='adminH2'>Modification d'article</h2></br>";
?>
<section class="gameTile">
    <p>modifier un article</p>
    <form action="" method="POST">
        <div class="flexr">
            <select class="select" name='option'>
                <option value='0'>Choissisez un jeu</option>
                <?php
                foreach ($row6 as $key => $value) {
                    echo '<option name="' . $value[2] . '" value="' . $value[2] . '">' . $value[2] . '</option>';
                }
                ?>
            </select>
            <input class="button1" type="submit" name='select_value'>
        </div>
    </form>
</section>
<?php
        if (isset($_POST["select_value"])) {
            $dataquery = "SELECT * FROM article WHERE title = '$_POST[option]'";
            $execdataquery = mysqli_query($conn, $dataquery);
            $fetchquery = mysqli_fetch_assoc($execdataquery);
?>

    <form class="gameTile" action="" method="post" class="flexc form_admin" enctype="multipart/form-data">
        <h2 class='adminH2'>Titre</h2>
        <input class="input" type="text" name="up_titre" value='<?php echo $fetchquery['title'] ?>'>
        <h2 class='adminH2'>Catégorie</h2>
        <input class="input" type="text" name="up_categorie" value='<?php echo $fetchquery['categorie'] ?>'>
        <h2 class='adminH2'>Prix</h2>
        <input class="nbrSelect" type="number" name="up_prix" value='<?php echo $fetchquery['price'] ?>'>
        <h2 class='adminH2'>Stock</h2>
        <input class="nbrSelect" type="number" name="up_qtt" value='<?php echo $fetchquery['qtt'] ?>'>
        <h2 class='adminH2'>Description</h2>
        <textarea class="textarea2" name="up_textarea"><?php echo $fetchquery['description'] ?></textarea>
        <h2 class='adminH2'>Image</h2>
        <p>Pour une bonne intégration, n'utilisez uniquement des image en 1920*1080</p>
        <input type="file" name="upInputFile" accept="image/png, image/jpeg">
        <br>
        <input class="button1" type="submit" name='up_art'>
    </form>

<?php
        } // fin affichage form
        if (isset($_POST["up_art"])) {
            $upGameName = $_POST["up_titre"];
            if (strlen($_FILES["upInputFile"]["name"]) != 0) {
                $imgPath = "images/" . basename($_FILES["upInputFile"]["name"]);
                $imgType = strtolower(pathinfo($imgPath, PATHINFO_EXTENSION));
                $newName = "images/" . $upGameName . "." . $imgType;
                $_SESSION["uploadOk"] = 1;
                if ($imgType != "jpg" && $imgType != "png" && $imgType != "jpeg") {
                    echo "Désoler, seulement les fichier JPG, JPEG, PNG accepter.";
                    $_SESSION["uploadOk"] = 0;
                }
                if ($_SESSION["uploadOk"] == 1) {
                    if (file_exists($newName)) {
                        unlink($newName);
                        echo "image remplacée";
                    }
                    move_uploaded_file($_FILES["upInputFile"]["tmp_name"], $imgPath);
                    rename($imgPath, $newName);
                    unset($_SESSION["uploadOk"]);
                } else {
                    echo "Image non insérer";
                    unset($_SESSION["uploadOk"]);
                }
            }
            $conq = htmlspecialchars($_POST["up_textarea"], ENT_QUOTES);
            $updatequery = "UPDATE article SET categorie = '$_POST[up_categorie]', title = '$_POST[up_titre]', description = '$conq', price = '$_POST[up_prix]', qtt = '$_POST[up_qtt]' WHERE title = '$_POST[up_titre]'";
            var_dump($updatequery);
            // die;
            $execupdatequery = mysqli_query($conn, $updatequery);
        }
?>
<br>
<hr>
<br>
<h2 class='adminH2'>Creation d'article</h2>
<form class="gameTile2" action="" method="POST" class="flexc form_admin">
    <h2 class='adminH2'>Titre</h2>
    <input class="input" type="text" name="new_titre">
    <h2 class='adminH2'>Catégorie</h2>
    <input class="input" type="text" name="new_categorie">
    <h2 class='adminH2'>Prix</h2>
    <input class="nbrSelect" type="number" name="new_prix">
    <h2 class='adminH2'>Stock</h2>
    <input class="nbrSelect" type="number" name="new_qtt">
    <h2 class='adminH2'>Description</h2>
    <textarea class="textarea2" name="new_textarea">description</textarea>
    <h2 class='adminH2'>Image</h2>
    <br>
    <input type="file" name="new_inputFile" accept="image/png, image/jpeg">
    <input class="button1" type="submit" name='new_art'>
</form>
<?php
        if (isset($_POST['new_art'])) {
            $newGameName = $_POST["new_titre"];
            if (strlen($_FILES["new_inputFile"]["name"]) != 0) {
                $imgPath = "images/" . basename($_FILES["new_inputFile"]["name"]);
                $imgType = strtolower(pathinfo($imgPath, PATHINFO_EXTENSION));
                $newName = "images/" . $newGameName . "." . $imgType;
                $_SESSION["uploadOk"] = 1;
                if ($imgType != "jpg") {
                    echo "Désoler, seulement les fichier JPG accepter.";
                    $_SESSION["uploadOk"] = 0;
                }
                if ($_SESSION["uploadOk"] == 1) {
                    if (file_exists($newName)) {
                        unlink($newName);
                    }
                    move_uploaded_file($_FILES["new_inputFile"]["tmp_name"], $imgPath);
                    rename($imgPath, $newName);
                    unset($_SESSION["uploadOk"]);
                } else {
                    echo "Image non insérer";
                    unset($_SESSION["uploadOk"]);
                }
            }
            $newarticle = "INSERT INTO article VALUES (NULL,'$_POST[new_categorie]','$_POST[new_titre]','$_POST[new_textarea]',$_POST[new_prix],$_POST[new_qtt],date)";
            $sqlad5 = mysqli_query($conn, $newarticle);
        }
    }
?>
</div>
<?php
include("footer.php");
?>