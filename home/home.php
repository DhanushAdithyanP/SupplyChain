<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="../main/nav_style.css">
</head>
<body>
<div class="content-wrapper">
<?php
    include("../main/nav.html")
    ?>
    <main>
    <div class="recent_order">
         <table>
            <tr>
            <th>Supplier ID</th>
            <th>Supplier Name</th>
            <th>Phone Number</th>
            <th>Address</th>
            </tr>
             <?php include '../suppliers/display_suppliers.php'; ?>
         </table>
    </div>
    <div class="recent_products">
         <table>
            <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Supplier ID</th>
            <th>Stock Quantity</th>
            </tr>
             <?php include '../products/display_products.php'; ?>
         </table>
    </div>
    </main>


</div>
</body>
</html>