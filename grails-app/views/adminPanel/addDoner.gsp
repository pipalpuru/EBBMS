<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title> Home </title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>
<body>
<div class="container">
    <div class="container">
        <g:uploadForm controller="adminPanel" action="addDoner" method="post">
            <div class="row">
                <div class="col-sm-5">
                    <label> Full Name:</label> <br/>
                    <input type="text" name="name" value="" required> <br/> <br/>
                    <label> Email:</label> <br/>
                    <input type="email" name="email" value="" required> <br/> <br/>
                    <label> Address:</label> <br/>
                    <input type="text" name="address" value="" required> <br/> <br/>
                    <label> Phone:</label> <br/>
                    <input type="text" name="phone" value="" required> <br/> <br/>
                    <label> Expery Date:</label> <br/>
                    <input type="date" name="takendate" value="" required> <br/> <br/>
                </div>

                <div class="col-sm-5">
                    <label> Blood Group :</label> <br/>
                    <select name="bloodgroup">
                        <option value="A+" > A+ </option>
                        <option value="A-" > A- </option>
                        <option value="B+" > B+ </option>
                        <option value="B-" > B+ </option>
                        <option value="AB+" > AB+ </option>
                        <option value="AB-" > AB- </option>
                        <option value="O+" > O+ </option>
                        <option value="O-" > O- </option>
                    </select> <br/> <br/>
                    <label> Gender:</label> <br/>
                    <input type="text" name="gender" value="" required> <br/> <br/>
                    <label> Age:</label> <br/>
                    <input type="text" name="age" value="" required> <br/> <br/>
                    <label> Taken Date:</label> <br/>
                    <input type="date" name="takendate" value="" required> <br/> <br/>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-8" align="right">
                    <button type="submit" class="btn btn-success"> Save </button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>
</body>
</html>