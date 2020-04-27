<?php
session_start();
include 'header.php';
$conn = mysqli_connect("localhost", "root", "", "rncp");
$request = "SELECT * FROM article ORDER BY date";
$query = mysqli_query($conn, $request);
$row = mysqli_fetch_all($query);
$requestmoy = "SELECT title, MAX(moy) FROM rating_average";
$querymoy = mysqli_query($conn, $requestmoy);
$rowmoy = mysqli_fetch_all($querymoy);
$requestartmoy = "SELECT * FROM article WHERE title ='" . $rowmoy[0][0] . "' ";
$queryartmoy = mysqli_query($conn, $requestartmoy);
$moyart = mysqli_fetch_all($queryartmoy);
if (isset($_GET["buyok"])) {
?>
    <div class="thx">
        <p>Merci pour vôtre achat</p>
        <form action="" method="POST">
            <input class="button1" type="submit" value="Retour" name="submit_thx">
        </form>
    </div>
<?php
    if (isset($_POST["submit_thx"])) {
        header("location:index.php");
    }
    die;
}
?>
<h1 class="titleindex">Nos articles phares</h1>
<section class="gridIndex">
    <article id="newEst" class="gridJeux">
        <div class="leftArea flex">
            <!-- Image du jeu -->
            <?php echo '<img class="indexImgJeux" src="images/' . $row[0][2] . '.jpg">' ?>
        </div>
        <div class="rightArea flexc">
            <h2 class="H2index">Le plus récent</h2>
            <!-- Descriptif du jeu -->
            <h2 class="H2index"><?php echo $row[0][2]; ?></h2>
            <p class="description"><?php echo $row[0][3]; ?></p>
            <?php echo '<a href="article.php?id=' . $row[0][2] . ' ">voir plus</a>'; ?>
        </div>
    </article>
    <article id="bestRank" class="gridJeux">
        <div class="leftArea flex">
            <!-- Image du jeu -->
            <?php echo '<img class="indexImgJeux" src="images/' . $moyart[0][2] . '.jpg">' ?>
        </div>
        <div class="rightArea flexc">
            <h2 class="H2index">Le mieux noté</h2>
            <!-- Descriptif du jeu -->
            <h2 class="H2index"><?php echo $moyart[0][2]; ?></h2>
            <p class="description"><?php echo $moyart[0][3]; ?></p>
            <?php echo '<a href="article.php?id=' . $row[0][2] . ' ">voir plus</a>'; ?>
        </div>
    </article>
</section>

<?php
include("footer.php");
?>