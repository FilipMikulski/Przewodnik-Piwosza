<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h5>Czy chcesz usunąc z bazy danych typ piwa o ID: ${param.id}?</h5>
<a href='/types/delete?id=${param.id}'>OK</a>
<a href="/types/list">Cancel</a>
</body>
</html>
