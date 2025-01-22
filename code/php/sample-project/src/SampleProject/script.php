 
<?php


try {
    require_once 'send.php';
    require_once 'templates.php';
} catch (Exception $e) {
    echo "An error occurred: " . $e->getMessage();
}
exit(0);

?>
