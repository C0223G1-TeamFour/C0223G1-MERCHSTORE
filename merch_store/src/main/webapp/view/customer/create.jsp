<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/6/2023
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <script
            defer
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://kit.fontawesome.com/4bf93b0ca4.js"
            crossorigin="anonymous"
    ></script>
    <link href="style.css" rel="stylesheet">
    <title>Home</title>

</head>
<style>
    .form-1 {
        border: 2px solid blue;
        border-radius: 10px;
        padding: 10px;
        background-color: black;
    }
    .text-content{
        color: white;
        font-size: 20px;
        font-weight: bold;
    }
</style>

<body>
<%--<% List<Cart> cartList = (List<Cart>) session.getAttribute("cartList"); %>--%>
<%@include file="/view/header.jsp" %>

<section class="overlay--main d-md-none" style="display: none">
    <table class="table table-hover">
        <tr class="table-group-divider">
            <td><a href="/home">SMITHEREENS</a></td>
        </tr>
        <tr>
            <td><a href="/music">MUSIC</a></td>
        </tr>
        <tr>
            <td><a href="/merch">MERCH</a></td>
        </tr>
    </table>
</section>
<div class="row">
    <div class="col-md-4 col-sm-0"></div>
    <div class="col-md-4 col-sm-12">
        <form action="/customer?action=create" method="post" class="form-1" id="form-1">
            <h4 style="text-align: center;color: white">Create Customer Account </h4>
            <div class="mb-3">
                <label for="name" class="form-label"><span class="text-content">Name</span> </label>
                <input type="text" class="form-control" id="name" name="name"
                       pattern="^([\p{Lu}][\p{Ll}]{1,8})(\s([\p{Lu}]|[\p{Lu}][\p{Ll}]{1,10})){0,5}$">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label"><span class="text-content">Email Address</span></label>
                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label"><span class="text-content">Phone</span></label>
                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp"
                       pattern="^[0][0-9]{9}$">
            </div>
            <div class="mb-3">
                <label for="address" class="form-label"><span class="text-content">Address</span></label>
                <input type="text" class="form-control" name="address" id="address">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label"><span class="text-content">Password</span></label>
                <input type="password" class="form-control" id="password" name="password"
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
            </div>
            <div style="text-align: center ">
            <button type="submit" form="form-1" class="btn btn-primary " ><span style="font-weight: bold;color:black">Register</span></button>
            </div>
        </form>
    </div>
    <div class="col-md-4 col-sm-0"></div>
</div>
<%@include file="/view/footer.jsp" %>
<script>
    function switcher() {
        let overlayMain = document.querySelector(".overlay--main");
        if (overlayMain.style.display === "none") {
            overlayMain.style.display = "block";
            document.body.style.overflow = "hidden";
        } else {
            overlayMain.style.display = "none";
            document.body.style.overflow = "visible";
        }
    }
</script>
</body>
</html>
