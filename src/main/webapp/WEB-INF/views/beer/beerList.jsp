<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 8:14 PM
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
                                <h3>Lista piw</h3>
                            </div>
                            <div class="col-md-3">
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>Nazwa</th>
                                <th>Typ</th>
                                <th>Objętość</th>
                                <th>Wiecej szczegółów</th>
                            </tr>
                            <c:forEach var="beer" items="${beers}">
                                <tr>
                                    <td>${beer.name}</td>
                                    <td>${beer.typeOfBeer.type}</td>
                                    <td>${beer.volume}</td>
                                    <td><a href="/beer/details?id=${beer.id}">info</a></td>
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

