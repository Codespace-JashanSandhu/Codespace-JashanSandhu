<?php
// Creating variables to receive data from login.html via POST method.
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

    // Comparing credentials.
    if ($result = $conn -> query("SELECT * FROM credentials WHERE username='$username' AND password='$password'")) {
        // If the username and password exists/matches with what user provided us, then let them in.
        if($result -> num_rows == 1){
            echo "Welcome ". $username . ", you have successfully logged in.";
        }
        else{
            echo "<script>alert('Invalid credentials!')</script>";
            echo "<script>location.replace('login.html')</script>";  
        }
       // Free result set.
        $result -> free_result();
    }
    // Connection closed.
    mysqli_close($conn);
}
?>