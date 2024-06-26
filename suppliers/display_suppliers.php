<?php
require '../config.php';

// Fetch recently added suppliers from the database
$sql = "SELECT * FROM Suppliers ORDER BY SupplierID DESC LIMIT 5"; // Change the limit according to your requirement
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["SupplierID"] . "</td>";
        echo "<td>" . $row["SupplierName"] . "</td>";
        echo "<td>" . $row["PhoneNumber"] . "</td>";
        echo "<td>" . $row["Address"] . "</td>";
        echo "</tr>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>
