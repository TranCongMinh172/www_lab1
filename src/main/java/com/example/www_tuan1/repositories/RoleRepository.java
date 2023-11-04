package com.example.www_tuan1.repositories;

import com.example.www_tuan1.models.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class RoleRepository {
 public Optional<Role> findById(String id) throws SQLException {
     String sql = "select *from role where role_id = ?";
     Connection con = Connect.getInstance().getConnection();
     PreparedStatement ps = null;
     try {
         ps = con.prepareStatement(sql);
         ps.setString(1,id);
         ResultSet rs = ps.executeQuery();
         while(rs.next()){
             Role role = new Role();
             role.setRoleName(rs.getString(1));
             role.setDescription(rs.getString(2));
             role.setStatus(rs.getInt(3));
             role.setRoleId(rs.getString(4));
             return Optional.of(role);
         }
     } catch (SQLException e) {
         throw new RuntimeException(e);
     }
     return  Optional.empty();


 }

}
