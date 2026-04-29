<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mein erstes PHP Beispiel</title>

    <link rel="stylesheet" href="../css/index.css">
</head>
<body>

    <h1>Mein erstes PHP Beispiel</h1>

    <section>
        <h2>
            <?php
                echo "1. Echo";
            ?>
        </h2>
        <p>
            Dieses Beispiel zeigt, wie HTML und 
            <?php echo "PHP"; ?> 
            zusammenarbeiten.
        </p>
    </section>

</body>
</html>