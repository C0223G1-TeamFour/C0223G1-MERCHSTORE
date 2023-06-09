package com.example.merch_store.controller;


import com.example.merch_store.model.AccountUser;
import com.example.merch_store.model.Customer;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFromCustomer(request,response);
                break;
            case "delete":
                break;
            case "edit":
                editFormCustomer(request,response);
                break;
            case "view":
                break;
            default:
                showFormCustomer(request, response);
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request,response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "view":
                break;
            default:
                showFormCustomer(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name= request.getParameter("name");
        String email= request.getParameter("email");
        String phone= request.getParameter("phone");
        String address= request.getParameter("address");
        String password = request.getParameter("password");
        AccountUser accountUser = new AccountUser(email,address);
        Customer customer = new Customer(name,email,phone,address,accountUser);
        customerService.saveCustomer(customer);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editFormCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id_customer= Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer",customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        customerService.editCustomer(id, new Customer(name, phone, address));
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCustomer(HttpServletRequest request, HttpServletResponse response) {
//        int id_customer = Integer.parseInt(request.getParameter("id_customer"));
        int id_customer =5;
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("/view/customer/list_customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void createFromCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/view/customer/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
