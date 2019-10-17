package com.itcase.selvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itcase.dao.up_personDao;
import com.itcase.user.User;

@WebServlet("/ud_personServlet")
public class ud_personServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String number=request.getParameter("number");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String age=request.getParameter("age");
        String idcard =request.getParameter("idcard");
        String telephone=request.getParameter("telephone");
        //将接收来的二进制数据流以iso8859-1解码再转换成utf-8    
        up_personDao udDao = new up_personDao();
        User user = udDao.login(number,name,sex,idcard, age,telephone);
        if(user != null){
        	 response.sendRedirect("person_mes.jsp?error=yes");
//        request.getRequestDispatcher("revise.jsp").forward(request, response);      	        
        }else{
         response.sendRedirect("Stu_message1.jsp?error=no");
                }      
        }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

