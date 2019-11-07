<!DOCTYPE html>
<html>
<head>
    <title> Admin Panel </title>
    <meta name="layout" content="wecare/headerfooter"/>

</head>
<body>
<br/>
        <div class="container">
            <div class="row">
                <div class="card">
                    <div class="col-md-10">
                        <g:uploadForm controller="admin" action="save" method="post">
                                <div>
                                    <h1> Make Post </h1>
                                </div>

                                <div>
                                    <label> Title :</label> <br/>
                                    <input type="text" name="title" value="" required>
                                </div> <br/>

                                <div>
                                    <label> Status</label> <br/>
                                    <g:textArea name="description"  rows="20" cols="100"/>
                                </div> <br/>

                                <div class="row">
                                    <div class="col-md-7">
                                        <div>
                                            <label>Select Image</label>
                                            <input type="file" name="blogImage" accept="image/*" onchange="loadFile2(event)">
                                        </div> <br/>

                                        <div>
                                            <button class="btn btn-primary" type="submit"> Save </button>
                                        </div> <br/>
                                    </div>

                                    <div class="col-md-5">
                                        <img class="card-img-top" id="output2">
                                        <script>
                                            var loadFile2 = function(event) {
                                                var output2 = document.getElementById('output2');
                                                output2.src = URL.createObjectURL(event.target.files[0]);
                                            };
                                        </script>
                                    </div>
                                </div>
                        </g:uploadForm>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>