<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 12:36 PM
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
            <form:form modelAttribute="commentPub" method="POST">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Edycja komentarza:</h4>
            </div>
            <div class="modal-body">
                <form:hidden path="id"/>
                <form:hidden path="user.id"/>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-5">
                            <label>Ocena:</label>
                        </div>
                        <div class="col-md-7">
                            <form:input path="rating"/><br/>
                            <form:errors path="rating" cssClass="error" element="div"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-5">
                            <label>Komentarz: </label>
                        </div>
                        <div class="col-md-7">
                            <form:textarea path="text"/><br/>
                            <form:errors path="text" cssClass="error" element="div"/>
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

