<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Potwierdzenie usunięcia</title>
</head>
<body>
<h5>Czy chcesz usunąc z bazy danych pub o ID: ${param.id}?</h5>
<a href='delete?id=${param.id}'>OK</a>
<a href="list">Cancel</a>
</body>
</html>
