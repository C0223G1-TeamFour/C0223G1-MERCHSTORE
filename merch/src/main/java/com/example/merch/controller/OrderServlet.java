package com.example.merch_store.controller;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.example.merch_store.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderServlet", value = "/order-servlet")
public class OrderServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "details":
                showFormDetails(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showFormDetails(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<OrderDetail> orderDetailList = orderService.getDetails(id);
        request.setAttribute("orderDetailList", orderDetailList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/detail.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Order> orderManagement = orderService.getAll();
        Map<Integer, Integer> integerMap = orderService.getTotalPrice();
        request.setAttribute("integerMap", integerMap);
        request.setAttribute("orderManagement", orderManagement);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/order-management.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteOrder(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        orderService.deleteOrder(id);
        try {
            response.sendRedirect("/order-servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
