<nav id="sidebar" class="sticky-top" style="height: 650px">
    <div class="sidebar-header">
        <h2>UMS</h2>
        <h5>User Management Syatem</h5>
    </div>

    <ul class="list-unstyled components">
        <li class="active">
            <a class="nav-link" href="${createLink(controller: "home", action: "home")}">
                <i class="fas fa-home"></i> Home</a>
        </li>

        <sec:ifNotLoggedIn>
            <li>
                <a class="nav-link" href="/login">
                    <i class="fas fa-user-plus"></i> Log In</a>
            </li>

            <li>
                <a class="nav-link" href="${createLink(controller: "beDoner", action: "index")}">
                    <i class="fas fa-user-plus"></i> Create Account</a>
            </li>
        </sec:ifNotLoggedIn>


        <sec:ifLoggedIn>
            <li>
                <a class="nav-link" href="/logoff">
                    <i class="fas fa-user-plus"></i> Log Out</a>
            </li>

                <li>
                    <a href="${createLink(controller: "inventory", action: "inventory")}">
                        <i class="fas fa-warehouse"></i> User List</a>
                </li>
                <li>
                    <a class="nav-link" href="${createLink(controller: "profileView", action: "index")}">
                        <i class="fas fa-user"></i> View Profile </button>
                    </a>
                </li>
        </sec:ifLoggedIn>
    </ul>
</nav>