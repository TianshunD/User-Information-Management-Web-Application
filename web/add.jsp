<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add User</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <center><h3>Add User Page</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">Name: </label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Tianshun Deng">
        </div>

        <div class="form-group">
            <label>Gender: </label>
            <input type="radio" name="gender" value="Male" checked="checked" style="margin-left: 10px"/>Male
            <input type="radio" name="gender" value="Female" style="margin-left: 5px"/>Female
        </div>

        <div class="form-group">
            <label for="age">Age: </label>
            <input type="text" class="form-control" id="age" name="age" placeholder="22">
        </div>

        <div class="form-group">
            <label for="address">Address: </label>
            <select name="address" class="form-control" id="address">
                <option value="IL">IL</option>
                <option value="LA">LA</option>
                <option value="NY">NY</option>
                <option value="TX">TX</option>
                <option value="CA">CA</option>
            </select>
        </div>

        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" name="qq" placeholder="1049297994" id="qq"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" placeholder="1049297994@qq.com" id="email"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="Submit" />
            <input class="btn btn-default" type="reset" value="Reset" />
            <input class="btn btn-default" type="button" value="Return" onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/findUserByPageServlet'"/>
        </div>
    </form>
</div>
</body>
</html>
