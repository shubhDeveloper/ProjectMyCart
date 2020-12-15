package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.google.protobuf.Message;
import com.halper.FactoryProvider;
import com.userdao.UserDao;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	          PrintWriter out = response.getWriter();	
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			UserDao ud = new UserDao(FactoryProvider.getFactory());
			User user = ud.userLogin(email, password);
			HttpSession sess = request.getSession();
			if(user == null)
			{		
				sess.setAttribute("message", "Invalid detail !! try with another");
				response.sendRedirect("userlogin.jsp");
				return;
			}
			else {
				sess.setAttribute("current-user",user);
				if(user.getStatus().equals("admin"))
				{
					response.sendRedirect("admin.jsp");
				}
				else
				{
					response.sendRedirect("normal.jsp");
				}			
				out.print(user);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
