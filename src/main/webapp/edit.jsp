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
    <title>edit  </title>
    <!-- Sử dụng Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%

    Object obj = session.getAttribute("userName");
    if(obj == null) {
        response.sendRedirect("index.jsp");
    }

    // Lấy thông tin tài khoản cần chỉnh sửa
    String accountId = request.getParameter("accountId");
    AccountRepository accountRepository = new AccountRepository();
    Account account = accountRepository.findById(accountId);

%>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Chỉnh sửa thông tin tài khoản</h2>
                </div>
                <div class="card-body">
                    <form action="ControllerServlet" method="post">
                        <div class="form-group">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="accountIdGrant" value="<%=account.getAccountId()%>">
                            <label for="fullName">Full Name:</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" value="<%= account.getFullName() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" class="form-control" value="<%= account.getPassword() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" value="<%= account.getEmail() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="text" id="phone" name="phone" class="form-control" value="<%= account.getPhone() %>" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
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
