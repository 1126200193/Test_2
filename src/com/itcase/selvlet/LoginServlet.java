package com.itcase.selvlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itcase.dao.UserDao;
import com.itcase.user.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        //获取用户名和密码
        String number = request.getParameter("number");

        String password = request.getParameter("password");
        
        String type = request.getParameter("type");
        //获取UserDao实例
        UserDao userDao = new UserDao();

        User user = userDao.login(number,password,type);
        // 判断user是否为空
        if(user != null){
        // 转发到LoginSuccess.jsp页面
        //  getRequestDispatcher()是请求转发
        //通过servlet这样获取session对象
    	HttpSession session  = request.getSession();
        	if(type.equals("Stu")){
        		request.getRequestDispatcher("Studentindex.jsp").forward(request, response);
        		session.setAttribute("login_name",number);
        	}
        	else if(type.equals("Admin")){
        		request.getRequestDispatcher("adminIndex.jsp").forward(request, response);
        	}             
        }else{
        // 登录失败
         response.sendRedirect("login.jsp?error=yes");
           
                }
        
        }

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

