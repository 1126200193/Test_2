package com.itcase.dao;
import java.sql.*;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import com.itcase.user.User;

public class updateDao {
	Connection connection = null;
    PreparedStatement pstmt = null;
    PreparedStatement ps = null;
    User user = null;
    private String SQL =""; 
    public User login(String number, String password, String idcard ){    	
    		SQL = "select * from student where number = ? and idcard = ?";
            try {
                connection = DoDao.getConnection();
                pstmt = (PreparedStatement) connection.prepareStatement(SQL);
                pstmt.setString(1, number);
                pstmt.setString(2, idcard);
                ResultSet rSet = (ResultSet) pstmt.executeQuery();
                if(rSet.next()){ 
                	String sql = "update student set password=? where number=?";
                	 ps = (PreparedStatement) connection.prepareStatement(sql);
        			ps.setString(1, password);
        			ps.setString(2, number);
        			ps.executeUpdate();
                    user = new User();
                    user.setNumber(rSet.getString("number"));
                    user.setIdcard(rSet.getString("idcard"));
                }
                    
                connection.close();
                pstmt.close();  
            }                     
    	catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            DoDao.closeConnection(connection);
        }
        return user;
    }
    }
    
  
