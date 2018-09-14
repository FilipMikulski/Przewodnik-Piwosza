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
            <form:form modelAttribute="beer" method="POST" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Dodaj piwo:</h4>
                </div>
                <div class="modal-body">
                    <form:hidden path="id"/>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Nazwa</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="name" cssClass="form-control"/><br/>
                                <form:errors path="name" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Adres browaru:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="breweryAddress" cssClass="form-control"/><br/>
                                <form:errors path="breweryAddress" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Objętość (ml)</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="volume" cssClass="form-control"/><br/>
                                <form:errors path="volume" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Zawartość alkoholu (%)</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="alcoholVolume" cssClass="form-control"/><br/>
                                <form:errors path="alcoholVolume" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Opis piwa:</label>
                            </div>
                            <div class="col-md-7">
                                <form:textarea path="description" cssClass="form-control"/><br/>
                                <form:errors path="description" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Dostępny w pubach:</label>
                            </div>
                            <div class="col-md-7">
                                <form:checkboxes items="${pubs}" path="pubs" itemValue="id" itemLabel="name" cssClass="checkbox-beers-pubs"/><br/>
                                <form:errors path="pubs" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Nagrody:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="awards" cssClass="form-control"/><br/>
                                <form:errors path="awards" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Typ piwa:</label>
                            </div>
                            <div class="col-md-7">
                                <form:select items="${types}" path="typeOfBeer.id" itemValue="id" itemLabel="type" cssClass="form-control"/><br/>
                                <form:errors path="typeOfBeer" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Zdjecie:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Zapisz</button>
                </div>
            </form:form>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp"/>