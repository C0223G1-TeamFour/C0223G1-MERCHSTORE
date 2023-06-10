<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 22/05/2023
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>

    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha384-KWI/x1YonRENGIFUfdTvf/zUoVZiE8OgDmKNu8VAnmQUDf1G/+x0yTHvYbD0b6Q6"
            crossorigin="anonymous"></script>

    <!-- Include Bootstrap JavaScript -->
    <script src="<URL>"
            integrity="<URL>"
            crossorigin="<URL>"></script>

    <title>Home</title>
</head>
<body>
<style>
    img:hover{
        transform: scale(1.1);
    }
</style>
<%@include file="header.jsp" %>
<section>
    <div class="container mt-4 mt-sm-2">
        <div class="row row-cols-md-3 row-cols-2 justify-content-center gy-2 gx-3">

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
                                <a class="link link-offset-2-hover text-black fs-5 "
                                   href="/products?action=details&id=${product.getId()}">
                                        ${product.getName()}
                                </a>
                                <p class="card-text fs-5">€<span>${product.getPrice()}</span> EUR</p>
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
