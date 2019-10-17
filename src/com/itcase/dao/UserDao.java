package com.itcase.dao;
import java.sql.*;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import com.itcase.user.User;

public class UserDao {
	Connection connection = null;
    PreparedStatement pstmt = null;
    User user = null;
    private String SQL =""; 
    public User login(String number, String password, String select ){
    	if(select.equals("Stu"))
    		SQL = "select * from student where number = ? and password = ?";
    	else if(select.equals("Admin"))
            SQL = "select * from admin where number = ? and password = ?";
            try {
                connection = DoDao.getConnection();
                pstmt = (PreparedStatement) connection.prepareStatement(SQL);
                //这里的意思将用户名和密码填到SQL语句的问号处
                pstmt.setString(1, number);
                pstmt.setString(2, password);
                ResultSet rSet = (ResultSet) pstmt.executeQuery();//得到数据库的查询结果,一个数据集
                //判断结果集是否有效
                if(rSet.next()){             	
                    user = new User();
                    user.setNumber(rSet.getString("number"));
                    user.setPassword(rSet.getString("password"));
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
    
  
