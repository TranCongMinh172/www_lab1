<%--
  Created by IntelliJ IDEA.
  User: CONG MINH
  Date: 11/4/2023
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Tài Khoản</title>
    <!-- Sử dụng Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h2>Thêm Tài Khoản</h2>
                </div>
                <div class="card-body">
                    <form action="ControllerServlet" method="post">
                        <input type="hidden" name="action" value="insertAccount">
                        <div class="form-group">
                            <label for="accountId">ID</label>
                            <input type="text" id="accountId" name="accountId" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="fullName">Họ và Tên:</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Số Điện Thoại:</label>
                            <input type="text" id="phone" name="phone" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu:</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Thêm Tài Khoản</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

