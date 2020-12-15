package com.userdao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Category;

public class CategoryDao {
      private SessionFactory factory;
      
      
      public CategoryDao(SessionFactory factory)
      {
    	  this.factory = factory;
      }
      
      public int savecategory(Category cat)
      {
    	Session session = this.factory.openSession();
    	Transaction tx = session.beginTransaction();
    	
    	int i = (Integer)session.save(cat);
    	
    	tx.commit();
    	session.close();  
		return i;
    	  
      }
      
      public List<Category> getCategories()
      {
    	  Session s = this.factory.openSession();
    	  Query q = s.createQuery("from Category");
          List<Category> list = q.list();
          return list; 
      }
      
      public Category getCategoryById(int cid)
      {
    	  Category cat=null;
    	  try 
    	  {  
			Session session = this.factory.openSession();
			cat = session.get(Category.class, cid);
			session.close(); 
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	  return cat;
      }
      
}
