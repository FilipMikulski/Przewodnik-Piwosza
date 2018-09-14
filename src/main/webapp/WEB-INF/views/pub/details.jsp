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
<section id="main">
    <div class="container">
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading main-color-bg">
                    <h3 class="panel-title">${pub.name}</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <div class="well dash-box">
                            <h3>Adres: ${pub.address}</h3>
                            <h3>Telefon: ${pub.contact}</h3>
                            <h3>Email: ${pub.email}</h3>
                            <h3>Godziny otwarcia: ${pub.openingHours}</h3>
                            <h3>Opis pubu: ${pub.description}</h3>
                            <h/>
                        </div>
                    </div>
                    <div class="col-md-6 map-height">
                        <div id="map"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading main-color-bg">
                    <h3 class="panel-title button-wrapper">Komentarze <a class="btn btn-danger add-comment-button" href="/pubComment/form?idpub=${pub.id}">Dodaj komentarz</a></h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <c:forEach items="${commentPub}" var="commentPub">
                            Nazwa użytkownika: ${commentPub.user.username}<br/>
                            Ocena: ${commentPub.rating}<br/>
                            Treść: ${commentPub.text}<br/>
                            <a href="/beerComment/form?id=${commentPub.id}&idbeer=${commentPub.pub.id}">Edit</a>
                            <a href="/beerComment/confirmDelete?id=${commentPub.id}">Delete</a>
                            <hr/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>

    function initMap() {
        var myLatLng = {lat: ${pub.latitude}, lng: ${pub.longitude}};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: myLatLng
        });

        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: 'Hello World!'
        });
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0nW99KrZ6QgJ5YbiRdrnTNpVTJsYjIyY&callback=initMap">
</script>
<jsp:include page="/WEB-INF/views/footer.jsp"/>