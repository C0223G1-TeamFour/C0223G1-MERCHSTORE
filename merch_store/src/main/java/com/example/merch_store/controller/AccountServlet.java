package com.example.merch_store.controller;

import com.example.merch_store.model.Customer;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    ICustomerService iCustomerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/carts/account.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "edit":
                editAccountInfo(request, response);break;
            case "delete":
                deleteAccount(request,response); break;
        }
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        int accountId = (int) request.getSession().getAttribute("accountId");
        System.out.println("delete" + accountId);
        iCustomerService.deleteAccount(accountId);
        request.getSession().removeAttribute("accountId");
        request.getSession().removeAttribute("currentCustomer");
        try {
            response.sendRedirect("/login");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editAccountInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("currentCustomer");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        iCustomerService.editAccount(currentCustomer.getId(), new Customer(firstName.concat(" " + lastName), phone, address));

        Customer editedCustomer = iCustomerService.findCustomerByAccountId((Integer) session.getAttribute("accountId"));
        session.setAttribute("currentCustomer", editedCustomer);
        session.setAttribute("success", "Successfully updated account's info!");
        try {
            response.sendRedirect("/account");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
