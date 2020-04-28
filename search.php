<?php
session_start();
include 'header.php';
$conn = mysqli_connect("localhost", "root", "", "rncp");
$requestsearch = "SELECT * FROM article WHERE categorie LIKE '%$_SESSION[recherche]%' OR title LIKE '%$_SESSION[recherche]%'";
// echo $requestsearch;
$query = mysqli_query($conn, $requestsearch);
$row =  mysqli_fetch_all($query);
// var_dump($row);
$i = 0;
while ($i < count($row)) {
    echo '<div id="fix_search"></div> <div class="allarticles"><div class="articles">
        <a href="article.php?id=' . $row[$i][2] . '">
        <img class="imgarticles" src="images/' . $row[$i][2] . '.jpg"></a>

        </div></div>';
    $i = $i + 1;
}
