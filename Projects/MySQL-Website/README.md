# Connecting MySQL with website using PHP.

**Front end**
-----------------------------------------------------------------------------

- Website with a form to enter data.
- A submit button to send this data to the web server for further processing.

**Back end**
-----------------------------------------------------------------------------

- MySQL server up and running.
- A new database with a table in it.
- Table with proper number of columns.

**Getting started**
==============================================================================

## Installing XAMPP to host website and MySQL ##

1. Go to the browser and download the latest version of XAMPP.

2. Install it on your PC. Start Apache and MySQL.

3. Go to the browser and type `http://localhost`. It should bring you to the startup page of Apache server. You should be able to see the phpMyadmin portal now.

4. Click on *phpMyadmin* and you'll see the database portal.

5. Now create a *New Database* with a suitable name and a *table* with any number of columns.

6. We'll be inserting the data into these columns. So name those columns accordingly. For instance, `column1` - *username*  and `column2` - *password*.

7. Now, it's time to create a relatively simple webpage to receive data.

8. You can use the following code -

```html
<!DOCTYPE html>
<html>
    <head>
        <title>User Registeration</title>
        <link rel="stylesheet" href="bootstrap.css">
    </head>
    <body>
        <div class="container">
            <div class="row col-md-6 col-md-offset-3">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">
                        <h1>User Registeration</h1>
                    </div>
                    <div class="panel-body">
                        <form action="connect.php" method="post">
                            <div class="form-group">
                                <label for="username">User Name</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="text" class="form-control" id="password" name="password" required>
                            </div>
                            <input type="submit" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
``` 
```You'll find bootstarp.css in this repository.```

