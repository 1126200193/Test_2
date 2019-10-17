package com.itcase.selvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itcase.dao.updateDao;
import com.itcase.user.User;

@WebServlet("/updateServlet")
public class updateselvlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String number = request.getParameter("number");
        String password = request.getParameter("password");     
        String idcard = request.getParameter("idcard");
        updateDao userDao = new updateDao();
        User user = userDao.login(number,password,idcard);
        if(user != null){
        	 response.sendRedirect("revise.jsp?error=yes");
//        request.getRequestDispatcher("revise.jsp").forward(request, response);      	        
        }else{
         response.sendRedirect("revise.jsp?error=no");
           
                }
        
        }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

