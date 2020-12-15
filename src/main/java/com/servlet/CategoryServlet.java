package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Category;
import com.entity.Product;
import com.halper.FactoryProvider;
import com.userdao.CategoryDao;
import com.userdao.ProductDao;

/**
 * Servlet implementation class CategoryServlet
 */
@MultipartConfig
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		try {
			
			
			String operation = request.getParameter("operation");
			if (operation.trim().equals("addcategory")) {
				
				String cattital = request.getParameter("cattital");
				String catdisc = request.getParameter("catdisc");
				
			    Category cat = new Category();
			    cat.setCategoryTital(cattital);
			    cat.setCategoryDescription(catdisc);
			    
				/* Save Category */
			    
			   CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
			   int cateId = categorydao.savecategory(cat);		    
			   HttpSession sess = request.getSession();
			   sess.setAttribute("message", "category added successfully .");
			   response.sendRedirect("admin.jsp");
			}
			else if (operation.trim().equals("addproduct")) {
				
				String pname = request.getParameter("pname");
				int pprice = Integer.parseInt(request.getParameter("pprice"));
				int pdisc = Integer.parseInt(request.getParameter("pdisc"));
				int pqty = Integer.parseInt(request.getParameter("pqty"));
				int pcatid = Integer.parseInt(request.getParameter("pcatid"));
				String pdiscr = request.getParameter("pdiscr");
				Part part = request.getPart("ppic");
				
				Product p = new Product();
				p.setpName(pname);
				p.setpPrice(pprice);
				p.setpQuentity(pqty);
				p.setpDisc(pdiscr);
				p.setpDiscount(pdisc);
				p.setpPic(part.getSubmittedFileName());
				
				
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(pcatid);
				
				p.setCategory(category);
				
				ProductDao pd = new ProductDao(FactoryProvider.getFactory());
			    pd.saveProduct(p);
				
				
				///find out path of uploaded photo
				String path = request.getRealPath("img")+File.separator+("products")+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				/* upload photo content */
				try {

				
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
//				Reading data
				
				byte []data = new byte[is.available()];
				is.read(data);
				
				fos.write(data);
				fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
//				Message
				
				HttpSession sess = request.getSession();
				sess.setAttribute("message", "Product added successfully .");
				response.sendRedirect("admin.jsp");
			    return;
				
			}
			
			
			
			
			
			
//			String cattital = request.getParameter("cattital");
//			String catdisc = request.getParameter("catdisc");
//			
//			if(cattital.isEmpty())
//			{
//				out.print("category is null");
//				return;
//			}
//			
//			out.println(cattital);
//			out.print(catdisc);
//			Category cat = new Category();
//			cat.setCategoryTital(cattital);
//			cat.setCategoryDescription(catdisc);
//		    Session session = FactoryProvider.getFactory().openSession();
//		    Transaction tx = session.beginTransaction();
//		    int i = (Integer)session.save(cat);
//		    tx.commit();
//		    session.close();
//		    
//		    
//		    HttpSession httpsess = request.getSession();
//			httpsess.setAttribute("message","category added successfully !");
//			response.sendRedirect("admin.jsp");
//			
//			return;
		} catch (Exception e) {
		     e.printStackTrace();
//		     HttpSession httpsess = request.getSession();
//				httpsess.setAttribute("message","This category already added.. !");
//				response.sendRedirect(".jsp");
		}
	}

}
