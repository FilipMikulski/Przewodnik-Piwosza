<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 12:36 PM
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
                                <a class="btn btn-default" href="/beer/form">Dodaj</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>id</th>
                                <th>Nazwa</th>
                                <th>Adres</th>
                                <th>Objętość</th>
                                <th>Zawartość alkoholu</th>
                                <th>Opis piwa</th>
                                <th>Nagrody</th>
                                <th>typ</th>
                                <th>edycja</th>
                                <th>usuń</th>
                            </tr>
                            <c:forEach var="beer" items="${beers}">
                                <tr>
                                    <td>${beer.id}</td>
                                    <td>${beer.name}</td>
                                    <td>${beer.breweryAddress}</td>
                                    <td>${beer.volume}</td>
                                    <td>${beer.alcoholVolume}</td>
                                    <td>${beer.description}</td>
                                    <td>${beer.awards}</td>
                                    <td>${beer.typeOfBeer.type}</td>
                                    <td><a class="btn btn-primary" href="/beer/form?id=${beer.id}"><i class="icon-cog"></i> edytuj</a></td>
                                    <td><a class="btn btn-danger" href="/beer/confirmDelete?id=${beer.id}"><i class="icon-cancel-circled"></i> usuń</a></td>
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
