/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.data;

import com.auttc.business.User;
import java.sql.*;

/**
 * Class to manipulate database for the information of user
 * 
 * @author yufeiyan
 */
public class UserDB {
    
    /**
     * To decide if user's username matches password
     * @param user User object
     * @return true if match, otherwise false;
     */
    public static User.UserType isPasswordCorrect(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT * FROM auttc_users.users "
                + "WHERE username = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUsername());
            rs = ps.executeQuery();
            
            String dbPassword;
            while (rs.next()) {
                dbPassword = rs.getString("password");
                if (dbPassword.equals(user.getPassword())) {
                    System.out.println(rs.getInt("admin"));
                    if (0 == rs.getInt("admin")) 
                    {
                        return User.UserType.USER;
                    } else {
                        
                        return User.UserType.ADMIN;
                    }
                }
            }
            return User.UserType.NONE;
            
        } catch (SQLException e) {
            System.out.println(e);
            return User.UserType.NONE;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    /**
     * To see if the email is already registered.
     * 
     * @param user User object
     * @return true if email is already registered, otherwise false.
     */
    public static boolean isEmailExist(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String query = "SELECT email FROM auttc_users.users "
                + "WHERE email = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getEmail());
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    /**
     * To register a user in database.
     * 
     * @param user User object
     * @return the number of rows affectd.
     */
    public static int inserUser(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        int count;
        
        String rowNum = "SELECT COUNT(*) FROM auttc_users.users ";
        String query = "INSERT INTO auttc_users.users (user_id, username, email, password, admin) "
                + "VALUES (?, ?, ?, ?, ?)";
        
        try{
            //get row count
            ps = connection.prepareStatement(rowNum);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
                System.out.println(count);
            } else {
                count = 0;
            }
            
            //insert new user
            ps = connection.prepareStatement(query);
            ps.setInt(1, count + 1);
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            ps.setInt(5, 0);
            
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
}
