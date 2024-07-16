package com.admin.servlet;

import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.DB.DBConnect;
import com.DAO.BookDAOImpl;
import com.entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookname = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("status");
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookname(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			
			if (f) {
				session.setAttribute("succMsg", "Book details updated successfully");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
