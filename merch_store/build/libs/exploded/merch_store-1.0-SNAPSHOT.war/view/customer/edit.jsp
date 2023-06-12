
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .row {
        display: flex;
    }

    .message {
        background: black;
        text-align: center;
        color: white;
        padding: 0.5em 0;
        font-size: 14px;
    }

    p {
        margin: 0;
    }
    .title{
        color: white;
        font-weight: bold;

    }
    .containForm{
        background-color: black;
    }

    .logo {
        width: 150px;
    }

    .bag-icon {
        display: inline;
        margin-left: 1rem;
    }

    i {
        font-size: 1.5rem;
    }

    .card {
        box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
    }
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0,0,0,.125);
        border-radius: .25rem;
    }
    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }
    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }

    .gutters-sm>.col, .gutters-sm>[class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }
    .mb-3, .my-3 {
        margin-bottom: 1rem!important;
    }

    footer a {
        text-decoration: none;
        text-transform: uppercase;
        cursor: pointer;
        display: inline-block;
        color: black;
    }

    footer a:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .footer--text {
        color: gray;
        font-size: 0.85rem;
    }

    .links {
        font-size: 1.5rem;
        text-decoration: none;
        margin-left: 1.5rem;
        padding: 0;
        color: gray;
        font-weight: lighter;
    }

    .links:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .hamburger {
        background: white;
        border: none;
    }

    .sign-up button,
    .log-in button,
    .sign-up button:hover,
    .log-in button:hover {
        color: white;
    }

    @media (max-width: 768px) {
        .overlay--main {
            z-index: 999;
            position: absolute;
            top: 120px;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            /*padding: .5em 1em;*/
        }

        .overlay--main a {
            font-size: 1.5rem;
            font-weight: lighter;
            text-decoration: none;
            color: black;
        }
    }
</style>
<body>
<c:import url="/view/carts/store-header.jsp"></c:import>
<div class="row gutters-sm">
    <div class="col-md-1 ">

    </div >
    <div class="col-md-4 mb-3">
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                    <img src="https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg" alt="Admin" class="rounded-circle"
                         width="150">
                    <div class="mt-3">
                        <h4>${customer.getName()}</h4>
                        <h5><i class="fa-solid fa-square-phone mx-2"></i>${customer.getPhoneNumber()}</h5>
                        <h5><i class="fa-sharp fa-solid fa-location-dot mx-2"></i>${customer.getAddress()}</h5>
                        <button class="btn btn-primary">Follow</button>
                        <button class="btn btn-outline-primary">Message</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-1 ">

    </div >
    <div class="col-md-5 containForm">
        <form method="post" action="/customer?action=edit" id="form-2">
            <fieldset >
                <input type="hidden" name="account" value="${customer.getAccountUser().getId()}">
                <input type="hidden" name="id" value="${customer.getId()}">
                <legend style="text-align: center; " class="title mt-2">Change Information</legend>
                <div class="mb-3">
                    <label for="name" class="form-label"><span  class="title">Name</span> </label>
                    <input placeholder="${customer.getName()}" type="text" class="form-control " id="name" name="name" aria-describedby="nameHelp">
                    <div id="nameHelp" class="form-text " style="color: black">
                        ${map.get("name")}
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label"><span  class="title">Email</span> </label>
                    <input type="text" class="form-control" id="email" name="email" readonly value="${customer.getEmail()}">
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label"><span  class="title">Phone</span></label>
                    <input placeholder="${customer.getPhoneNumber()}" type="text" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp">
                    <div id="phoneHelp" class="form-text " style="color: black">
                        ${map.get("phone")}
                    </div>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label"><span  class="title">Address</span></label>
                    <input placeholder="${customer.getAddress()}" type="text" class="form-control" name="address" id="address" aria-describedby="addressHelp">
                    <div id="addressHelp" class="form-text " style="color: black">
                        ${map.get("address")}
                    </div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label"><span  class="title">Password</span></label>
                    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp">
                    <div id="passwordHelp" class="form-text " style="color: black">
                        ${map.get("password")}
                    </div>
                </div>
                <div class="mb-3">
                    <label for="repeatPassword" class="form-label"><span  class="title">Confirm Password</span></label>
                    <input type="password" class="form-control" id="repeatPassword" name="repeatPassword"  aria-describedby="re_passwordHelp">
                    <div id="re_passwordHelp" class="form-text " style="color: black">
                        ${map.get("re_password")}
                    </div>
                </div>
                <div class="mb-3">
                    <input type="checkbox" onclick="myFunction()"><span class="title">Show Password</span>
                </div>
                <div style="text-align: center " class="mb-2">
                    <button type="submit" for="form-2" onclick="giveChange('${customer.getName()}','${customer.getPhoneNumber()}','${customer.getAddress()}','${customer.getAccountUser().getUserPassword()}',)"   class="btn btn-primary " ><span style="font-weight: bold;color:black;" class="mb-2">Save Change</span></button>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="col-md-1">
    </div>
</div>
</div>
<footer>
    <div class="container p-5">
        <h3 class="col text-md-center my-5">Quick Links</h3>
        <div
                class="row flex-column flex-md-row flex-md-wrap justify-content-around g-3"
        >
            <a href="" class="col-auto">search</a>
            <a href="" class="col-auto">contact us</a>
            <a href="" class="col-auto">returns and exchanges</a>
            <a href="" class="col-auto">shipping faq</a>
            <a href="" class="col-auto">asia customers</a>
            <a href="" class="col-auto">privacy policy</a>
            <a href="" class="col-auto">site use terms and conditions</a>
        </div>
    </div>
    <div class="container px-5 text-center footer--text">
        <img class="img-fluid mb-5" src="view/images/cards.png"/>
        <div class="text-center">
            <p>© 2023 JOJI UK Powered by MANHEAD.</p>
            <p>953 Main Street, Nashville, TN 37206 | support@manheadmerch.com</p>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
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

</script>
<script>
    function giveChange(x,y,z,h){
        let repeatPassword=document.getElementById("repeatPassword").value;
        let name=document.getElementById("name").value;
        if(name===""){
            document.getElementById("name").value=x;
        }
        let phone=document.getElementById("phone").value;
        if(phone===""){
            document.getElementById("phone").value=y;
        }
        let address=document.getElementById("address").value;
        if(address===""){
            document.getElementById("address").value=z;
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

