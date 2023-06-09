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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
    .pagination {
        float: right;
    }

    .content {
        margin-left: 50px;
        margin-right: 50px;
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
        <div class="col-md-2 col-sm-6">
            <a href="/customer?action=create">
                <button type="button" class="btn btn-success">
                    ADD CUSTOMER
                </button>
            </a>
        </div>
        <div class="col-md-2 col-sm-0"></div>
        <form class="col-md-8 col-sm-10" action="/employee?action=search" method="post">
            <div class="row">
                <div class="col-xl-2 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-3 col-md-8">
                    <input type="name" id="inputPassword6" class="form-control" name="name">
                </div>
                <div class="col-xl-2 col-md-3">
                    <label for="address" class="col-form-label"><span>Address</span></label>
                </div>
                <div class="col-xl-3 col-md-8">
                    <input type="text" name="address" id="address" class="form-control"
                           aria-describedby="passwordHelpInline">
                </div>
                <div class="col-xl-2 col-md-1 search">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <table class="table table-bordered " id="tableUser">
        <thead class="table-dark ">
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Id Customer</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Action</th>
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
                    <c:out value="${customer.getEmail()}"></c:out>
                </td>
                <td>
                    <c:out value="${customer.getAddress()}"></c:out>
                </td>
                <td>
                    <div class="row">
                        <div class="col-auto">
                            <button type="button" onclick="isDelete('${customer.getId()}','${customer.getName()}')"
                                    class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#button-delete">DELETE
                            </button>
                        </div>
                    </div>
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
                <h5 class="modal-title">Xóa Khách Hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Bạn muốn xóa khách hàng tên <span id="alert_delete"></span></h4>
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

