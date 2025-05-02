<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Quên mật khẩu</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link
      rel="shortcut icon"
      href="assets/images/Website/logo.png"
      type="image/x-icon"
    />
<c:import url="Link.jsp"/>
  </head>
  <body>
    <div class="container d-flex justify-content-between align-items-center p-0">
      <img class="img-thumbnail border-0" style="width: 45%" src="assets/images/background-dangnhap/quen_mk.png" alt="" />
     <div class="container">
       <form class="absolute_center flex-column">
         <div class="mb-3">
           <h1 class="mb-4">Forgot password </h1>
           <p class="text-center text-secondary-emphasis">enter your otp , you shall reset password </p>
         </div>
         <div class="input-group mb-3 w-75">
           <span class="input-group-text" id="basic-addon1">Email</span>
           <input type="email" class="form-control" placeholder="Enter your email address" aria-label="Username" aria-describedby="basic-addon1">
         </div>
         <div class="input-group mb-3 w-75">
           <span class="input-group-text" id="button-addon2">OTP</span>
           <input type="text" class="form-control" placeholder="Enter your OTP" aria-label="Recipient's username" aria-describedby="button-addon2">
         </div>
       <div class="mt-4">
         <a class="btn btn-primary" type="button">Get OTP</a>
         <button type="submit" class="btn btn-primary">Submit</button>
       </div>
       </form>
     </div>
    </div>
  </body>
</html>
