<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<body>
<section id="main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-9">
                                <h3>Lista piw - Admin</h3>
                            </div>
                            <div class="col-md-3">
                                <a class="btn btn-default" href="/pub/form">Dodaj</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>id</th>
                                <th>Nazwa</th>
                                <th>Adres</th>
                                <th>Telefon</th>
                                <th>Email</th>
                                <th>Godziny otwarcia</th>
                                <th>Opis pubu</th>
                                <th>Latitude</th>
                                <th>Langitude</th>
                                <th>edycja</th>
                                <th>usuń</th>
                            </tr>
                            <c:forEach var="pub" items="${pubs}">
                                <tr>
                                    <td>${pub.id}</td>
                                    <td>${pub.name}</td>
                                    <td>${pub.address}</td>
                                    <td>${pub.contact}</td>
                                    <td>${pub.email}</td>
                                    <td>${pub.openingHours}</td>
                                    <td>${pub.description}</td>
                                    <td> ${pub.latitude} </td>
                                    <td>${pub.longitude}</td>
                                    <td><a class="btn btn-primary" href="/pub/form?id=${pub.id}"><i class="icon-cog"></i> edytuj</a></td>
                                    <td><a class="btn btn-danger" href="/pub/confirmDelete?id=${pub.id}"><i class="icon-cancel-circled"></i> usuń</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp"/>


<%--<h2>Pubs</h2>--%>
<%--<c:forEach items="${pubs}" var="pub">--%>
    <%--ID: ${pub.id}<br/>--%>
    <%--Nazwa: ${pub.name}<br />--%>
    <%--Adres: ${pub.address}<br />--%>
    <%--Telefon: ${pub.contact}<br />--%>
    <%--Email: ${pub.email}<br/>--%>
    <%--Godziny otwarcia: ${pub.openingHours}<br />--%>
    <%--Opis pubu: ${pub.description}<br />--%>
    <%--Latitude: ${pub.latitude}<br />--%>
    <%--Longitude: ${pub.longitude}<br />--%>
    <%--<a href="/pub/form?id=${pub.id}">Edit</a>--%>
    <%--<a href="/pub/confirmDelete?id=${pub.id}">Delete</a>--%>
    <%--<hr />--%>
<%--</c:forEach>--%>
<%--<a href="/pub/form">Add</a>--%>
<%--</body>--%>
<%--</body>--%>
<%--</html>--%>
