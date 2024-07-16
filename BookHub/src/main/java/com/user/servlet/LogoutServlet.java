package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/logout")
@MultipartConfig
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();
			session.removeAttribute("userobj");
			session.setAttribute("succMsg", "Logout Sucessfully");
			resp.sendRedirect("/login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}