<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
%>
<!-- Custom styles for this template-->
<link href="<%=path%>/static/bootstrap/admin/css/sb-admin-2.css" rel="stylesheet">
<div class="row">
    <div class="col-md-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">${title}</h6>
            </div>
            <div class="card-body">
                ${MESSAGE}
                <form action="<%=path%>/${type}/add" method="post" enctype="multipart/form-data">
                    <c:forEach var="FIELD" items="${FIELDS}">
                        <div class="form-group">
                            <label ><strong>${FIELD.title}</strong></label>
                            <c:if test="${FIELD.type=='select'}">
                                <select class="form-control" name="${FIELD.name}" id="${FIELD.name}">
                                    <c:forEach var="option" items="${FIELD.select}">
                                        <option value="${option.value}">${option.name}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${FIELD.type=='textarea'}">
                                 <textarea placeholder="${FIELD.name}"  name="${FIELD.name}" class="form-control"></textarea>
                            </c:if>
                            <c:if test="${FIELD.type=='text'}">
                                <input type="text" name="${FIELD.name}" class="form-control" placeholder="${FIELD.placeholder}">
                            </c:if>
                            <c:if test="${FIELD.type=='number'}">
                                <input type="number" name="${FIELD.name}" class="form-control" placeholder="${FIELD.placeholder}">
                            </c:if>
                        </div>
                    </c:forEach>
                    <button class="btn btn-success btn-block">Add New Record</button>
                </form>
            </div>
        </div>
    </div>
</div>