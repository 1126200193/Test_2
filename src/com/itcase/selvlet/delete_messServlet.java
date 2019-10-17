package com.itcase.selvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itcase.dao.delete_messDao;
import com.itcase.user.User;

@WebServlet("/delete_messServlet")
public class delete_messServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String idStr = request.getParameter("id");
        Integer id = Integer.valueOf(idStr).intValue(); 
        //将接收来的二进制数据流以iso8859-1解码再转换成utf-8    
        delete_messDao delDao = new delete_messDao();
        User user = delDao.login(id);
        if(user != null){
        	 response.sendRedirect("Stu_message1.jsp?error=del");
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

