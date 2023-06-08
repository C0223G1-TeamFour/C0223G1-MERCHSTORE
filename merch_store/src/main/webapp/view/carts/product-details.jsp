<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 26/05/2023
  Time: 11:47
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
<%@include file="header.jsp" %>

<section class="details">
    <div class="container mt-md-0 mt-3">

        <div class="row justify-content-between">

            <div class="col-sm-6 col-xxl-5 col-12">
                <img width="100%"
                     src="${product.getImage()}"
                     style="max-height: 450px"
                />
            </div>
            <div class="col-sm-6 col-12">
                <small class="fw-light">JOJI ASIA</small>
                <h1>${product.getName()}</h1>
                <p class="fs-5">€<span>${product.getPrice()}</span> EUR</p>
                <small class="fw-light">Tax included.</small>
                <ul class="description fw-light mt-2">
                    <li>${product.getDescription()}</li>
                </ul>
                <p class="my-2">Size</p>
                <div class="container row gap-2">
                    <button class="btn btn-outline-dark rounded-5 col-auto">
                        Small
                    </button>
                    <button class="btn btn-outline-dark rounded-5 col-auto">
                        Medium
                    </button>
                    <button class="btn btn-outline-dark rounded-5 col-auto">
                        Large
                    </button>
                    <button class="btn btn-outline-dark rounded-5 col-auto">
                        X-Large
                    </button>
                    <button class="btn btn-outline-dark rounded-5 col-auto">
                        XX-Large
                    </button>
                </div>

                <form action="/cart?action=create" method="post">
                    <input type="hidden" name="productId" value="${product.getId()}">
                    <input type="hidden" name="productName" value="${product.getName()}">
                    <input type="hidden" name="productTypeId" value="${product.getProductTypeId().getProductTypeId()}">
                    <input type="hidden" name="price" value="${product.getPrice()}">
                    <input type="hidden" name="image" value="${product.getImage()}">

                    <p class="my-2">Quantity</p>
                    <div class="container border-black border-1 mb-4">
                        <div class="col-4 input-group border-black border-1">
                            <button type="button" class="btn btn-outline-dark quantity-minus">-</button>
                            <input
                                    name="quantity"
                                    style="width: 70px"
                                    class="quantity form-control text-center flex-grow-0"
                                    value="1"
                                    readonly
                            />
                            <button type="button" class="btn btn-outline-dark quantity-plus">+</button>
                        </div>
                    </div>

                    <button type="submit" class="btn bg-black w-100" style="color: white">
                        Add to cart
                    </button>
                </form>

            </div>

        </div>
    </div>
</section>


<%@include file="footer.jsp" %>

<script>
    // for increasing quantity

    document
        .querySelector(".quantity-plus")
        .addEventListener("click", function () {
            document.querySelector(".quantity-minus").disabled = false;
            let newQuantity = document.querySelector(".quantity").value;
            let num = parseInt(newQuantity);
            num += 1;
            document.querySelector(".quantity").value = num;
            document.querySelector(".quantity").textContent = num;
            console.log(num);
        });
</script>

<script>
    // for decreasing quantity
    document
        .querySelector(".quantity-minus")
        .addEventListener("click", function () {
            let newQuantity = document.querySelector(".quantity").value;
            let num = parseInt(newQuantity);
            if (num === 1) {
                document.querySelector(".quantity-minus").disabled = true;
            } else {
                num -= 1;
                document.querySelector(".quantity").value = num;
                document.querySelector(".quantity").textContent = num;
                console.log(num);
            }
        });
</script>

</body>
</html>

