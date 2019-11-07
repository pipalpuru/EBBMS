<%--
  Created by IntelliJ IDEA.
  User: Ram
  Date: 10/25/2019
  Time: 11:59 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="wecare/headerfooter"/>

</head>

<body>
<div class="container">
    <div class="row" style="margin-top: 200px">
        <div class="col-sm-4">
        </div>

        <div class="col-sm-8">
            <g:form controller="beDoner" action="changePassword" method="POST">
                <div class="row">
                    <label>New Password</label>
                    <input type="password" name="password1" id="txtNewPassword" placeholder="password"/>
                </div>

                <div class="row">
                    <label>Conform Password</label>
                    <input type="password" name="password2" id="txtConfirmPassword" onChange="checkPasswordMatch();"
                           placeholder="conform password"/>
                </div>

                <div class="row">
                    <div class="registrationFormAlert" id="divCheckPasswordMatch">
                    </div>
                </div>

                <div class="row" align="right">
                    <input type="hidden" name="email" value="${params?.email}"/>
                    <input type="submit">
                </div>
            </g:form>
        </div>
    </div>
    <script>
        function checkPasswordMatch() {
            var password = $("#txtNewPassword").val();
            var confirmPassword = $("#txtConfirmPassword").val();

            if (password != confirmPassword)
                $("#divCheckPasswordMatch").html("Passwords do not match!");
            else
                $("#divCheckPasswordMatch").html("Passwords match.");
        }

        $(document).ready(function () {
            $("#txtConfirmPassword").keyup(checkPasswordMatch);
        });

    </script>
</div>
</body>
</html>