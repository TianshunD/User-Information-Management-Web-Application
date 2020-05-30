<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Welcome Page</title>

  <!-- CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery -->
  <script src="js/jquery-2.1.0.min.js"></script>
  <!-- bootstrap -->
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  </script>
</head>
<body>
<div style="font-size: 25px">Welcome, ${login_name}!</div>
<div align="center">
  <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=1" style="text-decoration:none;font-size:33px">
    Check All User's Information
  </a>
</div>
</body>
</html>
