<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/6/2023
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@include file="/view/carts/store-header.jsp" %>

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
                <label for="name" class="form-label"><span class="text-content" >Name</span> </label>
                <input type="text" class="form-control" id="name" name="name" aria-describedby="nameHelp" placeholder="${sessionScope.name}">
                <div id="nameHelp" class="form-text " style="color: white">
                    ${map.get("name")}
                </div>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label"><span class="text-content">Email Address</span></label>
                <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="${sessionScope.email}">
                <div id="emailHelp" class="form-text " style="color: white">
                    ${map.get("email")}
                </div>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label"><span class="text-content">Phone</span></label>
                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp" placeholder="${sessionScope.phone}">
                <div id="phoneHelp" class="form-text " style="color: white">
                    ${map.get("phone")}
                </div>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label"><span class="text-content">Address</span></label>
                <input type="text" class="form-control" name="address" id="address" aria-describedby="addressHelp" placeholder="${sessionScope.address}">
                <div id="addressHelp" class="form-text " style="color: white">
                    ${map.get("address")}
                </div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label"><span class="text-content">Password</span></label>
                <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp" placeholder="${sessionScope.password}">
                <div id="passwordHelp" class="form-text " style="color: white">
                    ${map.get("password")}
                </div>
            </div>
            <div class="mb-3">
                <label for="repeatPassword" class="form-label"><span class="text-content">Confirm Password</span></label>
                <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" aria-describedby="re_passwordHelp">
                <div id="re_passwordHelp" class="form-text " style="color: white">
                    ${map.get("re_password")}
                </div>
            </div>
            <div class="mb-3">
                <input type="checkbox" onclick="myFunction()"><span style="color: white;font-weight: bold">Show Password</span>
            </div>
            <div style="text-align: center ">
                <button type="submit" form="form-1" onclick="transferSession('${sessionScope.name}','${sessionScope.email}','${sessionScope.phone}','${sessionScope.address}','${sessionScope.password}')"  class="btn btn-primary " ><span style="font-weight: bold;color:black">Register</span></button>
            </div>
        </form>
    </div>
    <div class="col-md-4 col-sm-0"></div>
</div>
<%@include file="/view/carts/footer.jsp" %>
<script>
    function myFunction() {
        var x = document.getElementById("password");
        var y = document.getElementById("repeatPassword");
        if (x.type === "password" && y.type === "password") {
            x.type = "text";
            y.type = "text";
        } else {
            x.type = "password";
            y.type = "password";
        }
    }
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
    function transferSession(x,y,z,g,h){
        let repeatPassword=document.getElementById("repeatPassword").value;
        let name=document.getElementById("name").value;
        if(name===""){
            document.getElementById("name").value=x;
        }
        let email=document.getElementById("email").value;
        if(email===""){
            document.getElementById("email").value=y;
        }
        let phone=document.getElementById("phone").value;
        if(phone===""){
            document.getElementById("phone").value=z;
        }
        let address=document.getElementById("address").value;
        if(address===""){
            document.getElementById("address").value=g;
        }
        let password=document.getElementById("password").value;
        if(password==="" && repeatPassword===""){
            document.getElementById("password").value=h;
            document.getElementById("repeatPassword").value=h;
        }
    }
</script>
</body>
</html>
