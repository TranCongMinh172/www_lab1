package com.example.www_tuan1.repositories;

import com.example.www_tuan1.models.Log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class LogRepository {
    private final Connection conn = Connect.getInstance().getConnection();

    public boolean insertLog(Log log) {
        String sql = "insert into log(id, account_id, login_time) values(?, ?, ?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, log.getId());
            ps.setString(2, log.getAccountId());
            ps.setTimestamp(3, log.getLoginTime());
            ps.executeUpdate();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    public void updateLogoutTime(Long id, Timestamp logoutTime) {
        String sql = "update log set logout_time = ? where id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, logoutTime);
            ps.setLong(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Log> getLogsByAccountId(String accountId) {
        String sql = "select * from log where account_id = ?";
        List<Log> logs = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, accountId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                long logId = rs.getLong(1);
                String account = rs.getString(2);
                Timestamp loginTime = rs.getTimestamp(3);
                Timestamp logoutTime = rs.getTimestamp(4);
                String notes = rs.getString(5);
                Log log = new Log(logId, accountId, loginTime, logoutTime, notes);
                logs.add(log);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logs;
    }
}
