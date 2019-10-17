package com.itcase.selvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itcase.dao.ud_revise2Dao;
import com.itcase.user.User;

@WebServlet("/ud_revise2")
public class ud_revise2 extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String idStr = request.getParameter("id");
        Integer id = Integer.valueOf(idStr).intValue(); 
        
        String number = request.getParameter("number");
        
        String name = request.getParameter("name"); 

        String sex = request.getParameter("sex");
        
        String age = request.getParameter("age");
        
        String idcard = request.getParameter("idcard");
        
        String schoolclass = request.getParameter("schoolclass");    
        String telephone = request.getParameter("telephone");
        
        String admissiondate = request.getParameter("admissiondate");
        String graduationtime = request.getParameter("graduationtime");
        
        String education = request.getParameter("education");
        
        String Department = request.getParameter("Department");
      
        String major = request.getParameter("major");
        
        String subject = request.getParameter("subject");
        //将接收来的二进制数据流以iso8859-1解码再转换成utf-8    
        ud_revise2Dao udDao = new ud_revise2Dao();
        User user = udDao.login(id, number,name,sex,idcard, age,telephone,graduationtime,admissiondate,education,Department,major,subject,schoolclass);
        if(user != null){
        	 response.sendRedirect("Stu_message1.jsp?error=yes");
//        request.getRequestDispatcher("revise.jsp").forward(request, response);      	        
        }else{
         response.sendRedirect("Stu_message1.jsp?error=no");
         System.out.println(id);
                }      
        }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

