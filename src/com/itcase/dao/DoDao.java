package com.itcase.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DoDao {
    private static String USER = "root";
    private static String PASSWORD = "123456";
    private static String DB_URL = "jdbc:mysql://localhost:3306/jiaowu?useUnicode=true&characterEncoding=utf-8";
    private static String DB_DRIVER = "com.mysql.jdbc.Driver";
    private static Connection connection = null;

    //�������ݿ�
    public static Connection getConnection(){

        try {
            Class.forName(DB_DRIVER);
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (Exception e) {
            System.out.println("连接异常！");
            e.printStackTrace();
        }
        return connection;
    }
    public  static void closeConnection(Connection connection){

                    if(connection != null){
                        try {
                            connection.close(); 
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
    }