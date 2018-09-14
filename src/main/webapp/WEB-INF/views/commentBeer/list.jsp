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
                                <h3>Lista komentarzy - Admin</h3>
                            </div>
                            <div class="col-md-3">
                                <%--<a class="btn btn-default" href="/beer/form">Dodaj</a>--%>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>id</th>
                                <th>Ocena</th>
                                <th>Komentarz</th>
                                <th>edycja</th>
                                <th>usuń</th>
                            </tr>
                            <c:forEach var="commentBeer" items="${beercomments}">
                                <tr>
                                    <td>${commentBeer.id}</td>
                                    <td>${commentBeer.rating}</td>
                                    <td>${commentBeer.text}</td>
                                    <td><a class="btn btn-primary" href="/beerComment/form?id=${commentBeer.id}&idbeer=${commentBeer.beer.id}"><i class="icon-cog"></i> edytuj</a></td>
                                    <td><a class="btn btn-danger" href="/beerComment/confirmDelete?id=${commentBeer.id}"><i class="icon-cancel-circled"></i> usuń</a></td>
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

