<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/12/18
  Time: 3:09 PM
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
            <form:form modelAttribute="user" method="POST">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Rejestracja:</h4>
            </div>
            <div class="modal-body">
                <form:hidden path="id"/>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-5">
                            <label>Nazwa użytkownika:</label>
                        </div>
                        <div class="col-md-7">
                            <form:input path="username" /><br />
                            <form:errors path="username" cssClass="error" element="div" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-5">
                            <label>Hasło: </label>
                        </div>
                        <div class="col-md-7">
                            <form:input path="password" /><br />
                            <form:errors path="password" cssClass="error" element="div" />
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

