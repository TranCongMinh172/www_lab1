package com.example.www_tuan1.controllers;


import com.example.www_tuan1.models.Account;
import com.example.www_tuan1.models.GrantAccess;
import com.example.www_tuan1.models.Log;
import com.example.www_tuan1.models.Role;
import com.example.www_tuan1.repositories.AccountRepository;
import com.example.www_tuan1.repositories.GrantAccessRepository;
import com.example.www_tuan1.repositories.LogRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    private LogRepository logRepository = new LogRepository();
    private long logId;
    private AccountRepository repository = new AccountRepository();
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        if(action.equalsIgnoreCase("logOut")){
            HttpSession session = req.getSession(false);
            if(session != null) {
                session.invalidate();
            }

            logRepository.updateLogoutTime(logId, new Timestamp(System.currentTimeMillis()));
            resp.sendRedirect("index.jsp");
        } else if (action.equalsIgnoreCase("deleteAccount")){
            String idDelete = req.getParameter("accountDel");
            System.out.println(idDelete);
            repository.delete(idDelete);
            resp.sendRedirect("dashboard.jsp");

        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         repository = new AccountRepository();
       GrantAccessRepository repository1 = new GrantAccessRepository();
        String action = req.getParameter("action");
        if(action.equalsIgnoreCase("login")){
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            try {
                if(repository.authentication(username,password)){

                    List<GrantAccess> grantAccesses = repository1.getGrantAccessByAccountId(username);
                    boolean flag = true;
                    List<Role> roles =new ArrayList<>();
                    for (GrantAccess grantAccess:grantAccesses) {
                        if(grantAccess.getRole().getRoleId().equals("admin")){

                            flag = false;
                        }
                        roles.add(grantAccess.getRole());
                    }
                    if(flag){
                        resp.sendRedirect("account_infor.jsp?accountId="+ username);
                    }else {
                        resp.sendRedirect("dashboard.jsp");
                    }
                    HttpSession session = req.getSession();
                    Object[] userRole = {username, flag};

                    session.setAttribute("userName", userRole);
                    Log log = new Log();
                    logId = System.currentTimeMillis();
                    log.setId(logId);
                    log.setLoginTime(new Timestamp(logId));
                    log.setAccountId(username);
                    logRepository.insertLog(log);
                }else{
                    resp.getWriter().println("login fail");
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else if (action.equalsIgnoreCase("update")){
            String accountId = req.getParameter("accountIdGrant");
            String fullName = req.getParameter("fullName");
            String password = req.getParameter("password");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            Account account = new Account(accountId,fullName,password,email,phone);
            repository.update(account);
            resp.sendRedirect("dashboard.jsp");

        }else if(action.equalsIgnoreCase("insertAccount")){
            String accountId = req.getParameter("accountId");
            String fullName =req.getParameter("fullName");
            String password =req.getParameter("password");
            String email =req.getParameter("email");
            String phone =req.getParameter("phone");

            Account account = new Account(accountId,fullName,password, email,phone);
            try {
                if(repository.Insert(account)){
                    req.setAttribute("accounts", repository.getAll());
                    resp.sendRedirect("dashboard.jsp");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.equalsIgnoreCase("grant")) {
            GrantAccess grantAccess = new GrantAccess();
            String accountId = req.getParameter("accountIdGrant");
            String roleId = req.getParameter("grantAccess");
            grantAccess.setAccount(new Account(accountId));
            grantAccess.setRole(new Role(roleId));
            grantAccess.setGrant(true);
            repository1.insert(grantAccess);
            resp.sendRedirect("dashboard.jsp");
        }


    }
}
