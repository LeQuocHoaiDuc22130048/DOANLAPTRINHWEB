<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>EyeStyle</title>
    <jsp:include page="../Link.jsp"/>
</head>
<body>
<c:import url="../Header.jsp"/>
<section class="section-content container-fluid mt-100">
    <div class="card mx-auto " style="max-width: 520px">
        <article class="card-body">
            <header class="mb-4"><h4 class="card-title text-center">Edit profile</h4></header>
            <form action="" method="POST" enctype="multipart/form-data">
                <div class="form-group mb-3">
                    <label for="fullname">Full name </label>
                    <input id="fullname"
                           name="FirstName"
                           type="text"
                           class="form-control"
                           value=""
                           maxlength="255"
                           autofocus
                           required
                    />
                </div>
                <div class="form-group mb-3">
                    <label>Email</label>
                    <label for="email"></label><input
                        id="email"
                        name="Email"
                        type="email"
                        class="form-control"
                        value=""
                        required
                />
                    <p id="error-email" style="color: red; display: none">
                        Email invalid
                    </p>
                </div>
                <div class="form-group mb-3">
                    <label for="phone">Phone </label>
                    <input type="text" id="phone" name="Phone" value="" required
                           class="form-control"/>
                    <span id="error-phone" style="color: red; display: none;"></span>


                </div>
                <div class="form-row row  mb-3">
                    <div class="form-group col-md-6">
                        <label for="password">Password:</label>
                        <input
                                required
                                type="password"
                                name="password"
                                id="password"
                                class="form-control"
                        />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Confirm password</label>
                        <label for="Checkpassword"></label><input
                            id="Checkpassword"
                            name="Checkpassword"
                            class="form-control"
                            type="password"
                            required
                    />

                    </div>

                </div>
                <div class="form-group mb-3">
                    <label>Avatar</label>
                    <input
                            id="avatar"
                            name="avatar"
                            class="form-control"
                            type="file"
                            accept="image/*"
                            required
                    />

                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block float-end">
                        Update Profile
                    </button>
                </div>
            </form>
        </article>
        <!-- card-body.// -->
    </div>
    <!-- card .// -->
    <br/><br/>
</section>
<c:import url="../Script.jsp"/>
</body>
</html>
