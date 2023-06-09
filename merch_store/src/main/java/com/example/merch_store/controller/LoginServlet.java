package com.example.merch_store.controller;

import com.example.merch_store.base.BaseConnection;
import com.example.merch_store.model.Cart;
import com.example.merch_store.model.Customer;
import com.example.merch_store.model.CustomerOrder;
import com.example.merch_store.model.Order;
import com.example.merch_store.service.carts.CartService;
import com.example.merch_store.service.carts.ICartService;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;
import com.example.merch_store.service.customer_order.CustomerOrderService;
import com.example.merch_store.service.customer_order.ICustomerOrderService;
import com.example.merch_store.service.order.IOrderService;
import com.example.merch_store.service.order.OrderService;

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
    ICustomerService iCustomerService = new CustomerService();
    ICustomerOrderService iCustomerOrderService = new CustomerOrderService();
    ICartService iCartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("accountId") == null) {
            response.sendRedirect("/view/carts/log-in.jsp");
        } else {
            response.sendRedirect("/view/carts/account.jsp");
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
                        System.out.println("nhehe");
                        Customer currentCustomer = iCustomerService.findCustomerByAccountId(accountId);
                        System.out.println(currentCustomer.getName());
                        List<CustomerOrder> orders = iCustomerOrderService.getAllOrders(currentCustomer.getId());
                        List<Cart> carts = iCartService.getAllCarts(currentCustomer.getId());
                        session.setAttribute("currentCustomer", currentCustomer);
                        session.setAttribute("orders", orders);
                        session.setAttribute("cartList", carts);
                        response.sendRedirect("/view/carts/account.jsp");
                    }
                }

            } else {
                request.setAttribute("message", "Incorrect email or password!");
                request.getRequestDispatcher("/view/carts/log-in.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
