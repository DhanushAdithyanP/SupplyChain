<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Products-SCM</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="../main/nav_style.css">
</head>
<body>
<div class="content-wrapper">
<?php
    include("../main/nav.html")
    ?>
    <div class="add_suppliers">
    <form action="../suppliers/add_suppliers.php" method="post">
        <label for="supplier_id">Supplier ID:</label><br>
        <input type="number" id="supplier_id" name="supplier_id" required><br><br>
        <label for="supplier_name">Supplier Name:</label><br>
        <input type="text" id="supplier_name" name="supplier_name" required><br><br>

        <label for="contact_name">Contact Name:</label><br>
        <input type="text" id="contact_name" name="contact_name"><br><br>

        <label for="contact_email">Contact Email:</label><br>
        <input type="text" id="contact_email" name="contact_email"><br><br>

        <label for="phone_number">Phone Number:</label><br>
        <input type="text" id="phone_number" name="phone_number"><br><br>

        <label for="address">Address:</label><br>
        <textarea id="address" name="address"></textarea><br><br>

        <input type="submit" value="Submit">
    </form>
    </div>


</div>
</body>
</html>