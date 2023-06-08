<%--
  Created by IntelliJ IDEA.
  User: TGDD
  Date: 6/2/2023
  Time: 9:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/view/store-header.jsp" %>
<a href="/products"><button type="submit" class="btn btn-primary bg-black text-white">Back</button></a><br>
<h2>
    <c:if test="${requestScope['message'] != null}">
    <span style="color: blue"><i class="fa-solid fa-square-check"></i>${requestScope['message']}</span>
    </c:if>
</h2>

<div class="d-flex" style="justify-content: space-between">
    <form method="post" action="/products?action=edit" class="row row-cols-lg-auto g-3 align-items-center">
        <div class="col-12 mb-3">
            <input value="${productById.id}" name="id" type="text" class="form-control" id="formGroupExampleInput">
        </div>
        <div class="col-12 mb-3">
            <input value="${productById.name}" name="name" type="text" class="form-control"
                   placeholder="Product's name">
        </div>
        <div class="col-12 col-auto form-check mb-3">
            <input value="${productById.description}" name="description" type="text" class="form-control"
                   placeholder="Product Description">
        </div>
        <div class="col-12 mb-3">
            <div class="input-group ">
                <input value="${productById.price}" name="price" type="text" class="form-control" placeholder="Product price">
                <span class="input-group-text">€</span>
            </div>
        </div>
        <div class="col-12 ">
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon3">${productById.image}</span>
                <input name="image" type="text" class="form-control" >
                <label class="input-group-text" >Image</label>
            </div>
<%--            id="inputGroupFile02"
for="inputGroupFile02"--%>
        </div>
        <div class="col-12 col-auto form-check mb-3">
            <select name="productType" class="form-select" aria-label="Default select example">
                <c:forEach var="productType" items="${productTypeList}">
                    <option value="${productType.productTypeId}">${productType.productTypeName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-12 mb-3">
            <button type="submit" class="btn btn-primary bg-black text-white">Update products</button>
        </div>
    </form>
</div>
<%--<%@include file="/view/footer.jsp" %>--%>
</body>
</html>
