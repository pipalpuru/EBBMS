<html>
<head>
    <title> Edit/Delete </title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 align="center">  Post List </h1>
            <table width="100%" border="2px">
                <tr align="center">
                    <th> SN </th>
                    <th> Title </th>
                    <th> Image </th>
                    <th> Description </th>
                    <th> Created Date </th>
                    <th> Action </th>
                </tr>

                <g:each in="${postByUser}" var="post" status="i">
                    <tr>
                        <td align="center">${i + 1}</td>
                        <td>${post?.title}</td>
                        <td align="center" size="">
                            <img src="${createLink(controller: "dashboard", action: "displayBlogImage", params: [id: post?.imageId])}"
                                 height="40%", width="70%"/>
                        </td>
                        <td align="justify">${post?.description?.toString()?.substring(0, post?.description?.toString()?.toString()?.length() > 150 ? 150 : post?.description?.toString()?.length())}</td>
                        <td> <g:formatDate format="yyyy-MM-dd" date="${post?.createdDate}"/> </td>
                        <td align="center">
                            <a href="${createLink(controller: "admin", action: "edit", params: [id:post?.id])}">
                                <button style="color: #1c19">EDIT</button>
                            </a>
                            <br/> <br/>
                            <a href="${createLink(controller: "admin", action: "delete", params: [id:post?.id])}">
                                <button style="color: #ff0c15" :
                                        onclick="return confirm('Are you sure you want to delete this item?');">DELETE</button>
                            </a>
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>
</body>
</html>