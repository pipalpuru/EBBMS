<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>Home</title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<body>
<div class="container" align="center">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" align="center">
            <div class="carousel-item active">
                <asset:image src="slide2.jpg" alt="First slide"
                             style="width: 95%; height: 630px"/>
            </div>
            <div class="carousel-item">
                <asset:image src="slide3.jpg" alt="Second slide"
                             style="width: 95%; height: 630px"/>
            </div>
            <div class="carousel-item">
                <asset:image src="slide4.png" alt="Third slide"
                             style="width: 95%; height: 630px"/>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div> <br/>

<div class="container-fluid" align="center"
     style="width: 95%;">
    <div class="row">
        <g:each in="${alldoner}" var="data" status="i">
            <div class="col-sm-4">
                <div class="card " style="width: 100%;  height: 600px" align="center">
                    <img src="${createLink(controller: "home", action: "profileImage", params: [id: data?.id])}"
                         style="max-width: 80%" height="200" class="rounded-circle"/>

                    <div class="card-body">
                        <h6 class="card-title">Name: ${data.name}</h6>
                        <h6 class="card-title">Blood Group: ${data.bloodgroup}</h6>
                        <h6 class="card-title">Address: ${data.address}</h6>

                            <sec:ifLoggedIn>

                                <h6 class="card-title">Phone: ${data.phone}</h6>
                            </sec:ifLoggedIn>

                        <h6 class="card-title">Email: ${data.email}</h6>
                        <h6 class="card-title">Age: ${data.age}</h6>
                        <h6 class="card-title">Gender: ${data.gender}</h6>
                        <h6 class="card-title">Last Donation Date:
                        <g:formatDate format="yyyy-MM-dd" date="${data.lastdonateddate}"/> </h6>
                        <h6 class="card-title">Next Donation Date:
                        <g:formatDate format="yyyy-MM-dd" date="${data.nextdnationdate}"/> </h6>
                        %{--<h6> days left ${duration.days} </h6>--}%
                        <sec:ifLoggedIn>
                        <a class="btn btn-danger"
                           onclick="return confirm('Do you want to send blood request')"
                           href="${createLink(controller: "home", action: "request", params: [id: data?.id])}"
                    > Request Blood </a>
                        </sec:ifLoggedIn>

                        <sec:ifNotLoggedIn>
                            <a href="/login" class="btn btn-danger"
                            >Login To Request Blood</a>
                        </sec:ifNotLoggedIn>

                    </div>
                </div> <br/>
            </div>
        </g:each>
    </div>
</div>


</body>
</html>