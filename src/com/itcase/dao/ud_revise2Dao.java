package com.itcase.dao;
import java.sql.*;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import com.itcase.user.User;

public class ud_revise2Dao {
	Connection connection = null;
    PreparedStatement pstmt = null;
    PreparedStatement ps = null;
    User user = null;
    private String SQL =""; 
    public User login(int id, String number,String name,String sex,String idcard,String age,String telephone,String graduationtime,String admissiondate,String education,String Department,String major,String subject,String schoolclass){    	
    		SQL = "select * from student where id = ?";
            try {
                connection = DoDao.getConnection();
                pstmt = (PreparedStatement) connection.prepareStatement(SQL); 
                pstmt.setInt(1, id);
                ResultSet rSet = (ResultSet) pstmt.executeQuery();
                if(rSet.next()){ 
                	String sql = "update student set number=?,name=?,sex=?,idcard=?,age=?,telephone=?,graduationtime=?,admissiondate=?,education=?,Department=?,major=?,subject=?,schoolclass=? where id=?";
                	ps = (PreparedStatement) connection.prepareStatement(sql);
        			ps.setString(1, number);
        			ps.setString(2, name);
        			ps.setString(3, sex);
        			ps.setString(4, idcard);
        			ps.setString(5, age);
        			ps.setString(6, telephone);
        			ps.setString(7, graduationtime);
        			ps.setString(8, admissiondate);
        			ps.setString(9, education);
        			ps.setString(10, Department);
        			ps.setString(11, major); 
        			ps.setString(12, subject);
        			ps.setString(13, schoolclass);        			
        			ps.setInt(14, id);
        			ps.executeUpdate();
                    user = new User();
                    user.setNumber(rSet.getString("number"));
                    user.setId(rSet.getInt("id"));
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
    
  
