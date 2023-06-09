package com.example.merch_store.controller;

import com.example.merch_store.model.Customer;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignupServlet", value = "/signup")
public class SignupServlet extends HttpServlet {
    public static ICustomerService iCustomerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(iCustomerService.checkAccountExistence(email)){
            request.setAttribute("message", "Cannot use this account! Please try another one!");
            request.getRequestDispatcher("/view/carts/sign-up.jsp").forward(request, response);
        } else {
            iCustomerService.addNewCustomerAccount(new Customer(firstName, lastName, email, password));
            request.setAttribute("success", "Successfully created a new account!");
            request.getRequestDispatcher("/view/carts/log-in.jsp").forward(request,response);
//            response.sendRedirect("/login");
        }
    }
}
