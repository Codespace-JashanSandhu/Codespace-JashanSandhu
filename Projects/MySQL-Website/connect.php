<?php
// Creating variables to receive data from index.html via POST method.
$username = $_POST['username'];
$password = $_POST['password'];

// Attempting to  connect to database.

$server_name='localhost';
$data_user='root';
$data_password='';
$data_name='users';

$conn=mysqli_connect($server_name, $data_user, $data_password,$data_name);

// Warns if conenction failed.
if(!$conn){
    die('Connection Failed: ' .mysqli_connect_error());
}

// If conenction is successful
else{

    // Inserting data.
    $sql_query = "INSERT INTO credentials (username, password) VALUES ('$username','$password')";
    if (mysqli_query($conn, $sql_query)){
        echo "Regitered Successfully..!";
    }
    // If error occurs while inserting data.
    else{
        echo "Error occured: " . $sql . "" . mysqli_error($conn); 
    }
    // Connection closed.
    mysqli_close($conn);
}

?>