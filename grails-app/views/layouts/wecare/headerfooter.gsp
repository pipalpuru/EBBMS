<!doctype html>
<html lang="en" class="no-js">
<head>
    <asset:stylesheet src="/css/image.css"/>
    <asset:stylesheet src="/css/socialMedia.css"/>
    <asset:stylesheet src="/css/profileView.css"/>
    <asset:stylesheet src="/css/bootstrap.min.css.map"/>
    <asset:stylesheet src="/css/signup.css"/>
    <asset:stylesheet src="/style.css"/>
    <asset:stylesheet src="/bgimage.css"/>
    <asset:stylesheet src="fontawesome-free-5.7.2-web/css/all.css"/>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <asset:javascript src="/js/bootstrap.min.js"/>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <g:layoutHead/>
</head>
<body style="background-color: #FFFFFF">
<div class="row">
    <div class="col-md-2">
        %{--<g:render template="/templetes/header"/>--}%
        <g:render template="/templetes/header2"/>
    </div>

    <div class="col-md-10">
        <g:layoutBody/>
    </div>
</div>

<div class="row">
    <g:render template="/templetes/footer"/>
</div>
</body>
</html>
