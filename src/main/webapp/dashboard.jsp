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
  <title>Dashboard  </title>
  <!-- Sử dụng Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%--<%--%>

<%--  Object obj = session.getAttribute("userName");--%>
<%--  if(obj == null) {--%>
<%--    response.sendRedirect("index.jsp");--%>
<%--  }--%>
<%--  AccountRepository accountRepository = new AccountRepository();--%>
<%--  List<Account> accounts = accountRepository.getAll();--%>


<%--%>--%>
<div class="container">
  <%
    Object obj = session.getAttribute("userName");
    if(obj == null) {
      response.sendRedirect("index.jsp");
    } else {
      Object[] userRole = (Object[]) obj;
      boolean isAdmin = (boolean) userRole[1];
      if(isAdmin) { %>
  <h1>Bạn không có quyền truy cập trang này</h1>
  <a href="${pageContext.request.contextPath}/index.jsp">Quay lại trang đăng nhập</a>
  <% }
  else {

    AccountRepository accountRepository = new AccountRepository();
    String accountLogin = userRole[0].toString();
    List<Account> accounts = accountRepository.getAll();
  %>
  <div class="row justify-content-center mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <h2 class="text-center">Thông tin tài khoản</h2>
        </div>
        <div class="card-body">
          <table class="table table-striped table-hover table-bordered">
            <thead>
            <tr>
              <th>Account ID</th>
              <th>Full Name</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Status</th>
              <th>Chức năng</th>
            </tr>
            </thead>
            <tbody>
            <%
              for (Account account : accounts) {
            %>
            <tr>
              <td><%= account.getAccountId() %></td>
              <td><%= account.getFullName() %></td>
              <td><%= account.getEmail() %></td>
              <td><%= account.getPhone() %></td>
              <td><%= account.getStatus() == 1 ? "Active" : "Inactive" %></td>
              <td>
                <a href="grantAccess.jsp?accountId=<%= account.getAccountId() %>" class="btn btn-success">Grant Access</a>
                <a href="${pageContext.request.contextPath}/edit.jsp?accountId=<%= account.getAccountId() %>" class="btn btn-info">Edit</a>
                <a href="ControllerServlet?action=deleteAccount&accountDel=<%= account.getAccountId() %>" class="btn btn-danger">Delete</a>
              </td>
            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
        <div class="card-footer text-center">
          <a href="addAccount.jsp" class="btn btn-primary">Create New Account</a>
          <a href="${pageContext.request.contextPath}/log.jsp?accountId=<%=accountLogin%>" class="btn btn-secondary">Lịch sử đăng nhập</a>
          <a href="index.jsp" class="btn btn-danger">Đăng Xuất</a>
        </div>
      </div>
    </div>
  </div>
  <%}%>
  <%}%>
</div>
</body>
</html>