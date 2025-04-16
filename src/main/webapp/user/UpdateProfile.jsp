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
    <c:import url="/Link.jsp"/>
    <link href="<c:url value="/assets/css/Upload.css"/>">
</head>
<body>
<c:import url="/Header.jsp"/>
<c:set var="user" value="${requestScope.user}"/>
<section class="section-content container-fluid mt-100">
    <div class="card mx-auto " style="max-width: 520px">
        <article class="card-body">
            <header class="mb-4"><h4 class="card-title text-center">Edit profile</h4></header>
            <form action="" class="absolute_center flex-column" method="POST" enctype="multipart/form-data">
                <div class="rounded-circle">
                    <img class="rounded-circle shadow-4" id="avatar"
                         style="width: 150px;" alt="user avatar " src="${context}/${user.getAvatar()}"/>
                </div>
                <div class="form-group mb-3 d-none">
                    <input
                            id="fileInput"
                            name="avatar"
                            class="form-control"
                            type="file"
                            accept="image/*"
                            required
                    />

                </div>
                <div class="form-group mb-3 w-100">
                    <label for="username">User name </label>
                    <input id="username"
                           name="name"
                           type="text"
                           class="form-control"
                           maxlength="255"
                           autofocus
                           required
                           value="${user.getName()}"
                    />
                </div>
                <div class="form-group mb-3 w-100">
                    <label>Email</label>
                    <label for="email"></label><input
                        id="email"
                        name="Email"
                        type="email"
                        class="form-control"
                        required
                        value="${user.getEmail()}"
                />
                    <p id="error-email" style="color: red; display: none">
                        Email invalid
                    </p>
                </div>
                <div class="form-group mb-3 w-100">
                    <label for="phone">Phone </label>
                    <input type="text" id="phone" name="Phone"  required
                           value="${user.getPhone()}"
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

                <div class="mb-3 w-100">
                    <label for="province" class="form-label">Tỉnh / Thành phố:</label>
                    <select id="province" name="Province" class="form-select" required>
                        <option value="">-- Province --</option>
                    </select>
                </div>

                <div class="mb-3 w-100">
                    <label for="district" class="form-label">Quận / Huyện:</label>
                    <select id="district" name="District" class="form-select" required disabled>
                        <option value="">-- District --</option>
                    </select>
                </div>

                <div class="mb-3 w-100">
                    <label for="ward" class="form-label">Phường / Xã:</label>
                    <select id="ward" name="Ward" class="form-select" required disabled>
                        <option value="">-- Ward--</option>
                    </select>
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
<c:import url="/Script.jsp"/>
<script src="<c:url value="/assets/js/InputList.js"/>"></script>
</body>
</html>
