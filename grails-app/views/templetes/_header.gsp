    <div class="sticky-top" style="background-color: #1d2124">
        <nav class="navbar navbar-expand-sm div-back">
            <button class="navbar-toggler btn-outline-dark" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li>
                        <a class="nav-link" href="${createLink(controller: "home", action: "home")}">
                            <button type="button" class="btn btn-outline-dark"
                                    style="border: none; outline: none";> <i class="fas fa-home"> </i> Home </button>
                        </a>
                    </li>
                    <sec:ifLoggedIn>
                        <li>
                            <a class="nav-link" href="${createLink(controller: "adminPanel", action: "index2")}">
                                <button type="button" class="btn btn-outline-dark"
                                        style="border: none; outline: none"> <i class="fas fa-user-edit"> </i> Add Doner </button>
                            </a>
                        </li>
                    </sec:ifLoggedIn>


                    <sec:ifNotLoggedIn>
                        <li>
                            <a class="nav-link" href="/login">
                                <button type="button" style="border: none; outline: none"
                                        class="btn btn-outline-dark"> <i class="fas fa-sign-in-alt"></i> Log In </button> </a>
                        </li>
                    </sec:ifNotLoggedIn>

                    <sec:ifNotLoggedIn>
                        <li>
                            <a class="nav-link" href="${createLink(controller: "beDoner", action: "index")}">
                                <button type="button" class="btn btn-outline-dark"
                                        style="border: none; outline: none"> <i class="fas fa-user-plus"></i> Be Doner </button>
                            </a>
                        </li>
                    </sec:ifNotLoggedIn>

                    <sec:ifLoggedIn>
                        <li>
                            <a class="nav-link" href="/logoff">
                                <button type="button" style="border: none; outline: none"
                                        class="btn btn-outline-dark"> <i class="fas fa-sign-out-alt"></i> Log Out </button>
                            </a>
                        </li>
                    </sec:ifLoggedIn>

                    <sec:ifLoggedIn>
                        <li>
                            <a class="nav-link" href="${createLink(controller: "adminPanel", action: "donerList")}">
                                <button type="button" style="border: none; outline: none"
                                        class="btn btn-outline-dark"> <i class="fas fa-edit"></i> View Doner Info </button>
                            </a>
                        </li>
                    </sec:ifLoggedIn>

                    <li>
                        <a class="nav-link" href="${createLink(controller: "home", action: "about")}">
                            <button type="button" style="border: none; outline: none"
                                    class="btn btn-outline-dark"> <i class="fas fa-question-circle"></i> About  </button>
                        </a>
                    </li>

                    <li>
                        <a class="nav-link" href="${createLink(controller: "hospitaladmin", action: "index")}">
                            <button type="button" style="border: none; outline: none"
                                    class="btn btn-outline-dark"> <i class="fas fa-key"></i> Hospital Login  </button>
                        </a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit"> <i class="fas fa-search-plus"></i> Search </button>
                </form>
            </div>
        </nav>
    </div>


        <div class="row">
            <div class="col-sm-5">
                <div class="card-body">
                    <h1 class="card-title"> EBBMS </h1>
                    <h5 class="card-text"> Online Blood Bank Management System </h5>
                </div>
            </div>

            <div class="col-sm-7">
                <asset:image src="header3.png" style="width: 100%; height: 150px"/>
            </div>
        </div>
     <br/>

