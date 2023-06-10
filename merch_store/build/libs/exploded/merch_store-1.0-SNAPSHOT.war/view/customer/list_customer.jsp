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

<%@include file="/view/carts/header.jsp" %>
<div class="row gutters-sm">
    <div class="col-md-1 mb-3">
    </div>
    <div class="col-md-4 mb-3">
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle"
                         width="150">
                    <div class="mt-3">
                        <h4>${customer.getName()}</h4>
                        <p class="text-secondary mb-1">Full Stack Developer</p>
                        <p class="text-muted font-size-sm">${customer.getName()}</p>
                        <button class="btn btn-primary">Follow</button>
                        <button class="btn btn-outline-primary">Message</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 ">
        <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${customer.getName()}
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${customer.getAccountUser().getEmail()}
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${customer.getPhone()}
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        ${customer.getAddress()}
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-2">
                    <a href="/customer?action=edit&id=${customer.getId()}">
                        <button type="submit" class="btn btn-primary">CHANGE</button>
                    </a>
                    </div>
                    <div class="col-sm-2">
                            <button type="button" onclick="isDelete('${customer.getId()}','${customer.getName()}')"  class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#button-delete" >DELETE</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1">
        </div>
    </div>
</div>
<div class="modal " tabindex="-1" id="button-delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">DELETE CUSTOMER</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Are You Sure To Delete Customer with the name: <span id="alert_delete"></span></h4>
            </div>
            <div class="modal-footer">
                <form action="/customer?action=delete" method="post">
                    <input type="hidden" name="id" id="is_delete" value="">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
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
    function isDelete(id,name){
        document.getElementById("alert_delete").innerText=name;
        document.getElementById("is_delete").value=id;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>

