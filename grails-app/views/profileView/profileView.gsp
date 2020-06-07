<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-1">
        </div>

        <div class="col-sm-11">
            <div class="row user-detail" align="center">
                <div class="col-sm-4">
                    <div>
                        <img class="rounded-circle profileview"
                             src="${createLink(controller: "profileView", action: "profileImage", params: [id: user?.id])}"
                             style="width: 100%" height="250px">
                        <br>
                    </div>
                </div>

                <div class="col-sm-4 custHeading" align="right">
                </div>
            </div>


            <div class="row">
                <div class="col-sm-6">
                    <h3> Name : ${user?.name}</h3>
                    <h3> Address: ${user?.address}</h3>
                    <h3> Phone: ${user?.phone}</h3>
                    <h3> Email: ${user?.email}</h3>
                    <h3> Age: ${user?.age}</h3>
                    <h3> Gender: ${user?.gender}</h3>
                    <h3> Blood Group: ${user?.bloodgroup}</h3>
                </div>
            </div>
        </div>
    </div>
</div>


%{--<div class="container">--}%
%{--    <div class="row">--}%
%{--        <div class="col-sm-1">--}%
%{--        </div>--}%


%{--        <div class="col-sm-11">--}%
%{--            <button type="button" class="btn btn-primary btn-lg" id="btnClick">--}%
%{--                Action/Notification</button>--}%
%{--            <br/> <br/>--}%

%{--            <div id="1">--}%
%{--                <table class="table" border="2px" style="width: 100%">--}%
%{--                    <tr align="center">--}%
%{--                        <th>Name</th>--}%
%{--                        <th>Phone</th>--}%
%{--                        <th>Address</th>--}%
%{--                        <th>Needed Blood Group</th>--}%
%{--                        <th>Action</th>--}%
%{--                    </tr>--}%
%{--                    <g:each in="${list}" var="var" status="i">--}%
%{--                        <tr align="center">--}%
%{--                            <td><h>${var?.requestFrom?.name}</h></td>--}%
%{--                            <td><h>${var?.requestFrom?.phone}</h></td>--}%
%{--                            <td><h>${var?.requestFrom?.address}</h></td>--}%
%{--                            <td><h>${user?.bloodgroup}</h></td>--}%
%{--                            <td>--}%
%{--                                <a class="btn btn-success"--}%
%{--                                   onclick="return confirm('Do you want to accept this request')"--}%
%{--                                   href="${createLink(controller: "profileView", action: "accept", params: [id: var?.id])}"> Accept </a>--}%

%{--                                <a class="btn btn-danger"--}%
%{--                                   onclick="return confirm('Do you want to accept this request')"--}%
%{--                                   href="${createLink(controller: "profileView", action: "deleteRequest", params: [id: var?.id])}"> Reject </a>--}%
%{--                            </td>--}%
%{--                        </tr>--}%
%{--                    </g:each>--}%
%{--                </table>--}%
%{--            </div>--}%

%{--            <div id="2" style="display: none">--}%
%{--                <table class="table" border="2px" style="width: 100%">--}%
%{--                    <tr align="center">--}%
%{--                        <th>Accepter Name</th>--}%
%{--                        <th>Accepter Phone</th>--}%
%{--                        <th>Accepter Address</th>--}%
%{--                        <th>Action</th>--}%
%{--                    </tr>--}%
%{--                    <g:each in="${action}" var="var" status="i">--}%
%{--                        <tr align="center">--}%
%{--                            <td><h>${var?.acceptBy?.name}</h></td>--}%
%{--                            <td><h>${var?.acceptBy?.phone}</h></td>--}%
%{--                            <td><h>${var?.acceptBy?.address}</h></td>--}%
%{--                            <td>--}%
%{--                                <a class="btn btn-danger"--}%
%{--                                onclick="return confirm('Do you want to accept this request')"--}%
%{--                                href="${createLink(controller: "profileView", action: "deleteAction", params: [id: var?.id])}"> Remove </a>--}%
%{--                            </td>--}%
%{--                        </tr>--}%
%{--                    </g:each>--}%
%{--                </table>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <script>--}%
%{--        $('#btnClick').on('click', function () {--}%
%{--            if ($('#1').css('display') != 'none') {--}%
%{--                $('#2').show().siblings('div').hide();--}%
%{--            } else if ($('#2').css('display') != 'none') {--}%
%{--                $('#1').show().siblings('div').hide();--}%
%{--            }--}%
%{--        });--}%
%{--    </script>--}%
%{--</div>--}%
</body>
</html>
