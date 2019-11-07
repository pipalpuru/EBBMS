<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>Home</title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<body>
<div class="row">
    <div class="col-sm-1">
    </div>

    <div class="col-sm-11">
        <div class="container">
            <table class="table" width="100%" border="2px">
                <tr align="center" class="thead-dark">
                    <th> SN</th>
                    <th> Full Name </th>
                    <th> Address</th>
                    <th> Phone</th>
                    <th> Blood Group</th>
                    <th> Email</th>
                    <th> Age</th>
                    <th> Gender</th>
                    <th> Exp. Date Rem.</th>
                </tr>
                <g:each in="${list}" var="data2" status="i">
                    <tr>
                        <td scope="row" align="center">${i + 1} </td>
                        <td scope="row" align="center">${data2?.name} </td>
                        <td align="center">${data2?.address} </td>
                        <td align="center">${data2?.phone} </td>
                        <td align="center">${data2?.bloodgroup} </td>
                        <td align="center">${data2?.email} </td>
                        <td align="center">${data2?.age} </td>
                        <td align="center">${data2?.gender} </td>
                        <td align="center">${data2?.expDate} </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>
</body>
</html>