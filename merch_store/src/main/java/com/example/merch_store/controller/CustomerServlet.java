package com.example.merch_store.controller;

import com.example.merch_store.model.AccountUser;
import com.example.merch_store.model.Customer;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFromCustomer(request, response);
                break;
            case "delete":
                break;
            case "edit":
                editFormCustomer(request, response);
                break;
            case "view":
                break;
            default:
                showFormCustomer(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request, response);
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
        Map<String, String> mapValidation = new HashMap<>();
        boolean flag = true;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeatPassword");
        AccountUser accountUser = new AccountUser(email, password);
        Customer customer = new Customer(name, email, phone, address, accountUser);
        mapValidation = customerService.saveCustomer(customer);
        if (password.equals(repeatPassword)) {
            mapValidation.put("re_password", "");
        } else {
            mapValidation.put("re_password", "Passwords don't match  ");
        }
        Set<String> stringSet = mapValidation.keySet();
        for (String key : stringSet) {
            if (!mapValidation.get(key).equals("")) {
                flag = false;
                break;
            }
        }
        if (flag) {
            try {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("/employee");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            HttpSession session = request.getSession();
            if (mapValidation.get("name").equals("")) {
                session.setAttribute("name", name);
            }
            if (mapValidation.get("email").equals("")) {
                session.setAttribute("email", email);
            }
            if (mapValidation.get("address").equals("")) {
                session.setAttribute("address", address);
            }
            if (mapValidation.get("phone").equals("")) {
                session.setAttribute("phone", phone);
            }
            if (mapValidation.get("password").equals("")) {
                session.setAttribute("password", password);
            }
            request.setAttribute("map", mapValidation);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void editFormCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id_customer = Integer.parseInt(request.getParameter("id"));
        int account_id = Integer.parseInt(request.getParameter("account"));
        Map<String, String> stringMap = new HashMap<>();
        stringMap.put("name", "");
        stringMap.put("phone", "");
        stringMap.put("address", "");
        stringMap.put("password", "");
        stringMap.put("re_password", "");
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer", customer);
        request.setAttribute("map", stringMap);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> mapValidation = new HashMap<>();
        boolean flag = true;
        int id = Integer.parseInt(request.getParameter("id"));
        int account_id = Integer.parseInt(request.getParameter("account"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeatPassword");
//        AccountUser accountUser = new AccountUser(account_id,email,user_password);
//        customer = new Customer(id, name, email, phone, address, accountUser);
        AccountUser accountUser = new AccountUser(account_id, email, password);
        Customer customer = new Customer(id, name, email, phone, address, accountUser);
        mapValidation = customerService.editCustomer(customer);
        if (password.equals(repeatPassword)) {
            mapValidation.put("re_password", "");
        } else {
            mapValidation.put("re_password", "Passwords don't match !");
        }
        Set<String> stringSet = mapValidation.keySet();
        for (String key : stringSet) {
            if (!mapValidation.get(key).equals("")) {
                flag = false;
                break;
            }
        }
        if (flag) {
            try {
                response.sendRedirect("/employee");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("map", mapValidation);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        request.setAttribute("message", "Delete success");
        request.setAttribute("customerList", customerService.findAll());
        try {
            request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCustomer(HttpServletRequest request, HttpServletResponse response) {
//        int id_customer = Integer.parseInt(request.getParameter("id_customer"));
        int id_customer = 5;
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
        Map<String, String> stringMap = new HashMap<>();
        stringMap.put("name", "Please enter your name Example : Nguyễn Anh Nhàn");
        stringMap.put("email", "Please enter your email Example : nhang@gmail.com");
        stringMap.put("phone", "Please enter your phone number Example : 01235428456");
        stringMap.put("password", "Please enter your password Example : Abcnh123");
        stringMap.put("address", "Please enter your phone number Example : Da Nang");
        stringMap.put("re_password", "Please enter your password again ");
        request.setAttribute("map", stringMap);
        HttpSession session = request.getSession();
        session.setAttribute("name", "");
        session.setAttribute("address", "");
        session.setAttribute("email", "");
        session.setAttribute("address", "");
        session.setAttribute("phone", "");
        session.setAttribute("password", "");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}