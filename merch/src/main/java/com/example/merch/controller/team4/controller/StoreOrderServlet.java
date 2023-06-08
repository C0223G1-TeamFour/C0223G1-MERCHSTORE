package com.example.team4.controller;

import com.example.team4.DAO.orders.IOrderDAO;
import com.example.team4.DAO.orders.OrderDAO;
import com.example.team4.model.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StoreOrderServlet", value = "/store-orders")
public class StoreOrderServlet extends HttpServlet {
    IOrderDAO iOrderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderManagement = iOrderDAO.getOrderManagement();
        request.setAttribute("orders", orderManagement);
        request.getRequestDispatcher("/view/store-orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
