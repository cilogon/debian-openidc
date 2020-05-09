<html><head><title>HTTP Header Variables</title></head><body>
<table>
<?php
ksort($_SERVER);
foreach ($_SERVER as $key => $value) {
        echo "<tr><td>$key</td><td>$value</td></tr>\n";
}
?>
</table>
</body></html>
