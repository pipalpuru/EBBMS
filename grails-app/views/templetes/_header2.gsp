<nav id="sidebar" class="sticky-top" style="height: 650px">
    <div class="sidebar-header">
        <h2>EBBMS</h2>
        <h5>E-Blood Bank Management Syatem</h5>
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
                    <i class="fas fa-user-plus"></i> Be Doner</a>
            </li>
        </sec:ifNotLoggedIn>


        <sec:ifLoggedIn>
            <li>
                <a class="nav-link" href="/logoff">
                    <i class="fas fa-user-plus"></i> Log Out</a>
            </li>

            <sec:ifAllGranted roles='ROLE_ADMIN'>
                <li>
                    <a href="${createLink(controller: "inventory", action: "inventory")}">
                        <i class="fas fa-warehouse"></i> Inventory</a>
                </li>

                <li>
                    <a href="${createLink(controller: "event", action: "index")}">
                        <i class="fas fa-calendar-alt"></i> Add Event</a>
                </li>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>


        <sec:ifLoggedIn>
            <li>
                <a href="${createLink(controller: "event", action: "showevent")}">
                    <i class="fas fa-calendar-alt"></i> Show Event</a>
            </li>

            <sec:ifAllGranted roles='ROLE_USER'>
                <li>
                    <a class="nav-link" href="${createLink(controller: "profileView", action: "index")}">
                        <i class="fas fa-user"></i> View Profile </button>
                    </a>
                </li>

                <li>
                    <a href="${createLink(controller: "inventory", action: "inventory")}">
                        <i class="fas fa-warehouse"></i> Doner List</a>
                </li>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>

        <li>
            <a href="${createLink(controller: "about", action: "index")}">
                <i class="fas fa-warehouse"></i> About System </a>
        </li>

        <li>
            <a href="${createLink(controller: 'contact', action: 'index')}">
                <i class="fas fa-phone-square"></i> Contact</a>
        </li>
    </ul>

    <ul class="list-unstyled CTAs">
    <li>
        <sec:ifLoggedIn>
            <li>
                <a class="nav-link" href="/logoff">
                    <i class="fas fa-sign-out-alt"></i> Log Out </button>
                </a>
            </li>
        </sec:ifLoggedIn>


        <sec:ifNotLoggedIn>
            <li>
                <a class="nav-link" href="/login">
                    <i class="fas fa-sign-in-alt"></i> Admin| Log In</a>
            </li>
        </sec:ifNotLoggedIn>
    </ul>
</nav>