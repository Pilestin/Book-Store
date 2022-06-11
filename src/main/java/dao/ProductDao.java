package dao;

import entity.Product;
import helper.FactoryProvider;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}

		return f;
	}

	// get all products
	public List<Product> getAllProducts() {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}

	// get all products of given category
	public List<Product> getAllProductsById(int cid) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}

	public void deleteProductById(int cid) {
		Session s = this.factory.openSession();
		Product p = new Product();
		p.setpId(cid);
		s.beginTransaction();
		s.delete(p);
		s.getTransaction().commit(); 
	}
	
	public void changeProductQuantity(int pid, int quantity) {
		Session s = this.factory.openSession();
		Product p;
		Query query = s.createQuery("from Product as p where p.pId=: id"); 
		query.setParameter("id", pid);
		p = (Product)query.uniqueResult();
		p.setpQuantity(quantity);
		s.beginTransaction();
		s.saveOrUpdate(p);
		s.getTransaction().commit(); 
	}
	
	

}
