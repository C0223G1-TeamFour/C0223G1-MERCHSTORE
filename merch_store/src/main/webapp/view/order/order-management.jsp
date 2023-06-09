<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <style>
        #modal-body {

        }
    </style>
    <c:import url="/view/carts/store-header.jsp"></c:import>
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
</head>
<body>
<div class="container px-2">
    <div class="row mb-4">
        <form class="col-md-8 col-sm-10" action="/orders?action=search" method="post">
            <div class="row">
                <div class="col-xl-2 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-3 col-md-8">
                    <input type="name" id="inputPassword6" class="form-control" name="name">
                </div>
                <div class="col-xl-2 col-md-1 search">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>

<table class="table table-bordered" id="tableOrder">
    <thead class="table-dark">
    <tr>
        <th scope="col">STT</th>
        <th scope="col">ORDER ID</th>
        <th scope="col">ORDER DATE</th>
        <th scope="col">CUSTOMER</th>
        <th scope="col">STATUS</th>
        <th scope="col">TOTAL PRICE</th>
        <th scope="col">ORDER DETAIL</th>
        <th scope="col">DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderManagement}" var="orders" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${orders.id}</td>
            <td>${orders.date}</td>
            <td>${orders.customer.getName()}</td>
            <td>${orders.status}</td>
            <td>${integerMap.get(orders.id)} EUR</td>
            <td>
                <button type="submit" class="btn">
                    <a class="btn btn-outline-secondary"
                       href="/orders?action=details&id=${orders.id}">DETAILS</a>
                </button>

            <td>
                <button type="button" class="btn btn-primary" style="background-color: red; align-content: center"
                        data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="remove(${orders.id},'${orders.customer.getName()}')">
                    <i class="fa-solid fa-trash-can"></i>
                </button>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE ORDER</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h3>Are You Sure Delete The Order With The Name:
                    <span style="color:red" id="nameDelete">?</span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/orders?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                    <button type="submit" class="btn btn-primary">YES</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>


<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="bootstrap520/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#tableOrder').dataTable({
            "bInfo": false,
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function remove(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
<c:import url="/view/carts/footer.jsp"></c:import>
</div>
</body>

</html>
