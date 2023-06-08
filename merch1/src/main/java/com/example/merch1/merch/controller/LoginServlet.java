package com.example.merch1.merch.controller;


import com.example.team4.DAO.customers.CustomerDAO;
import com.example.team4.DAO.customers.ICustomerDAO;
import com.example.team4.DAO.orders.IOrderDAO;
import com.example.team4.DAO.orders.OrderDAO;
import com.example.team4.base.BaseConnection;
import com.example.team4.model.Cart;
import com.example.team4.model.Customer;
import com.example.team4.model.Order;
import com.example.team4.service.carts.CartService;
import com.example.team4.service.carts.ICartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    ICustomerDAO iCustomerDAO = new CustomerDAO();
    IOrderDAO iOrderDAO = new OrderDAO();
    ICartService iCartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("accountId") == null) {
            response.sendRedirect("/view/log-in.jsp");
        } else {
            response.sendRedirect("/view/account.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.CHECK_ACCOUNT);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int accountId = rs.getInt("account_id");
                System.out.println(accountId);
                // add accountId to session
                HttpSession session = request.getSession();
                session.setAttribute("accountId", accountId);

                PreparedStatement preparedStatement1 = connection.prepareStatement(BaseConnection.CHECK_ROLE);
                preparedStatement1.setInt(1, accountId);
                ResultSet rs1 = preparedStatement1.executeQuery();
                if (rs1.next()) {
                    String role = rs1.getString("role_name");
                    System.out.println(role);

                    if (role.equals("employee")) {
                        response.sendRedirect("/products");
                    }
                    if (role.equals("customer")) {
                        Customer currentCustomer = iCustomerDAO.findCustomerByAccountId(accountId);
                        List<Order> orders = iOrderDAO.getAllOrders(currentCustomer.getId());
                        List<Cart> carts = iCartService.getAllCarts(currentCustomer.getId());
                        session.setAttribute("currentCustomer", currentCustomer);
                        session.setAttribute("orders", orders);
                        session.setAttribute("cartList", carts);
                        response.sendRedirect("/view/account.jsp");
                    }
                }

            } else {
                request.setAttribute("message", "Incorrect email or password!");
                request.getRequestDispatcher("/view/log-in.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
