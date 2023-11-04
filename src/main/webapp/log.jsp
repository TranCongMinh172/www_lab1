<%@ page import="com.example.www_tuan1.repositories.LogRepository" %>
<%@ page import="com.example.www_tuan1.models.Log" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CONG MINH
  Date: 11/4/2023
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Lịch sử đăng nhập</title>
  <!-- Sử dụng Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
  String accountId = request.getParameter("accountId");
  LogRepository logRepository = new LogRepository();
  List<Log> logs = logRepository.getLogsByAccountId(accountId);
%>
<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header text-center">
          <h2>Lịch sử đăng nhập</h2>
        </div>
        <div class="card-body">
          <table class="table table-bordered">
            <thead>
            <tr>
              <th>Log ID</th>
              <th>Account ID</th>
              <th>Login Time</th>
              <th>Logout Time</th>
              <th>Notes</th>
            </tr>
            </thead>
            <tbody>
            <% for (Log log: logs) {

            %>
            <tr>
              <td><%= log.getId() %></td>
              <td><%=log.getAccountId()%></td>
              <td><%= log.getLoginTime() %></td>
              <td><%= log.getLogoutTime() %> </td>
              <td><%= log.getNotes() %></td>
            </tr>
            <%}%>


            <!-- Thêm dòng cho mỗi bản ghi trong lịch sử đăng nhập -->
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


