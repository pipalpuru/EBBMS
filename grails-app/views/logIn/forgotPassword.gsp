<!DOCTYPE html>
<head>
    <meta name="layout" content="wecare/headerfooter"/>
    <title>Hospital Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<hr>

<div class="container">
    <div class="row">
        <div class="col-sm-3">
        </div>

        <div class="col-sm-9" style="align-content: center">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3><i class="fa fa-lock fa-4x"></i></h3>

                                <h2 class="text-center">Forgot Password?</h2>

                                <p>You can reset your password here.</p>

                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i
                                                    class="glyphicon glyphicon-envelope color-blue"></i>
                                            </span>
                                            <input id="number" class="form-control"
                                                   placeholder=" enter your mobile number" type="text" autocomplete="off" required=""/>
                                            <br/><br/>
                                            <button class="btn btn-lg btn-primary btn-block"
                                                    type="button" id="findEmail" onclick="findEmail()">Find Your Number</button>
                                        </div>
                                    </div>
                                    <br/>

                                    <div class="form-group" id="passwordDiv" hidden>
                                        <div class="input-group">
                                            <input id="password" class="form-control"  type="password" autocomplete="off" required/>
                                        </div>
                                        <br/>
                                        <input id="password2" class="form-control" type="password" autocomplete="off"  required/>
                                        <input id="id"  type="text" hidden/>
                                        <br/>  <br/>
                                        <button class="btn btn-lg btn-primary btn-block"
                                                type="submit" id="changePassword"  onclick="changePassword()">Change Password</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function findEmail() {
        var number = $("#number").val();
        var formData = new FormData();
        formData.append("number", number);
        $.ajax(
            {
                type: 'POST',
                url: '${createLink(controller: "beDoner", action: "emailVerify")}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                    if(data.message == "user found"){
                        $("#passwordDiv").removeAttr("hidden");
                        $("#id").val(data.user);
                    }else{
                        alert("User Not Found !!!");
                    }
                }
            }
        );
    }

    function changePassword() {
        var password1 = $("#password").val();
        var password2 = $("#password2").val();
        var id = $("#id").val();
        if(password1 === password2){
            var formData = new FormData();
            formData.append("newPassword", password1);
            formData.append("id", id);
            $.ajax(
                {
                    type: 'POST',
                    url: '${createLink(controller: "beDoner", action: "forgotPassword")}',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        console.log(data);
                        if(data.message == "password changed"){
                           alert("Password Changed Successfully !!!");
                           window.location.reload();
                        }else{
                            alert("User Not Found !!!");
                        }
                    }
                }
            );
        }else{
            alert("Password Don't Match !!!");
        }

    }
</script>
