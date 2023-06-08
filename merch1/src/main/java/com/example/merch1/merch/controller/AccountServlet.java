package com.example.merch1.merch.controller;

import com.example.team4.DAO.customers.CustomerDAO;
import com.example.team4.DAO.customers.ICustomerDAO;
import com.example.team4.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    ICustomerDAO iCustomerDAO = new CustomerDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/view/account.jsp").forward(request,response);
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
        iCustomerDAO.deleteAccount(accountId);
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
        iCustomerDAO.editAccount(currentCustomer.getId(), new Customer(firstName.concat(" " + lastName), phone, address));

        Customer editedCustomer = iCustomerDAO.findCustomerByAccountId((Integer) session.getAttribute("accountId"));
        session.setAttribute("currentCustomer", editedCustomer);
        session.setAttribute("success", "Successfully updated account's info!");
        try {
            response.sendRedirect("/account");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
