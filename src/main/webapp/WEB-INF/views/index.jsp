<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>

<body>

<section id="main">
    <div class="container">
        <sec:authorize access="hasRole('ADMIN')">
        <div class="col-md-6 admin-panel col-centered" >
            <div class="list-group add-elements">
                <a class="list-group-item active main-color-bg">
                    <icon class="icon-cog"></icon> Panel administratora
                </a>
                <a type="button" class="list-group-item" href="/beer/list">
                    <i class="icon-plus"></i> Lista piw Admin
                </a>
                <a type="button" class="list-group-item" href="/pub/list">
                    <i class="icon-plus"></i> Lista pubów Admin
                </a>
                <a type="button" class="list-group-item" href="/types/list">
                    <i class="icon-plus"></i> Lista typów piw Admin
                </a>
                <a type="button" class="list-group-item" href="/beerComment/list">
                    <i class="icon-plus"></i> Lista komentarzy piw Admin
                </a>
                <a type="button" class="list-group-item" href="/pubComment/list">
                    <i class="icon-plus"></i> Lista komentarzy pubów Admin
                </a>
            </div>
        </div>
        </sec:authorize>

        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Wyszukaj pub po nazwie piwa <icon class="icon-search"></icon></h3>
                    </div>
                    <div class="panel-body panel-search">
                        <div>
                            <form action="/beer/search">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input name="beerName" type="text" class="form-control" required/>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="submit" class="btn btn-default" value="Szukaj">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Wyszukaj pub po nazwie pubu <icon class="icon-search"></icon></h3>
                    </div>
                    <div class="panel-body panel-search">
                        <div>
                            <form action="/pub/search">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input name="pubName" type="text" class="form-control" required/>
                                    </div>
                                    <div class="col-md-4">
                                        <input type="submit" class="btn btn-default" value="Szukaj">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading main-color-bg">
                <h3 class="panel-title invisible">Lista pubów i piw</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-6">
                    <div class="well dash-box">
                        <a class="absolute-full-link" href="/beer/beerList"></a>
                        <h2><i class="icon-clipboard"></i></h2>
                        <h4>Lista piw</h4>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="well dash-box">
                        <a class="absolute-full-link" href="/pub/pubList"></a>
                        <h2><i class="icon-clipboard"></i></h2>
                        <h4>Lista pubów</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><icon class="icon-award"></icon>Top 5 Pubów</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>Nazwa Pubu</th>
                                <th>Średnia ocena</th>
                                <th>Szczegóły</th>
                            </tr>

                            <c:forEach items="${bestof5}" var="pub">

                                <tr>
                                    <td>${pub[0]}</td>
                                    <td>${pub[1]}</td>
                                    <td>link</td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading main-color-bg">
                        <h3 class="panel-title"><icon class="icon-award"></icon>Top 5 Piw</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>Nazwa Piwa</th>
                                <th>Średnia ocena</th>
                                <th>Szczegóły</th>
                            </tr>

                            <c:forEach items="${best5}" var="beer">

                                <tr>
                                    <td>${beer[0]}</td>
                                    <td>${beer[1]}</td>
                                    <td>link</td>
                                </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"/>
