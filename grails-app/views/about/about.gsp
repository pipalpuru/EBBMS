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
                <g:checkBox name="myCheckbox" value="${true}" /> <br> <br>
                <g:currencySelect name="myCurrency" value="${currency}" /> <br> <br>
                DATE OF BIRTH <br> <br>
                <g:datePicker name="myDate" value="${new Date()}"
                              precision="day" years="${1930..2000}"/> <br>
                <g:external dir="css" file="main.css" />
                Output: <link href="/../assets/stylesheets/bgimage.css" type="text/css"
                              rel="stylesheet" media="screen, projector"/> <br> <br>
                <g:field type="number" name="isbn" min="10" max="20" required="" value="0"/> <br> <br>
                <g:field type="password" name ="password"/> <br> <br>
                <g:field type="url" name="url"/> <br> <br>
                <plugin:isAvailable name="spring-security-core">
                    You have Spring Security installed!
                </plugin:isAvailable> <br> <br>
                <g:join in="['Grails', 'Groovy', 'Gradle', 'abc']" delimiter="_"/>
                <g:radio name="myGroup" value="1"/>
                <g:radio name="myGroup" value="2" checked="true"/>
                <g:timeZoneSelect name="myTimeZone" />


            </div>
        </div>
    </body>
</html>

