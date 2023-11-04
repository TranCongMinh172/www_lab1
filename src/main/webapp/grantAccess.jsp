<%@ page import="com.example.www_tuan1.repositories.AccountRepository" %>
<%@ page import="com.example.www_tuan1.models.Account" %>
<%@ page import="com.example.www_tuan1.repositories.GrantAccessRepository" %>
<%@ page import="com.example.www_tuan1.models.GrantAccess" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CONG MINH
  Date: 11/4/2023
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấp Quyền Truy Cập</title>
    <!-- Sử dụng Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("index.jsp");
    }
    String id = request.getParameter("accountId");
    System.out.println(id);
    AccountRepository accountRepository = new AccountRepository();
    Account account = accountRepository.findById(id);
    GrantAccessRepository grantAccessRepository = new GrantAccessRepository();
    List<GrantAccess> grantAccesses = grantAccessRepository.getGrantAccessByAccountId(id);
    System.out.println(grantAccesses);

%>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header text-center">
                    <h2>Thông tin tài khoản</h2>
                </div>
                <div class="card-body">
                    <form action="ControllerServlet" method="post">
                        <input type="hidden" name="action" value="grant">
                        <input type="hidden" name="accountIdGrant" value="<%=account.getAccountId()%>">
                        <table class="table table-striped">
                            <tr>
                                <th>Account ID:</th>
                                <td><%= account.getAccountId() %></td>
                            </tr>
                            <tr>
                                <th>Full Name:</th>
                                <td><%= account.getFullName() %></td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td><%= account.getEmail() %></td>
                            </tr>
                            <tr>
                                <th>Phone:</th>
                                <td><%= account.getPhone() %></td>
                            </tr>
                            <tr>
                                <th>Status:</th>
                                <td><%= account.getStatus() == 1 ? "Active" : "Inactive" %></td>
                            </tr>
                            <tr>
                                <th>Role:</th>
                                <% for (GrantAccess grantAccess : grantAccesses) {%>
                                <td><%=grantAccess.getRole().getRoleId()%></td>

                                <%}%>
                            </tr>
                            <tr>
                                <th>Cấp quyền:</th>
                                <td>
                                    <select id="grantAccess" name="grantAccess">
                                        <option value="user">user</option>
                                        <option value="admin">admin</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <button type="submit" class="btn btn-primary">Cấp quyền</button>
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

