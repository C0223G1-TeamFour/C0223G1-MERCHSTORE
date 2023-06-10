package com.example.merch_store.controller;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.example.merch_store.service.order.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderServlet", value = "/orders")
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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/order/detail.jsp");
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
        Map<Integer, Double> integerMap = orderService.getTotalPrice();
        request.setAttribute("integerMap", integerMap);
        request.setAttribute("orderManagement", orderManagement);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/order/order-management.jsp");
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
            case "search":
                searchOrder(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void searchOrder(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name").trim();
        String status = request.getParameter("status");
        if (name == null) {
            name = "";
        }
        List<Order> orderManagement = orderService.getOrderByNameCustomer(name,status);
        request.setAttribute("orderManagement", orderManagement);
        Map<Integer, Double> integerMap = orderService.getTotalPrice();
        request.setAttribute("integerMap", integerMap);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/order/order-management.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        orderService.deleteOrder(id);
        request.setAttribute("message", "Delete success");
        request.setAttribute("orderManagement", orderService.getAll());
        try {
            request.getRequestDispatcher("/view/order/order-management.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
