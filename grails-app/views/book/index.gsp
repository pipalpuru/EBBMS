<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>
    <body>
        <g:uploadForm id="formId" controller="book" action="save" title="" method="post">
            <div>
                <label class="title">Book Name</label>
                <input type="text" id="bookName" name="bookName"/>
            </div>

            <div>
                <label class="title">Author Email</label>
                <input type="email" id="authorName" name="authorName"/>
            </div>

            <div>
                <input type="submit" id="submit" name="submit" value="Submit">
            </div>
            <div class="message_box" style="margin:10px 0px;">
        </g:uploadForm>
        <script type="text/javascript">
            /* attach a submit handler to the form */
            $("#formId").submit(function (event) {

                /* stop form from submitting normally*/
                event.preventDefault();

                /* get the action attribute from the <form action=""> element */
                var $form = $(this),
                    url = $form.attr('action');

                /* Send the data using post with element id name and name2*/
                var posting = $.post(url, {bookName: $('#bookName').val(), authorName: $('#authorName').val()});

                /* alert the result*/
                posting.done(function (data) {
                    alert('Success');

                });
            });
        </script>
    </body>
</html>