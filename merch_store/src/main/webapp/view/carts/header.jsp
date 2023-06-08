<%@ page import="java.util.List" %>
<%@ page import="com.example.merch_store.model.Cart" %>
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
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .message-header {
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
        border: none;
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
<% List<Cart> cartList = (List<Cart>) session.getAttribute("cartList"); %>

<div class="header">
    <div class="message-header">
        <p>
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <div class="container-fluid p-md-5 mt-1 ">
        <div class="row row-cols-3 justify-content-between align-items-center pt-2">
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
                    <a class="links" href="/home">SMITHEREENS</a>
                    <a class="links" href="/music">MUSIC</a>
                    <a class="links" href="/merch">MERCH</a>
                </div>
            </div>

            <div class="col col-auto">
                <a href="/login" class="text-dark"><i class="far fa-user"></i></a>
                <a href="/cart" class="text-dark p-0">
                    <i class="fa fa-shopping-bag bag-icon position-relative">
                        <c:if test="${cartList.size() > 0}">
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger rounded-circle text-center"
                                  style="height: 17px; width: 17px">
                                <span style="font-size: 10px">${cartList.size()}</span>
                            </span>
                        </c:if>
                    </i>
                </a>
            </div>
        </div>
    </div>
</div>


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
