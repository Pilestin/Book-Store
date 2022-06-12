package helper;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider{
	private static SessionFactory factory= getFactory();
	
	public static SessionFactory getFactory()   {
		try {
			if(factory == null) {
				Configuration cfg = new Configuration();
			
				factory = cfg.configure("hibernate.cfg.xml").buildSessionFactory();				
			}
			
		}catch(Exception e) { 
			e.printStackTrace();			 
		}
		
		return factory;

	}
	public static String getYeter() {
		return "Yeterrrrr";
	}
}




	
     
   
 

	


