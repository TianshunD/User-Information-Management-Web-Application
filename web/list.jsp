<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Info Database Management System</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script type="text/javascript">
        function delUser(id) {
            //alert before delete
            if (confirm("You sure about delete this record?")) {
                location.href = "${pageContext.request.contextPath}/delUserServlet?id=" + id;
            }
        }

        window.onload = function () {
            document.getElementById("delSelected").onclick = function () {

                if (confirm("You sure about delete all selected users?")) {
                    var ids = document.getElementsByName("id");
                    for (var i = 0; i< ids.length; i++) {
                        //check at least one row is selected
                        if (ids[i].checked) {
                            document.getElementById("form").submit();
                        }
                        break;
                    }

                }

            }

            document.getElementById("firstCb").onclick = function () {
                var ids = document.getElementsByName("id");
                for (var i = 0; i< ids.length; i++) {
                    ids[i].checked = this.checked;
                }

            }

        }
    </script>

</head>
<body>
<div class="container">
    <h3 style="text-align: center">User Information List</h3>

    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">Name</label>
                <input type="text" name="name" class="form-control" id="exampleInputName2" placeholder="${condition.name[0]}">
            </div>
            <div class="form-group">
                <label for="exampleInputAddress2">Address</label>
                <input type="text" name="address" class="form-control" id="exampleInputAddress2" placeholder="${condition.address[0]}">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">Email</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail2" placeholder="${condition.email[0]}">
            </div>
            <button type="submit" class="btn btn-default">Find</button>
        </form>
    </div>

    <div style="float: right; padding: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp" style="margin-right: 5px">Add User</a>
        <!-- javascript: void(0) -> click and do nothing, to submit form, add onclick event -->
        <a class="btn btn-primary" href="javascript: void(0)" id="delSelected">Delete Selected</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Address</th>
            <th>QQ</th>
            <th>Mail</th>
            <th>Action</th>
        </tr>

        <c:forEach items="${pb.list}" var="user" varStatus="s">
            <tr>
                <td><input type="checkbox" name="id" value="${user.id}"></td>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.qq}</td>
                <td>${user.email}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">Modify</a>&nbsp;<a class="btn btn-default btn-sm" href="javascript:delUser(${user.id})">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage==1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage!=1}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage-1}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pb.currentPage==pb.totalPage}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage!=pb.totalPage}">
                <li>
                </c:if>
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage+1}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px; margin-left: 10px">${pb.totalPage} pages, ${pb.totalCount} records in total</span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
