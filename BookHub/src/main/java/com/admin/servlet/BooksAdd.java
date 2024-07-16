package com.admin.servlet;

import java.io.IOException;
import com.entity.BookDtls;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import java.io.File;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
 import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String bookCategory = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			BookDtls b = new BookDtls(bookname, author, price, bookCategory, status, fileName, "admin");

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
		
			boolean f = dao.addBooks(b);
			
			HttpSession session = req.getSession();
			
			if (f) {
				String path = getServletContext().getRealPath("")+"book";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Book Added Successfully");
				resp.sendRedirect("admin/add_books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/add_books.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}

