<%@ page import="com.example.team4.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.team4.model.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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


<%@include file="header.jsp"%>
<% Customer currentCustomer = (Customer) session.getAttribute("currentCustomer");
    List<Order> orders = (List<Order>) session.getAttribute("orders");
%>

<section class="account-order mt-3">
    <div class="container">
        <h1>Account</h1>
        <div>
            <i class="far fa-user fs-5"></i>
            <a href="/logout" class="text-black mx-2" onclick="preventBackButton()">Log out</a>
        </div>
    </div>

    <div class="container mt-5">
        <div class="row row-cols-lg-2 row-cols-1 ">
            <div class="col-auto order col-lg-8">

                <c:if test="${message != null}">
                    <div class="alert alert-danger message-delete" role="alert">
                        ${message}
                    </div>
                </c:if>

                <h3>Order history
                    <button
                            type="button"
                            class="btn"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteOrder">
                        <i class="fa-solid fa-trash-can fs-6 mx-4"></i>
                    </button>
                </h3>
                <table class="table">
                    <c:if test="${orders.size() == 0}">
                        <h5 class="mt-5">You haven't placed any order!</h5>
                    </c:if>

                    <c:if test="${orders.size() > 0}">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Time</th>
                            <th>Order Class</th>
                            <th>Delivery by</th>
                            <th>Order Status</th>
                        </tr>
                        </thead>
                    </c:if>

                    <tboby>

                        <c:forEach var="order" items="<%= orders %>">
                            <tr>
                                <td>${order.getId()}</td>
                                <td>${order.getOrderTime()}</td>
                                <td>Online store</td>
                                <td>GHN</td>
                                <td>${order.getStatus()}</td>
                            </tr>
                        </c:forEach>

                    </tboby>
                </table>
            </div>

            <div class="col-12 account col-lg-4 mt-lg-0 mt-4">
                <h3>Account details
                    <button
                            type="button"
                            class="btn"
                            data-bs-toggle="modal"
                            data-bs-target="#editAccount"
                    >
                        <i class="fa-solid fa-pen fs-6"></i>
                    </button>
                    <button
                            type="button"
                            class="btn"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteAccount"
                    >
                        <i class="fa-solid fa-trash-can fs-6"></i>
                    </button>
                </h3>
                <hr>
                <h6>Name:
                    <span class="fw-light"> <%= currentCustomer.getFullName()%> </span></h6>
                <h6>Email:
                    <span class="fw-light"><%= currentCustomer.getEmail()%></span></h6>
                <h6>Phone:
                    <span class="fw-light"><%= currentCustomer.getPhone()%></span></h6>
                <h6>Address:
                    <span class="fw-light"><%= currentCustomer.getAddress()%></span></h6>
            </div>

        </div>
    </div>
</section>

<%@include file="footer.jsp"%>

<!-- Modal delete account-->
<div class="modal fade" id="deleteAccount" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel1">Are you sure to delete this account?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <form action="/account?action=delete" method="post">
                    <button name="no" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button name="yes" type="submit" class="btn btn-danger" data-bs-dismiss="modal">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal edit account-->
<div
        class="modal fade"
        id="editAccount"
        tabindex="-1"
        aria-labelledby="exampleModalLabel2"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel2">
                    Fill in this form to edit your account!
                </h1>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <form action="/account?action=edit" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="firstName" class="col-form-label">First name:</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required/>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="col-form-label">Last name:</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required/>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="col-form-label">Phone number:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required/>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="col-form-label">Address:</label>
                        <input type="text" class="form-control" id="address" name="address" required/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button
                            name="no"
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">
                        Close
                    </button>
                    <button name="yes" type="submit" class="btn btn-success">
                        Save changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal delete order-->
<div class="modal fade" id="deleteOrder" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Enter order ID here to delete:</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/orders?action=delete" method="post">
                    <input type="text" class="form-control mb-3" id="orderId" name="orderId"/>
                    <button name="no" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button name="yes" type="submit" class="btn btn-warning" data-bs-dismiss="modal">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

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
    function preventBackButton(){
        // history.pushState(null, null, location.href);
        // window.onpopstate = function () {
        //     history.go(1);
        // };
        <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Expires", "0"); %>
        history.forward()

    }
</script>
<script>
    setTimeout(function (){
        document.querySelector(".message-delete").style.display = "none";
    }, 3000)
</script>

</body>
</html>
