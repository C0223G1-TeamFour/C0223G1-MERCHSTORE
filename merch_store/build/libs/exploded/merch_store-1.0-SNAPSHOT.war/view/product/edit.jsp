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
    <style>
        .form-1 {
            border: 2px solid blue;
            border-radius: 10px;
            padding: 10px;
            background-color: black;
        }

        .text-content {
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<h2>
    <c:if test="${requestScope['message'] != null}">
        <span style="color: blue"><i class="fa-solid fa-square-check"></i>${requestScope['message']}</span>
    </c:if>
</h2>
<div class="row ">
    <div class="col-md-4 col-sm-0"></div>
    <div class="col-md-4 col-sm-12 ">
        <form action="/products?action=edit" method="post" class="form-1" id="form-1">
            <h4 style="text-align: center;color:wheat ">Create Product Account </h4>
            <div class="mb-3">
                <label for="id" class="form-label"><span class="text-content">ID</span></label>
                <input type="text" class="form-control" name="id" id="id" value="${productById.id}" readonly>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label"><span class="text-content">Image</span></label>
                <input type="text" class="form-control" name="image" id="image" value="${productById.image}">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label"><span class="text-content">Name</span> </label>
                <input type="text" class="form-control" id="name" name="name" value="${productById.name}">
                <%--                       pattern="^([\p{Lu}][\p{Ll}]{1,8})(\s([\p{Lu}]|[\p{Lu}][\p{Ll}]{1,10})){0,5}$">--%>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label"><span class="text-content">Description</span></label>
                <input type="text" class="form-control" id="description" name="description"
                       value="${productById.description}" aria-describedby="emailHelp">
                <%--                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">--%>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label"><span class="text-content">Price</span></label>
                <input type="number" class="form-control" id="price" name="price" value="${productById.price}"
                       aria-describedby="emailHelp">
                <%--                       pattern="^[0][0-9]{9}$">--%>
            </div>
            <div class="mb-3">
                <label for="productType" class="form-label"><span class="text-content">Product Type</span></label>
                <select name="productType" class="form-select" id="productType" aria-label="Default select example">
                    <option value="${productById.productTypeId}">${productById.productTypeId.productTypeName}</option>
                    <c:forEach var="productType" items="${productTypeList}">
                        <option value="${productType.productTypeId}">${productType.productTypeName}</option>
                    </c:forEach>
                </select>

            </div>
            <div style="text-align: center ">
                <button type="submit" form="form-1" class="btn btn-primary "><span
                        style="font-weight: bold;color:white">Update product</span></button>
            </div>
        </form>
    </div>
    <div class="col-md-4 col-sm-0"></div>
</div>
<%@include file="/view/carts/footer.jsp" %>
</body>
</html>
