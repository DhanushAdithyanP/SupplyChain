<?php
require '../config.php';

// Check if form data is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $supplier_id = $_POST['supplier_id'];
    $supplier_name = $_POST['supplier_name'];
    $contact_name = $_POST['contact_name'];
    $contact_email = $_POST['contact_email'];
    $phone_number = $_POST['phone_number'];
    $address = $_POST['address'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail, PhoneNumber, Address) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("isssss", $supplier_id, $supplier_name, $contact_name, $contact_email, $phone_number, $address);

    // Execute the statement and check for errors
    if ($stmt->execute()) {
        header("Location: ../home/home.php");
        exit();
        echo "<script>alert('New record created successfully');</script>";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
} else {
    echo "Invalid request method.";
}
?>
