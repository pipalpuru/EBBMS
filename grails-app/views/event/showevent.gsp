<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title>Home</title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<div class="row">
    <div class="col-sm-1">
    </div>

    <div class="col-sm-11">
        <div class="container">
            <h3> ${data7} People Interested</h3>
            <g:each in="${data}" var="data2" status="i">
                <div class="card">
                     <div class="row">
                         <div class="col-sm-8">
                             <img style="height: 230px; width: 100%"
                                  src="${createLink(controller: "event", action: "profileImage", params: [id: data2?.id])}">
                    </div>

                <div class="col-sm-4">
                    <div class="card" style="width:100%; height: auto">
                        <div class="card-body" align="center">
                            <h5 class="card-title">${data2?.name}</h5>
                            <h5><g:formatDate format="yyyy-MM-dd" date="${data2?.date}"/></h5>
                            <h5 class="card-title">${data2?.location}</h5>
                            <h5 class="card-title">${data2?.organizer}</h5>
                                <a href="${createLink(controller: 'event', action: 'eventCounter', params: [id: data2?.id])}"
                                   class="btn btn-primary ">Interested</a>

                        </div>
                    </div>
                </div>
                </div> <br/>
            </g:each>
        </div>
        </div>
    </div>
</div>
</html>