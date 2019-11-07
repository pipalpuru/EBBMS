<!DOCTYPE html>
<html lang="en">
<head>
    <title> Home </title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-6"> <br/> <br/> <br/> <br/> <br/> <br/>
                <div class="row heading">
                    <h4> ${view?.title} </h4>
                </div>

                <div class="row" style="white-space: pre-wrap"; align="justify">
                    <p>New breakthroughs in gene editing will lead to incredible rewards and risks we can barely contemplate. </p>
                </div>

                <div class="row">
                    <div class="col-sm-2">
                        <img class="rounded-circle small"
                             src="${createLink(controller: "postView", action: "displayProfileImage", params: [id: view?.userInfo?.profileImage?.id])}"
                             style="width: 100%" height="100%">
                    </div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="row">
                                    ${view?.userInfo?.name}
                                </div>
                                <div class="row">
                                    <a href="${createLink(controller: "profileView", action: "profileView", params: [id: view?.id])}">
                                        @${view?.userInfo?.username} </a>
                                </div>
                            </div>
                            <div class="col-sm-6">
                               <a href="${createLink(controller: "profileView", action: "profileView", params: [id: view?.id])}">
                                   <button type="button" class="btn btn-success small"> View Profile </button> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <img src="${createLink(controller: "postView", action: "displayBlogImage", params: [id: view?.imageId])}"
                     height="100%", width="100%"/>
            </div>
        </div>
    </div>
    <br/> <br/>

    <div class="container">
        <div class="row">
            <div class="row">
                <div class="fixme">
                    <div class="col-sm-1" align="left">  <br/> <br/> <br/> <br/> <br/> <br/> <br/>
                        <a href="#" class="social social-facebook fab fa-facebook"> </a> <br/>
                        <a href="https://twitter.com/intent/tweet" class="social social-twitter fab fa-twitter"> </a> <br/>
                        <a href="#" class="social social-google fab fa-google"> </a> <br/>
                        <a href="#" class="social social-linkedin fab fa-linkedin"> </a> <br/>
                        <a href="#" class="social social-youtube fab fa-youtube"> </a> <br/>
                        <a href="#" class="social social-instagram fab fa-instagram"> </a> <br/>
                        <a href="#" class="social social-pinterest fab fa-instagram"> </a> <br/>
                    </div>
                </div>

                <script>
                    var fixmeTop = $('.fixme').offset().top;
                    $(window).scroll(function() {
                        var currentScroll = $(window).scrollTop();
                        if (currentScroll >= fixmeTop) {
                            $('.fixme').css({
                                position: 'fixed',
                                top: '0',
                                left: '0'
                            });
                        } else {
                            $('.fixme').css({
                                position: 'static'
                            });
                        }
                    });
                </script>

                <div class="col-sm-8">
                    <p class="card-text" style="white-space: pre-wrap" align="left">${view?.description} </p>
                </div>
            </div>
        </div> <hr color="red">
    </div> <br/>

    <div class="container">
        <div class="row">
            <div class="col-sm-1">
            </div>

            <div class="col-sm-9">
                <h5> Leave Comment </h5>
                <g:form controller="postView" action="saveComment" method="post">
                    <label> Name :</label>
                    <br/>
                    <input type="text" name="commentName" value="${user?.username}" required>
                    <br/>
                    <br/>
                    <label> Comment </label>
                    <br/>
                    <g:textArea name="comment" rows="5" cols="40" style="height: 200px; width: 700px"/>
                    <br/>
                    <input type="hidden" name="postId" value="${view?.id}" />
                    <button class="btn btn-primary" type="submit"> Post </button>
                </g:form>
            </div>
        </div>
    </div> <br/> <br/>

    <div class="container">
        <div class="row">
            <div class="col-sm-1">
            </div>
            <div class="col-sm-8">
                <h3> ${wecare.Comment.countByPostId(view?.id)} Comments </h3>
                <div class="row">
                    <g:each in="${comment}" var="var" status="i">
                        <div class="col-sm-9"> <hr color="blue"/>
                            <div style="width: 100%">
                                <div class="card-body">
                                    <h5 class="card-title"> @${var?.commentName} </h5>
                                    <h6 class="card-text" style="white-space: pre-wrap" align=""> ${var?.comment} </h6>
                                </div>
                            </div> <hr color="blue"/>       <br/> <br/>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
