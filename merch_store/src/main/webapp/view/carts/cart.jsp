<%@ page import="java.util.List" %>
<%@ page import="com.example.merch_store.model.Cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
    List<Cart> carts = (List<Cart>) request.getAttribute("carts");
   double subTotal = 0;
    for (Cart cart: carts) {
        subTotal += cart.getTotal();
    }
%>
<%@include file="header.jsp"%>

<section class="cart">
    <div class="container my-5 px-md-5 px-4">
        <div class="row justify-content-between">
            <h1 class="col-auto">Your cart</h1>
            <div class="col-auto">
                <div class="row justify-content-end">
                    <a href="/home" class="col d-block">Continue shopping</a>
                </div>
            </div>
        </div>

        <table class="table">
            <thead>
            <div class="row justify-content-between my-4">
                <p class="col-auto">PRODUCT</p>
                <p class="col-auto">TOTAL</p>
            </div>
            </thead>
            <tbody class="table-group-divider">
            <c:if test="${carts.size() == 0}"><h2>Your cart is empty!</h2></c:if>
            <c:forEach var="cart" items="${carts}">
                <tr class="row">
                    <td class="col-8">
                        <div class="card mb-3">
                            <div class="row row-cols-2 align-items-center g-0">
                                <div class="col-md-4 w-25">
                                    <img
                                            src="${cart.getImage()}"
                                            class="img-fluid rounded-start"
                                            alt="..."
                                    />
                                </div>
                                <div class="col-md-8 w-75">
                                    <div class="card-body">
                                        <div class="card-title">
                                           <a class="link link-offset-2-hover text-black fs-5"
                                              href="/products?action=details&id=${cart.getProductId()}">
                                                   ${cart.getProductName()}
                                           </a>
                                        </div>
                                        <p class="card-text">€${cart.getPrice()} EUR</p>
                                        <p class="card-text mt-2">
                                            <span class="text-body-secondary">${cart.getQuantity()} x Limited</span>
                                            <button
                                                    onclick="passIdToDelete(${cart.getCustomerId()}, ${cart.getProductId()})"
                                                    type="button"
                                                    class="btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#delete">
                                                <i
                                                        class="fa-solid fa-trash-can mx-2 text-black"
                                                        style="font-size: small"
                                                ></i>
                                            </button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="col-4 text-end"><h6>€${cart.getTotal()} EUR</h6></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div class="container">

        <form action="/orders?action=create" method="post">
            <div
                    class="row flex-row justify-content-center align-items-center justify-content-md-end">
                <p class="col-12 text-center text-md-end fs-5">
                    Subtotal € <span><%= String.format("%.2f", subTotal)  %></span> EUR
                </p>
                <p class="col-12 text-center text-md-end fw-light">
                    Tax included and shipping calculated at checkout
                </p>
                <c:if test="${carts.size() > 0}">
                    <button
                            type="submit"
                            style="color: white"
                            class="col-8 col-md-4 btn bg-black mt-4">
                        Check out
                    </button>
                </c:if>
            </div>
        </form>

    </div>
</section>


<!-- Modal delete -->
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Are you sure to remove this product from cart?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <form action="/cart?action=delete" method="post" >
                    <input type="hidden" name="customerId" id="customerId" value="">
                    <input type="hidden" name="productId" id="productId" value="">
                    <button name="no" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button name="yes" type="submit" class="btn btn-warning" data-bs-dismiss="modal">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%--modal info--%>
<div class="modal fade" tabindex="-1" id="modal-info">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${alertMessage}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/orders?action=update-info" method="post">
            <div class="modal-body">
                <div class="mb-3">
                    <label for="phoneNumber" class="col-form-label">Your phone number:</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="col-form-label">Your address:</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>

<c:if test="${alertMessage != null}">
    <script>
        // Get the modal element
        var myModal = document.querySelector("#modal-info");

        // Create a new Modal instance
        var modal = new bootstrap.Modal(myModal);

        // Show the modal
        modal.show();

    </script>
</c:if>


<!-- Modal success -->
<div class="modal fade" id="modal-success" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4>${success}</h4>
            </div>
            <div class="modal-footer">
                <button name="no" type="button" class="btn btn-info" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<c:if test="${success != null}">
    <script>
        // Get the modal element
        let myModal = document.querySelector("#modal-success");

        // Create a new Modal instance
        let modal = new bootstrap.Modal(myModal);

        // Show the modal
        modal.show();
    </script>
    <% session.removeAttribute("success"); %>
</c:if>

<script>
    function passIdToDelete(cus_id, prod_id){
        document.querySelector("#customerId").value = cus_id;
        document.querySelector("#productId").value = prod_id;
    }
</script>
</body>
</html>