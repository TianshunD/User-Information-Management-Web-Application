<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">Update User Info</h3>
    <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">

        <input type="hidden" name="id" value="${user.id}">

        <div class="form-group">
            <label for="name">Name: </label>
            <input type="text" class="form-control" id="name" name="name"  readonly="readonly" placeholder="${user.name}" />
        </div>

        <div class="form-group">
            <label>Gender: </label>

            <c:if test="${'Male'.equalsIgnoreCase(user.gender)}">
                <input type="radio" name="gender" value="Male" style="margin-left: 10px" checked="checked"/>Male
                <input type="radio" name="gender" value="Female" style="margin-left: 5px"/>Female
            </c:if>

            <c:if test="${'FeMale'.equalsIgnoreCase(user.gender)}">
                <input type="radio" name="gender" value="Male" style="margin-left: 10px"/>Male
                <input type="radio" name="gender" value="Female" style="margin-left: 5px" checked="checked"/>Female
            </c:if>
        </div>

        <div class="form-group">
            <label for="age">Age: </label>
            <input type="text" class="form-control" id="age"  name="age" placeholder="${user.age}" />
        </div>

        <div class="form-group">
            <label for="address">Address: </label>
            <c:if test="${'IL'.equalsIgnoreCase(user.address)}">
                <select name="address" class="form-control" id="address">
                    <option value="IL" selected>IL</option>
                    <option value="LA">LA</option>
                    <option value="NY">NY</option>
                    <option value="TX">TX</option>
                    <option value="CA">CA</option>
                </select>
            </c:if>
            <c:if test="${'LA'.equalsIgnoreCase(user.address)}">
                <select name="address" class="form-control" id="address">
                    <option value="IL">IL</option>
                    <option value="LA" selected>LA</option>
                    <option value="NY">NY</option>
                    <option value="TX">TX</option>
                    <option value="CA">CA</option>
                </select>
            </c:if>
            <c:if test="${'NY'.equalsIgnoreCase(user.address)}">
                <select name="address" class="form-control" id="address">
                    <option value="IL">IL</option>
                    <option value="LA">LA</option>
                    <option value="NY" selected>NY</option>
                    <option value="TX">TX</option>
                    <option value="CA">CA</option>
                </select>
            </c:if>
            <c:if test="${'TX'.equalsIgnoreCase(user.address)}">
                <select name="address" class="form-control" id="address">
                    <option value="IL">IL</option>
                    <option value="LA">LA</option>
                    <option value="NY">NY</option>
                    <option value="TX" selected>TX</option>
                    <option value="CA">CA</option>
                </select>
            </c:if>
            <c:if test="${'CA'.equalsIgnoreCase(user.address)}">
                <select name="address" class="form-control" id="address">
                    <option value="IL">IL</option>
                    <option value="LA">LA</option>
                    <option value="NY">NY</option>
                    <option value="TX">TX</option>
                    <option value="CA" selected>CA</option>
                </select>
            </c:if>
        </div>


        <div class="form-group">
            <label for="qq">QQ：</label>
            <input type="text" class="form-control" name="qq" placeholder="${user.qq}" id="qq"/>
        </div>

        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" placeholder="${user.email}" id="email"/>
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
