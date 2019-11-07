<html>
<head>
    <title> Edit/Delete </title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 align="center">  Doner List </h1>
            <table width="100%" border="2px">
                <tr align="center">
                    <th> SN </th>
                    <th> Full Name </th>
                    <th> Address </th>
                    <th> Phone </th>
                    <th> Blood Group </th>
                    <th> Email </th>
                    <th> Age </th>
                    <th> Gender </th>
                </tr>

                <g:each in="${donerlist}" var="dl" status="i">
                    <tr>
                        <td align="center"> ${i + 1}</td>
                        <td align="center"> ${dl?.name}</td>
                        <td align="center"> ${dl?.address}</td>
                        <td align="center"> ${dl?.phone}</td>
                        <td align="center"> ${dl?.bloodgroup}</td>
                        <td align="center"> ${dl?.email}</td>
                        <td align="center"> ${dl?.age}</td>
                        <td align="center"> ${dl?.gender}</td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>
</body>
</html>