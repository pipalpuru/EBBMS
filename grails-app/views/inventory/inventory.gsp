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
                    <th>SN</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Blood Group</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Exp. Date Rem.</th>
                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <th>Action</th>
                    </sec:ifAllGranted>
                </tr>
                <g:each in="${list}" var="data2" status="i">
                    <tr>
                        <td scope="row" align="center">${i + 1}</td>
                        <td scope="row" align="center">${data2?.name}</td>
                        <td align="center">${data2?.address}</td>
                        <td align="center">${data2?.phone}</td>
                        <td align="center">${data2?.bloodgroup}</td>
                        <td align="center">${data2?.email}</td>
                        <td align="center">${data2?.age}</td>
                        <td align="center">${data2?.gender}</td>
                        <td align="center">${data2?.expDate}</td>
                        <sec:ifAllGranted roles='ROLE_ADMIN'>
                            <td>
                                <a class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are You Sure Want To Delete This User')"
                                   href="${createLink(controller: "inventory", action: "delete", params: [id: data2?.id])}">Delete</a>
                        </br> </br>
                            <a class="btn btn-warning btn-sm" onclick="viewModel('${data2?.id}')">Edit</a>
                            </td>
                        </sec:ifAllGranted>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>
<script>
    function viewModel(id) {
        $.post(
            "${createLink(controller: "inventory",action: "findAcc")}",
            {
                id: id
            },
            function (data) {
                console.log(data);
                $("#fullName").val(data.fullName);
                $("#address").val(data.address);
                $("#phone").val(data.phone);
                $("#email").val(data.email);
                $("#gender").val(data.gender);
                $("#age").val(data.age);
                $("#id").val(data.id);
                $("#exampleModal").modal();
            }
        );
    }
</script>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <input type="text" class="form-control" id="id" name="id" hidden>

                <form>
                    <div class="form-row">
                        <div class="col">
                            Full Name : <input type="text" class="form-control" id="fullName" name="fullName">
                        </div>

                        <div class="col">
                            Address: <input type="text" class="form-control" id="address" name="address">
                        </div>
                    </div>
                </br>
                    <div class="form-row">
                        <div class="col">
                            Phone: <input type="text" class="form-control" id="phone" name="phone">
                        </div>

                        <div class="col">
                            Age: <input type="text" class="form-control" id="age" name="age" disabled>
                        </div>
                    </div>
                </br>
                    <div class="form-row">
                        <div class="col">
                            Email: <input type="text" class="form-control" id="email" name="email">
                        </div>

                        <div class="col">
                            Gender: <input type="text" class="form-control" id="gender" name="gender">
                        </div>
                    </div>
                </br>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updateUser()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script>
    function updateUser() {
        var id = $("#id").val();
        var fullName = $("#fullName").val();
        var address = $("#address").val();
        var phone = $("#phone").val();
        var age = $("#age").val();
        var email = $("#email").val();
        var gender = $("#gender").val();

        var formData = new FormData();
        formData.append("fullName", fullName);
        formData.append("address", address);
        formData.append("phone", phone);
        formData.append("age", age);
        formData.append("email", email);
        formData.append("gender", gender);
        formData.append("id", id);
        $.ajax(
            {
                type: 'POST',
                url: '${createLink(controller: "inventory", action: "edit")}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (resp) {
                    window.location.reload();
                }
            }
        );

    }
</script>
</body>
</html>