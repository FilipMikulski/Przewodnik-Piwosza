<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/header.jsp"/>

<body>
<section id="main">
    <div class="container">
        <div class="row">
            <form:form modelAttribute="pub" method="POST">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Dodaj pub:</h4>
                </div>
                <div class="modal-body">
                    <form:hidden path="id"/>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Nazwa:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="name"/><br/>
                                <form:errors path="name" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Adres pubu:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="address"/><br/>
                                <form:errors path="address" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Telefon:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="contact"/><br/>
                                <form:errors path="contact" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Email:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="email"/><br/>
                                <form:errors path="email" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Godziny otwarcia:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="openingHours"/><br/>
                                <form:errors path="openingHours" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Opis pubu:</label>
                            </div>
                            <div class="col-md-7">
                                <form:textarea path="description"/><br/>
                                <form:errors path="description" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Latitude:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="latitude"/><br/>
                                <form:errors path="latitude" cssClass="error" element="div"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Longitude:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="longitude"/><br/>
                                <form:errors path="longitude" cssClass="error" element="div"/><br/>
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
