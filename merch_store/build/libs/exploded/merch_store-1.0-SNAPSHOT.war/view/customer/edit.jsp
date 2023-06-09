<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/1/2023
  Time: 6:42 AM
  To change this template use File | Settings | File Templates.
--%>

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
<div class="header">
    <div class="message">
        <p class="">
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <!-- <div class="container-fluid">
      <img
        class="w-100"
        src="https://static.vecteezy.com/system/resources/previews/002/393/980/original/corporate-banner-with-modern-design-free-vector.jpg"
      />
    </div> -->
    <div class="container-fluid p-md-5 mt-1">
        <div
                class="row row-cols-3 justify-content-between align-items-center pt-2"
        >
            <div class="col col-auto d-block d-md-none">
                <button class="hamburger" onclick="switcher()">
                    <i class="fa fa-bars switcher-icon"></i>
                </button>
            </div>

            <div class="row col col-md-auto align-items-center">
                <div class="col col-auto">
                    <img
                            class="logo"
                            src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                    />
                </div>
                <div class="col d-md-block d-none">
                    <a class="links" href="">Home</a>
                    <a class="links" href="">Product</a>
                    <a class="links" href="">Order</a>
                </div>
            </div>

            <div class="col col-auto">
                <i class="far fa-user"></i>
                <i class="fa fa-shopping-bag bag-icon"></i>
            </div>
        </div>
    </div>
</div>
<div class="row gutters-sm">
    <div class="col-md-4 mb-3">
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle"
                         width="150">
                    <div class="mt-3">
                        <h4>${customer.getName()}</h4>
                        <p class="text-muted font-size-sm">${customer.getAddress()}</p>
                        <button class="btn btn-primary">Follow</button>
                        <button class="btn btn-outline-primary">Message</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-7 ">
        <div class="card mb-3">
            <form method="post" action="/customer?action=edit&id=${customer.getId()}">
                <fieldset >
                    <legend>Thay Đổi Thông Tin</legend>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name :</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="${customer.getName()}">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email :</label>
                        <input type="email" name="email" id="email" class="form-control" placeholder="${customer.getAccountUser().getEmail()}">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone :</label>
                        <input type="text" name="phone" id="phone" class="form-control" placeholder="${customer.getPhone()}">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address :</label>
                        <input type="text" name="address" id="address" class="form-control" placeholder="${customer.getAddress()}">
                    </div>
                    <button type="submit" class="btn btn-primary">Save Change</button>
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
</body>
</html>

