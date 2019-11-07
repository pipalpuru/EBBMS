<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>Home</title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<body>
<div class="container bgimage">
    <div class="container">
        <g:uploadForm controller="event" action="addevent" method="post"
                      enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-1">
                </div>

                <div class="col-sm-5">
                    <label> Event Name:</label> <br/>
                    <input type="text" name="name" value="" required> <br/> <br/>

                    <label> Location:</label> <br/>
                    <input type="text" name="location" value="" required> <br/> <br/>
                    <label> Organizer:</label> <br/>
                    <input type="text" name="organizer" value="" required> <br/> <br/>
                    <label> Date:</label> <br/>
                    <input type="date" name="date" value="" required> <br/> <br/>
                </div>

                <div class="col-sm-6">
                    <input type="file" name="eventimage" accept="image/*" onchange="loadFile2(event)">
                    <script>
                        var loadFile2 = function (event) {
                            var output2 = document.getElementById('output2');
                            output2.src = URL.createObjectURL(event.target.files[0]);
                        };
                    </script>
                    <img src="" alt=" " id="output2" style="max-width: 100%" height="400px">
                    <br/>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-5" align="right">
                    <button type="submit" class="btn btn-success">Add</button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>
</body>
</html>