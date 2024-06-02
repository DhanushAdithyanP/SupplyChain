# Title 

Supply Chain Management System - DBMS Project

# Project Overview 

The Integrated Supply Chain Management System (ISCMS) is a comprehensive web-based application designed to streamline and manage the intricate processes involved in supply chain operations. Developed using HTML, CSS, JavaScript for the frontend, PHP for server-side scripting, and MySQL for database management, this system offers a robust solution for managing suppliers, customers, orders, order details, products, shipments, warehouses, and inventory.

# Technologies used and System Requirements

1. Xampp control panel
2. HTML / CSS
3. JAVASCRIPT
4. MySQL
5. PHP

# Steps to Install and Run the project

# Step 1: Install XAMPP
1. Download XAMPP: Go to the XAMPP website and download the version suitable for your operating system.
2. Install XAMPP: Run the installer and follow the instructions to install XAMPP on your computer.
3. Start XAMPP: Open the XAMPP control panel and start the Apache and MySQL services.

# Step 2: Download the Project from GitHub
1. Clone the repository:
If you have Git installed, open a terminal or command prompt and run:

git clone https://github.com/DhanushAdithyanP/SupplyChain

2. If you don't have Git installed, you can download the ZIP file from the GitHub repository page and extract it.

# Step 3: Set Up the Project Files
Move the project to XAMPP's htdocs directory:
Copy the cloned repository or extracted folder into the htdocs directory inside your XAMPP installation folder (e.g., C:\xampp\htdocs on Windows or /opt/lampp/htdocs on Linux or /Applications/XAMPP on Mac)

# Step 4: Set Up the Database
1. Access phpMyAdmin:
Open a web browser and go to http://localhost/phpmyadmin.

2. Create a new database:
In phpMyAdmin, click on New in the left sidebar.
Enter a name for your database (suggested name 'scm') and click Create.

3. Import the SQL file:
Select the newly created database.
Click on the Import tab.
Click Choose File, select the scm.sql file from your project folder, and click Go

# Step 5: Configure the Project
Update database configuration:
Open the project folder in a code editor (e.g., VSCode, Sublime Text).
Locate the PHP file where the database connection is configured (config.php).
Update the database connection settings to match your local environment: 

<?php
$servername = "localhost";
$username = "root";
$password = ""; // Default XAMPP password is empty
$dbname = "scm"; // The name of the database you created
?>

# Step 6: Run the Project
Access the project in the browser:
Open a web browser and go to http://localhost/SupplyChain. 
In case you have changed the folder name, replace SupplyChain with the name of the folder you copied into htdocs.

# Troubleshooting
1. Port issues: If Apache or MySQL don't start, they might be conflicting with other services. Change the default ports in the XAMPP control panel if necessary.
2. PHP errors: Ensure all necessary PHP extensions are enabled in the php.ini file.
3. Database errors: Double-check your database connection settings and ensure the database is correctly imported.

# Credentials for login
Username: admin
Password: 1234



