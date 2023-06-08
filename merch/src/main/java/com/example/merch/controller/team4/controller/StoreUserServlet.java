package com.example.team4.controller;

import com.example.team4.DAO.customers.CustomerDAO;
import com.example.team4.DAO.customers.ICustomerDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "StoreUserServlet", value = "/users")
public class StoreUserServlet extends HttpServlet {
    ICustomerDAO iCustomerDAO = new CustomerDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("users", iCustomerDAO.getAllCustomers());
        request.getRequestDispatcher("/view/store-users.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
