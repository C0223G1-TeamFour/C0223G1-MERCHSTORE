<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 22/05/2023
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous" />
    <script
            defer
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"></script>
    <script
            src="https://kit.fontawesome.com/4bf93b0ca4.js"
            crossorigin="anonymous"></script>

    <title>Home</title>
</head>
<body>
<%@include file="header.jsp" %>
<section>
    <div class="container mt-2">
        <div class="row row-cols-md-3 row-cols-2 justify-content-center gy-2 gx-3" id="tableStudent">
            <c:forEach var="product" items="${products}">
                <div class="col">
                    <div class="row justify-content-center">
                        <div class="card" style="width: 17rem">
                            <a href="/products?action=details&id=${product.getId()}">
                                <img
                                        src="${product.getImage()}"
                                        class="card-img-top text-center product-img"
                                        alt="merch"
                                />
                            </a>

                            <div class="card-body">
                                <a class="link link-offset-2-hover text-black fs-5"
                                   href="/products?action=details&id=${product.getId()}">
                                        ${product.getName()}
                                </a>
                                <p class="card-text">€<span>${product.getPrice()}</span> EUR</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
