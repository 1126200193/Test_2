package com.itcase.dao;
import java.sql.*;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import com.itcase.user.User;

public class up_personDao {
	Connection connection = null;
    PreparedStatement pstmt = null;
    PreparedStatement ps = null;
    User user = null;
    private String SQL =""; 
    public User login( String number,String name,String sex,String idcard,String age,String telephone){    	
    		SQL = "select * from student where number = ?";
            try {
                connection = DoDao.getConnection();
                pstmt = (PreparedStatement) connection.prepareStatement(SQL); 
                pstmt.setString(1, number);
                ResultSet rSet = (ResultSet) pstmt.executeQuery();
                if(rSet.next()){ 
                	String sql = "update student set name=?,sex=?,idcard=?,age=?,telephone=? where number=?";
                	ps = (PreparedStatement) connection.prepareStatement(sql);
        			ps.setString(1, name);
        			ps.setString(2, sex);
        			ps.setString(3, idcard);
        			ps.setString(4, age);
        			ps.setString(5, telephone);
        			ps.setString(6, number);
        			ps.executeUpdate();
                    user = new User();
                    user.setNumber(rSet.getString("number"));
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
    
  
