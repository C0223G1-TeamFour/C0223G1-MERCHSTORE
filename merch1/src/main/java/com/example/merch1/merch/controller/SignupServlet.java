package com.example.merch1.merch.controller;


import com.example.team4.DAO.customers.CustomerDAO;
import com.example.team4.DAO.customers.ICustomerDAO;
import com.example.team4.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignupServlet", value = "/signup")
public class SignupServlet extends HttpServlet {
    public static ICustomerDAO iCustomerDAO = new CustomerDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(iCustomerDAO.checkAccountExistence(email)){
            request.setAttribute("message", "Cannot use this account! Please try another one!");
            request.getRequestDispatcher("/view/sign-up.jsp").forward(request, response);
        } else {
            iCustomerDAO.addNewCustomerAccount(new Customer(firstName, lastName, email, password));
            response.sendRedirect("/login");
        }
    }
}
