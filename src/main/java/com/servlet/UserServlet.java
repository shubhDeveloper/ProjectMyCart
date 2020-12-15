package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.User;
import com.halper.FactoryProvider;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			if(username.isEmpty())
			{
				out.print("username is null");
				return;
			}
			
			User user = new User(username, email, phone, password, address, gender, "Y");
			
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			int i = (Integer) session.save(user);
			
			tx.commit();
			session.close();
			
			HttpSession httpsess = request.getSession();
			httpsess.setAttribute("message","Registraton successfully !");
			response.sendRedirect("register.jsp");
			
			return;
			
		} catch (Exception e) {
			HttpSession httpsess = request.getSession();
			httpsess.setAttribute("message","This email already register pleace login !");
			response.sendRedirect("register.jsp");
		}
	}

}
