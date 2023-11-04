<%@ page import="com.example.www_tuan1.repositories.AccountRepository" %>
<%@ page import="com.example.www_tuan1.models.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.www_tuan1.repositories.GrantAccessRepository" %>
<%@ page import="com.example.www_tuan1.models.GrantAccess" %><%--
  Created by IntelliJ IDEA.
  User: CONG MINH
  Date: 11/4/2023
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thông tin tài khoản</title>
  <!-- Sử dụng Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%

  Object obj = session.getAttribute("userName");
  if(obj == null) {
    response.sendRedirect("index.jsp");
  }
  String accountId = request.getParameter("accountId");
      AccountRepository accountRepository = new AccountRepository();
      Account account = accountRepository.findById(accountId);


%>
<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header text-center">
          <h2>Thông tin tài khoản</h2>
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
            <tr>
              <th>Thông tin</th>
              <th>Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>Account ID:</td>
              <td><%= account.getAccountId() %></td>
            </tr>
            <tr>
              <td>Full Name:</td>
              <td><%= account.getFullName() %></td>
            </tr>
            <tr>
              <td>Email:</td>
              <td><%= account.getEmail() %></td>
            </tr>
            <tr>
              <td>Phone:</td>
              <td><%= account.getPhone() %></td>
            </tr>
            <tr>
              <td>Status:</td>
              <td><%= account.getStatus() == 1 ? "Active" : "Inactive" %></td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="card-footer text-center">
          <a href="index.jsp" class="btn btn-danger">Đăng Xuất</a>
        </div>
      </div>
    </div>
  </div>
</div>


</body>
</html>