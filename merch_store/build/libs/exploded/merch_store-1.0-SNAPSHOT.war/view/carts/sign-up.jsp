<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<%@include file="header.jsp" %>
<section class="sign-up">
    <div class="container">
        <div class="row flex-column align-items-center justify-content-center mt-4">
            <h1 class="col-auto mb-5">Create account</h1>
            <form class="col-10 col-lg-6" action="/signup" method="post">
                <div class="form-floating">
                    <input
                            type="text"
                            name="firstName"
                            id="firstName"
                            class="form-control"
                            placeholder="Place your first name here"
                            title="e.g: Jasmine (At least 1 character long)!"
                            pattern="^[A-Za-z]{1,15}$"
                            required />
                    <label for="firstName">First name</label>
                </div>

                <div class="form-floating mt-4">
                    <input
                            type="text"
                            name="lastName"
                            id="lastName"
                            pattern="^[A-Za-z]{1,15}$"
                            title="e.g: Heather (At least 1 character long)!"
                            class="form-control"
                            placeholder="Place your last name here"
                            required
                    />
                    <label for="lastName">Last name</label>
                </div>
                <div class="form-floating mt-4">
                    <input
                            name="email"
                            type="text"
                            id="email"
                            class="form-control"
                            pattern="^\w+@\w+.\w+"
                            title="e.g: hannah@gmail.com (Must contain no spaces!)"
                            placeholder="Place your email here"
                            required
                    />
                    <label for="email">Email</label>
                </div>

                <div class="form-floating mt-4">
                    <input
                            name="password"
                            type="password"
                            id="password"
                            class="form-control"
                            title="Must contain at least 6 characters long and no spaces!"
                            pattern="^\S{6,}$"
                            placeholder="Place your password here"
                            required
                    />
                    <label for="password">Password</label>
                </div>
                <div class="form-floating mt-4">
                    <input
                            name="cfPassword"
                            type="password"
                            id="cfPassword"
                            class="form-control"
                            title="Must contain at least 6 characters long and no spaces!"
                            oninput="checkConfirmPassword()"
                            pattern="^\S{6,}$"
                            placeholder="Place your password here"
                            required
                    />
                    <label for="cfPassword">Confirm Password</label>
<%--                    to show message if passwords do not match--%>
                    <span class="cfPassword-error mt-2" style="color: red; display: none;">Passwords do not match!</span>
                </div>

                <c:if test="${message != null}">
                    <div class="messages mt-2" style="display: block">
                        <h6 class="alert alert-danger" role="alert">${message}</h6>
                    </div>
                </c:if>

                <div class="row flex-column justify-content-center align-items-center">
                    <button type="submit" class="col-auto btn bg-black mt-5 py-2 px-5 text-white create-btn">Create</button>
                </div>
            </form>
        </div>
    </div>
</section>

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

<%@include file="footer.jsp" %>

<script>
    function checkConfirmPassword(){
        console.log("im here")
        let password = document.querySelector("#password");
        let cfPassword = document.querySelector("#cfPassword");
        let createBtn = document.querySelector(".create-btn");
        let cfPasswordMessage =  document.querySelector(".cfPassword-error")
        if (password.value !== cfPassword.value){
            cfPasswordMessage.style.display = "block"
            createBtn.disabled = true;
        } else {
            cfPasswordMessage.style.display = "none"
            createBtn.disabled = false;
        }
    }
</script>

<script>
    setTimeout( function (){
        document.querySelector(".messages").style.display = "none";
    }, 3000)
</script>

</body>
</html>

