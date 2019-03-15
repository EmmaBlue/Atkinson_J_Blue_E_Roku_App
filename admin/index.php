<?php

require_once('../admin/scripts/config.php');

if (isset($_GET['media'])) {
    $type = $_GET['media'];

    if ($type == "video") {
        $tbl = "tbl_movies";
        $tbl3 = 'tbl_mov_era';
        $col = 'movies_id';
        $ratingcol = 'movies_rating';
    }
    else if ($type == "television") {
        $tbl = "tbl_tv";
        $tbl3 = 'tbl_tv_era';
        $col = 'tv_id';
        $ratingcol = 'tv_rating';

    } else {
        $tbl = "tbl_audio";
        $tbl3 = 'tbl_audio_era';
        $col = 'audio_id';
        $ratingcol = 'audio_rating';
    }
}

if(isset($_GET['filter']) && isset($_GET['kid'])){

    $tbl2 = 'tbl_era';
    $col2 = 'era_id';
    $col3 = 'era_name';
    $filter = $_GET['filter'];
    $rating = $_GET['kid'];

    $results = filterResultsKid($tbl, $tbl2, $tbl3, $col, $col2, $col3, $filter, $ratingcol, $rating);

    echo json_encode($results);

}

else if (isset($_GET['kid']) && !isset($_GET['filter'])) {

    $rating = $_GET['kid'];
    $results = getAllKid($tbl, $ratingcol, $rating);
    echo json_encode($results);
}

else if(isset($_GET['filter']) && !isset($_GET['kid'])){

         $tbl2 = 'tbl_era';
         $col2 = 'era_id';
         $col3 = 'era_name';
         $filter = $_GET['filter'];

    $results = filterResults($tbl, $tbl2, $tbl3, $col, $col2, $col3, $filter);

    echo json_encode($results);

}

else {

    $results = getAll($tbl);

    echo json_encode($results);
}
?>