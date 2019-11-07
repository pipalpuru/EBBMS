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
                <div class="col-md-12">
                    <h1> Make Post </h1>
                    <g:uploadForm controller="admin" action="updatePost" method="Post">
                        <div>
                            <label> Title :</label> <br/>
                            <input type="text" name="title" value="${edit?.title}" required>
                        </div> <br/>


                        <div>
                            <label> Status </label> <br/>
                            <g:textArea name="description"  rows="25" cols="110" value="${edit?.description}"/>
                        </div> <br/>


                        <div class="card" style="width: 40rem;">
                                <img class="card-img-top" id="output2"
                                     src="${createLink(controller: "admin", action: "displayEditImage", params: [id: edit?.imageId])}"
                                     style="width: 100%" height="100%">
                        </div>

                        <div>
                            <label> Select Image </label>
                            <p> Image Should be choosen </p>
                            <input type="file" name="blogImage" value="" accept="image/*" onchange="loadFile2(event)">
                            <script>
                                var loadFile2 = function(event) {
                                    var output2 = document.getElementById('output2');
                                    output2.src = URL.createObjectURL(event.target.files[0]);
                                };
                            </script>
                        </div> <br/>


                        <div>
                                <button class="btn btn-primary" type="submit"> Save </button>
                        </div>


                        <input type="hidden" name="id" value="${edit?.id}"> <br/>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</body>
</html>