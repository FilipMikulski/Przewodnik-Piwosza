<%--
  Created by IntelliJ IDEA.
  User: filip
  Date: 9/11/18
  Time: 2:32 PM
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
            <form:form modelAttribute="typeOfBeer" method="POST">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Dodaj typ piwa:</h4>
                </div>
                <div class="modal-body">
                    <form:hidden path="id"/>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <label>Typ:</label>
                            </div>
                            <div class="col-md-7">
                                <form:input path="type"/><br/>
                                <form:errors path="type" cssClass="error" element="div"/>
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

