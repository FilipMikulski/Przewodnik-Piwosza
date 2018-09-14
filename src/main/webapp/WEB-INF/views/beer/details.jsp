<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 7:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<body>
<body>
<section id="main">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading main-color-bg">
                    <h3 class="panel-title">${beer.name}</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <div class="allign-left well dash-box">
                            <h3>Adres browaru: ${beer.breweryAddress}</h3>
                            <h3>Objętość (ml): ${beer.volume}</h3>
                            <h3>Zawartość alkoholu: ${beer.alcoholVolume}</h3>
                            <h3>Opis piwa: ${beer.description}</h3>
                            <h3>Nagrody: ${beer.awards}</h3>
                            <h3>Dostępny w pubach:
                                <c:forEach items="${beer.pubs}" var="pub">
                                    ${pub.name},
                                </c:forEach></h3>
                            <h/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div><img class="beer-image" src="/resources/images/${beer.image}"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading main-color-bg">
                    <h3 class="panel-title button-wrapper">Komentarze <a class="btn btn-danger add-comment-button" href="/pubComment/form?idpub=${beer.id}">Dodaj komentarz</a></h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <c:forEach items="${commentBeer}" var="commentBeer">
                            Nazwa użytkownika: ${commentBeer.user.username}<br/>
                            Ocena: ${commentBeer.rating}<br/>
                            Treść: ${commentBeer.text}<br/>
                            <a href="/beerComment/form?id=${commentBeer.id}&idbeer=${commentBeer.beer.id}">Edit</a>
                            <a href="/beerComment/confirmDelete?id=${commentBeer.id}">Delete</a>
                            <hr/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<hr/>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
