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
            background-color: rgba(9, 9, 5, 0.76);
        }
        .text-content{
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<a href="/products"><button type="submit" class="btn btn-primary bg-black text-white">Back</button></a><br>
<h2>
    <c:if test="${requestScope['message'] != null}">
    <span style="color: blue"><i class="fa-solid fa-square-check"></i>${requestScope['message']}</span>
    </c:if>
</h2>
<div class="row ">
    <div class="col-md-4 col-sm-0" ></div>
    <div class="col-md-4 col-sm-12 ">
        <form action="/products?action=edit" method="post" class="form-1" id="form-1">
            <h4 style="text-align: center;color:wheat ">Create Product Account </h4>
            <div class="mb-3">
                <label for="id" class="form-label"><span class="text-content">Image</span></label>
                <input type="text" class="form-control" name="id" id="id" value="${productById.id}">
            </div>
            <div class="mb-3">
                <label for="image" class="form-label"><span class="text-content">Image</span></label>
                <input type="text" class="form-control" name="image" id="image" value="${productById.image}${productById.id}">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label"><span class="text-content">Name</span> </label>
                <input type="text" class="form-control" id="name" name="name" value="${productById.name}">
<%--                       pattern="^([\p{Lu}][\p{Ll}]{1,8})(\s([\p{Lu}]|[\p{Lu}][\p{Ll}]{1,10})){0,5}$">--%>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label"><span class="text-content">Description</span></label>
                <input type="text" class="form-control" id="description" name="description" value="${productById.description}" aria-describedby="emailHelp">
<%--                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">--%>
            </div>
            <div class="mb-3">
                <label for="price" class="form-label"><span class="text-content">Price</span></label>
                <input type="number" class="form-control" id="price" name="price" value="${productById.price}" aria-describedby="emailHelp">
<%--                       pattern="^[0][0-9]{9}$">--%>
            </div>
            <div class="mb-3">
                <label for="productType" class="form-label"><span class="text-content">Product Type</span></label>
                <select name="productType" class="form-select" id="productType" aria-label="Default select example">
                    <option value="0">Product Type</option>
                    <c:forEach var="productType" items="${productTypeList}">
                        <option value="${productType.productTypeId}">${productType.productTypeName}</option>
                    </c:forEach>
                </select>

            </div>
            <div style="text-align: center ">
                <button type="submit" form="form-1" class="btn btn-secondary "><span
                        style="font-weight: bold;color:white">Add new product</span></button>
            </div>
        </form>
    </div>
    <div class="col-md-4 col-sm-0"></div>
</div>
<%--<div class="d-flex" style="justify-content: space-between">--%>
<%--    <form method="post" action="/products?action=edit" class="row row-cols-lg-auto g-3 align-items-center">--%>
<%--        <div class="col-12 mb-3">--%>
<%--            <input value="${productById.id}" name="id" type="text" class="form-control" id="formGroupExampleInput">--%>
<%--        </div>--%>
<%--        <div class="col-12 mb-3">--%>
<%--            <input value="${productById.name}" name="name" type="text" class="form-control"--%>
<%--                   placeholder="Product's name">--%>
<%--        </div>--%>
<%--        <div class="col-12 col-auto form-check mb-3">--%>
<%--            <input value="${productById.description}" name="description" type="text" class="form-control"--%>
<%--                   placeholder="Product Description">--%>
<%--        </div>--%>
<%--        <div class="col-12 mb-3">--%>
<%--            <div class="input-group ">--%>
<%--                <input value="${productById.price}" name="price" type="text" class="form-control" placeholder="Product price">--%>
<%--                <span class="input-group-text">€</span>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-12 ">--%>
<%--            <div class="input-group mb-3">--%>
<%--                <input name="image" type="text" class="form-control" value="${productById.image}"> >--%>
<%--                <label class="input-group-text" >Image</label>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-12 col-auto form-check mb-3">--%>
<%--            <select name="productType" class="form-select" aria-label="Default select example">--%>
<%--                <c:forEach var="productType" items="${productTypeList}">--%>
<%--                    <option value="${productType.productTypeId}">${productType.productTypeName}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="col-12 mb-3">--%>
<%--            <button type="submit" class="btn btn-primary bg-black text-white">Update products</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%@include file="/view/carts/footer.jsp" %>
</body>
</html>
