package coder.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import coder.models.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	public UserController() {
		super();
	}

	@Override
	public void init() throws ServletException {
		InitialContext cont;
		try {
			cont = new InitialContext();
			Context context = (Context) cont.lookup("java:comp/env");
			ds = (DataSource) context.lookup("jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action.contentEquals("register")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			try {
				Connection con = ds.getConnection();
				User user = new User();
				if (user.addNewUser(name, email, password, con)) {
					con.close();
					request.setAttribute("success", "Welcome Back");
					request.getRequestDispatcher("/member.jsp").forward(request, response);
				} else {
					request.setAttribute("error", "Registration Fail");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (action.contentEquals("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Connection con;
			try {
				con = ds.getConnection();
				User user = new User();
				if (user.loginUser(email, password, con)) {
					request.setAttribute("success", "Welcome Back");
					request.getRequestDispatcher("/member.jsp").forward(request, response);
				} else {
					request.setAttribute("error", "Login Fail");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
