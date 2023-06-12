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
                .center {
                    text-align: center;
                }
            }

        </style>
</head>
<body>
<div class="container px-2">
    <div class="row mb-4">
        <div class="col-6 mb-3"></div>
        <form class="col-6 mb-3" action="/orders?action=search" method="post">
            <div class="row">
                <div class="col-xl-1 col-md-3">
                    <label for="inputPassword6" class="col-form-label"><span>Name</span></label>
                </div>
                <div class="col-xl-4 col-md-8">
                    <input type="name" id="inputPassword6" class="form-control border-2 border-dark btn-primary"
                           name="name">
                </div>
                <div class="col-xl-1 col-md-3">
                    <label for="status" class="col-form-label"><span>Status</span></label>
                </div>
                <div class="col-xl-4 col-md-8 m-lg-0">
                    <select name="status" class="form-select border-2 border-dark btn-primary" id="status"
                            aria-label="Default select example">
                        <option value="processing">Processing</option>
                        <option value="complete">Complete</option>
                    </select>
                </div>
                <div class="col-xl-2 col-md-1 search">
                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <h2 class="mt-3"> ORDERS LIST </h2>
    <table class="table table-bordered" id="tableOrder">
        <thead class="table-dark">
        <tr>
            <th class="center" scope="col" class="columnn">STT</th>
            <th class="center" scope="col">ORDER ID</th>
            <th class="center" scope="col">ORDER DATE</th>
            <th class="center" scope="col">CUSTOMER</th>
            <th class="center" scope="col">STATUS</th>
            <th class="center" scope="col">TOTAL PRICE</th>
            <th class="center" scope="col">ORDER DETAIL</th>
            <th class="center" scope="col">DELETE</th>
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
                    <button type="button" class="btn btn-danger" style="align-content: center"
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

<!-- Modal delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE ORDER</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Are You Sure Delete The Order With The Name:
                    <span style="color:red" id="nameDelete">?</span>
                </h4>
            </div>
            <div class="modal-footer">
                <form action="/orders?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
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

<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
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
<script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<c:import url="/view/carts/footer.jsp"></c:import>
</div>
</body>

</html>
