<!DOCTYPE html>
<head>
    <meta name="layout" content="wecare/headerfooter"/>
    <title> Hospital Login </title>
</head>

<body>
<div class="container h-100 bgimage">
    <br/><br/><br/><br/><br/>
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container" align="center">
                    <img src="https://image.flaticon.com/icons/png/512/295/295128.png"
                         class="brand_logo" alt="Logo" style="height: 100px; width: 20%">
                </div>
            </div>
            <br/>
        <div class="d-flex justify-content-center form_container">
            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                <div class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="username" class="form-control input_user" value="" placeholder="username">
                </div>
                <div class="input-group mb-2">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control input_pass" value="" placeholder="password">
                </div>

                <div class="d-flex justify-content-center mt-3 login_container">
                    <button type="submit" name="button" class="btn btn-primary"> Login </button>
                </div>
            </Form>
        </div>
            <div class="mt-4">
                <div class="d-flex justify-content-center links">
                    <a href="${createLink(controller: 'beDoner', action: 'index2')}"
                            style="color: #00d5ff"> Forgot your password? </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
