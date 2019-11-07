<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <title> Home </title>
    <meta name="layout" content="wecare/headerfooter"/>
</head>

<body>
<br/>
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <g:each in="${adminDomain}" var="ad" status="i">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="row" align="left">
                                           <a style="color: inherit" class="href-hover"
                                                   href="${createLink(controller: "postView", action: "postView", params: [id: ad?.id])}">
                                            <h4> ${ad?.title} </h4> </a>
                                        </div>
                                        <div class="row" align="justify">
                                            <a style="color: inherit; text-decoration: none" class="href-hover"
                                                href="${createLink(controller: "postView", action: "postView", params: [id: ad?.id])}">
                                            <p> ${ad?.description?.toString()?.substring(0, ad?.description?.toString()?.toString()?.length() >
                                                    200 ? 200 : adminDomain?.description?.toString()?.length())} </p> </a>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="${createLink(controller: "profileView", action: "profileView", params: [id: ad?.id])}">
                                                    @${ad?.userInfo?.username} </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <g:formatDate format="yyyy-MM-dd" date="${ad?.createdDate}"/>
                                            </div>
                                            <div class="col-sm-5" align="right" >
                                                <sec:ifLoggedIn>
                                                    <g:if test="${user?.id != ad?.userInfo?.id}">
                                                        <a href="${createLink(controller: "activity", action: "readLater", params: [id: ad?.id])}">
                                                        <button type="button" class="btn-dark btn-sm" onclick="return confirm('Are you sure you want to add read later?');">
                                                        <i class="far fa-bookmark"></i> Read Later </button> </a>
                                                    </g:if>
                                                </sec:ifLoggedIn>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <img src="${createLink(controller: "dashboard", action: "displayBlogImage", params: [id: ad?.imageId])}"
                                             height="100%", width="100%"/>
                                    </div>
                                </div>
                            </div>
                        </div> <hr color="red"> <br/> <br/>
                    </g:each>
                </div>

                <sec:ifLoggedIn>
                <div class="col-sm-4">
                    <div class="row" align="center">
                        <div class="col-sm-12 profile-header">
                            <img src="${createLink(controller: "profileView", action: "displayCoverImage", id: profile?.coverImage?.id)}"
                                 style="width: 100%" height="250px">
                        </div>
                    </div>


                    <div class="row user-detail" align="center">
                        <div class="col-sm-6">
                            <div>
                                <img class="rounded-circle profileview"
                                     src="${createLink(controller: "profileView", action: "displayProfileImage", id: profile?.profileImage?.id)}"
                                     style="width: 100%" height="150px">
                                <br>
                            </div>
                        </div>

                        <div class="col-sm-6 custHeading" align="right">
                            <g:if test="${profile?.username == user?.username}">
                                <a href="${createLink(controller: "profileView", action: "edit", params: [id: ad?.id])}"
                                   class="btn btn-success small sm"> View Profile </a>
                            </g:if>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h5> ${profile?.name} </h5>
                            <a href="#"> @${profile?.username} </a>
                            <p align="justify"> Bootstrap includes dozens of utilities—classes with a single purpose to
                            reduce the frequency of highly repetitive declarations.</p>
                            <div class="row">
                                <div class="col-sm-4">
                                    <p> <i class="fas fa-search-location"></i> ${profile?.location}  </p>
                                </div>

                                <div class="col-sm-4">
                                    <p> <i class="fas fa-birthday-cake"></i>
                                        <g:formatDate format="yyyy-MM-dd" date="${profile?.birthday}"/>
                                </div>

                                <div class="col-sm-4">
                                    <p> <i class="fas fa-calendar-alt"></i>
                                        <g:formatDate format="yyyy-MM-dd" date="${profile?.birthday}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    </sec:ifLoggedIn>
                </div>
            </div>
        </div>
        <br/>
</body>
</html>