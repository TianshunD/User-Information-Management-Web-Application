<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Manager Login</title>

    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function refreshCode() {
            //refresh verify img
            var vcode = document.getElementById("vcode");
            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time=" + new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">Manager Login</h3>
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <div class="form-group">
            <label for="username">Username: </label>
            <input type="text" name="username" class="form-control" id="username" placeholder="Insert your username"/>
        </div>

        <div class="form-group">
            <label for="password">Password: </label>
            <input type="password" name="password" class="form-control" id="password" placeholder="Insert your password"/>
        </div>

        <div class="form-inline">
            <label for="verifycode">Verify code: </label>
            <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="Insert verify code" style="width: 120px;"/>
            <a href="javascript:refreshCode()"><img style="margin-left: 10px; border-radius: 5px" src="${pageContext.request.contextPath}/checkCodeServlet" title="Click to refresh" id="vcode"/></a>
        </div>
        <hr/>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn btn-primary" type="submit" value="Login">
        </div>
    </form>

    <!-- Alert wrong input info -->
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" >
            <span>&times;</span></button>
        <strong>${error_msg}</strong>
    </div>
</div>
</body>
</html>