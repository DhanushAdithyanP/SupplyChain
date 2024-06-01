<?php
// Start the session
session_start();

// Database configuration
$servername = "localhost";
$dbname = "scm";
$dbusername = "root";
$dbpassword = "";

// Create connection
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prevent SQL injection
    $username = stripslashes($username);
    $password = stripslashes($password);
    $username = mysqli_real_escape_string($conn, $username);
    $password = mysqli_real_escape_string($conn, $password);

    // Create the SQL query
    $sql = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    $result = $conn->query($sql);

    // Check if a matching record is found
    if ($result->num_rows > 0) {
        // User found, set the session variables
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header("Location: home/home.php");
        exit();
    } else {
        // User not found
        echo "Invalid username or password.";
    }
}

// Close the connection
$conn->close();
?>
