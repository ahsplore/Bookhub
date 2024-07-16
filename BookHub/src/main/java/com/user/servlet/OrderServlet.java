package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.entity.Cart;
import com.entity.User;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.DAO.BookDAOImpl;
import jakarta.servlet.http.HttpSession;
import com.entity.BookDtls;
import com.DAO.BookOrderImpl;
import com.entity.Book_Order;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			User u = (User) session.getAttribute("userobj");

			CartDAOImpl dao1 = new CartDAOImpl(DBConnect.getConn());
			List<Cart> cart = dao1.getBookByUser(u.getId());
			Double totalPrice1 = 0.00;
			for (Cart c : cart) {
				totalPrice1 = c.getTotalPrice();
			}
			
			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;
			
			if ("COD".equals(paymentType)) {

				CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
				BookDAOImpl daox=new BookDAOImpl(DBConnect.getConn());
				List<Cart> blist = dao.getBookByUser(id);

				if (blist.isEmpty()) {
					session.setAttribute("failedMsg", "Add Item");
					resp.sendRedirect("checkout.jsp");
				} else {
					BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
					Book_Order o = null;

					ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
					Random r = new Random();
					for (Cart c : blist) {
						o = new Book_Order();
						BookDtls b =daox.getBookById(c.getBid());
						o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
						o.setUserName(name);
						o.setEmail(email);
						o.setPhno(phno);
						o.setAuthor(c.getAuthor());
						o.setFulladd(fullAdd);
						o.setBookName(c.getBookname());
						o.setPrice(c.getPrice() + "");
						o.setPaymentType("COD");
						orderList.add(o);
					}

					if ("noselect".equals(paymentType)) {
						session.setAttribute("failedMsg", "Choose Payment Method");
						resp.sendRedirect("checkout.jsp");
					} else {
						boolean f = dao2.saveOrder(orderList);

						if (f) {
							resp.sendRedirect("order_success.jsp");
						} else {
							session.setAttribute("failedMsg", "Your Order Failed");
							resp.sendRedirect("checkout.jsp");
						}
					}
				}
			} else if ("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Choose Payment Method");
				resp.sendRedirect("checkout.jsp");
			}

			else {
				resp.sendRedirect("cardpayment.jsp?un=" + name + "&&em=" + email + "&&ph=" + phno + "&&ad=" + fullAdd
						+ "&&ta=" + totalPrice1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}