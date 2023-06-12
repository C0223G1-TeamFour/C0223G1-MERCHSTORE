<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/1/2023
  Time: 6:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
            crossorigin="anonymous"></script>
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
</head>
<style>
    .pagination {
        float: right;
    }
    .content {
        margin-left: 50px;
        margin-right: 50px;
    }
    .email{
        box-sizing: border-box;
    }
    table {
        border-collapse: collapse;
        margin: 0;
        padding: 0;
        width: 100%;
        table-layout: fixed;
    }
    table caption {
        font-size: 1.5em;
        margin: .5em 0 .75em;
    }
    table tr {
        padding: .35em;
    }
    table th,
    table td {
        padding: .625em;
        text-align: center;
    }
    @media screen and (max-width: 600px) {
        table {
            border: 0;
        }
        .content {
            margin: 0;
        }
        table thead {
            border: none;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }
        table tr {
            border-bottom: 3px solid #ddd;
            display: block;
            margin-bottom: .625em;
        }
        table td {
            border-bottom: 1px solid #ddd;
            display: block;
            font-size: .8em;
            text-align: right;
        }
        table td::before {
            /*
            * aria-label has no advantage, it won't be read inside a table
            content: attr(aria-label);
            */
            content: attr(data-label);
            float: left;
            font-weight: bold;
            text-transform: uppercase;
        }
        table td:last-child {
            border-bottom: 0;
        }
        .search {
            margin-top: 20px;
        }
    }
</style>
<body>
<%@include file="/view/carts/store-header.jsp" %>
<div class="container px-2">
    <div class=" row mb-4">
        <div class="col-md-5 col-sm-6">
            <a href="/customer?action=create">
                <button type="button" class="btn btn-dark">
                    ADD NEW CUSTOMER
                </button>
            </a>
        </div>
        <form class="col-md-7 col-sm-10" action="/employee?action=search" method="post">
            <div class="row">
                <div class="col-xl-1 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-4 col-md-8">
                    <input type="name" id="inputPassword6" class="form-control border-2 border-dark btn-primary"
                           name="name">
                </div>
                <div class="col-xl-1 col-md-3">
                    <label for="address" class="col-form-label"><span>Address</span></label>
                </div>
                <div class="col-xl-4 col-md-8">
                    <input type="text" name="address" id="address" class="form-control border-2 border-dark btn-primary"
                           aria-describedby="passwordHelpInline">
                </div>
                <div class="col-xl-2 col-md-1 search">
                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <h2 class="mt-3"> CUSTOMERS LIST </h2>
    <table class="table table-bordered " id="tableUser">
        <thead class="table-dark ">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID CUSTOMER</th>
            <th scope="col" class="col-2">NAME</th>
            <th scope="col">PHONE</th>
            <th scope="col" class="col-2">EMAIL</th>
            <th scope="col">ADDRESS</th>
            <th scope="col">EDIT</th>
            <th scope="col">DELETE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer" varStatus="status">
            <tr>
                <td>
                    <c:out value="${status.count}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getId()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getName()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getPhoneNumber()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getEmail()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getAddress()}"></c:out>
                </td>
                <td>
                    <a href="/customer?action=edit&id=${customer.getId()}&account=${customer.getAccountId()}">
                        <button type="submit" class="btn btn-primary" ><i class="fa-solid fa-pen-to-square"></i>
                        </button>
                    </a>
                </td>
                <td>
                    <button type="button" onclick="isDelete('${customer.getId()}','${customer.getName()}')"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#button-delete">
                        <i class="fa-solid fa-trash-can"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="modal " tabindex="-1" id="button-delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">DELETE CUSTOMER</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Are You Sure To Delete Customer with the Name: <span style="color: red" id="alert_delete"></span></h4>
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
<%--modal success--%>
<div class="modal fade" id="modal-success" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4><i class="fa-solid fa-square-check"></i>${message}</h4>
            </div>
            <div class="modal-footer">
                <button name="no" type="button" class="btn btn-info" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<c:if test="${message != null}">
    <script>
        // Get the modal element
        let myModal = document.querySelector("#modal-success");
        // Create a new Modal instance
        let modal = new bootstrap.Modal(myModal);
        // Show the modal
        modal.show();
    </script>
</c:if>
<%@include file="/view/carts/footer.jsp" %>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableUser').dataTable({
            "bInfo": false,
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    function isDelete(id, name) {
        document.getElementById("alert_delete").innerText = name;
        document.getElementById("is_delete").value = id;
    }
</script>
</div>
</body>
</html>