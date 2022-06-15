/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CategoryDao;
import dao.ProductDao;
import dao.UserDao;
import entity.Category;
import entity.Product;
import helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig(	       // ilk sorun buradan kaynakl�. Buras� olmad���nda 400 hata kodlar� al�n�yor 
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            servlet 2:
//            add category 
//            add product
            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {
                //add category
                //fetching category data
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                //category databse save:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
//                out.println("Category Saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully : " + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                //add product
                //work
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPhoto");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                System.out.println("File upload - part.getSubmittedFileName() : "+ part.getSubmittedFileName());
                
                //get category by id
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdoa.getCategoryById(catId);

                p.setCategory(category);

                //product save...
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                //pic upload
//                find out the path to upload photo
                // request.getSession().getServletContext().getRealPath("img") yapıldı
                // Burası önemli , path'e bak
                String path = request.getSession().getServletContext().getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                System.out.println("File upload - path : "+ path);

                //uploading code..
                try {

                    FileOutputStream fos = new FileOutputStream(path);
                    
                    InputStream is = part.getInputStream();
                    System.out.println("File upload - part.getInputStream() : "+ is);
//                reading data
                    byte[] data = new byte[is.available()];

                    is.read(data);

//                writing the data
                    fos.write(data);

                    fos.close();

                } catch (Exception e) {
                    e.printStackTrace();
                    out.print(e);
                }

                out.println("Product save sucess...");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Ürün başarıyla eklendi");
                response.sendRedirect("admin.jsp");
                return;

            }
            else if(op.trim().equals("deleteproduct")) {
            	
            	int pId = Integer.parseInt(request.getParameter("pId"));

                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.deleteProductById(pId);
                
                out.println("Product delete sucess...");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Ürün başarıyla silindi");
                response.sendRedirect("admin.jsp");
            }
            else if(op.trim().equals("deleteuser")) {
            	
            	int uId = Integer.parseInt(request.getParameter("uId"));

                UserDao udao = new UserDao(FactoryProvider.getFactory());
                out.println("User deleted sucess...");
                udao.deleteUserById(uId);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Kullanıcı başarıyla silindi");
                response.sendRedirect("admin.jsp");
            }
            else if(op.trim().equals("changeproductquantity")) {
            	
            	int pid = Integer.parseInt(request.getParameter("pId"));
            	int quantity = Integer.parseInt(request.getParameter("pQuantity").trim());

                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                out.println("\n\n id, quantity" + pid +" " + quantity);
                pdao.changeProductQuantity(pid, quantity);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Ürün adedi güncellendi");
                response.sendRedirect("admin.jsp");
            }
            
         
            
            

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
