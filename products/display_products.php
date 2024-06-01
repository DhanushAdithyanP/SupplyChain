<?php
require '../config.php';

// Fetch recently added suppliers from the database
$sql = "SELECT * FROM Products ORDER BY ProductID DESC LIMIT 5"; // Change the limit according to your requirement
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["ProductID"] . "</td>";
        echo "<td>" . $row["ProductName"] . "</td>";
        echo "<td>" . $row["SupplierID"] . "</td>";
        echo "<td>" . $row["StockQuantity"] . "</td>";
        echo "</tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>
