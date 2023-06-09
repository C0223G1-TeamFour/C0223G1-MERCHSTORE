package com.example.merch_store.controller;


import com.example.merch_store.model.AccountUser;
import com.example.merch_store.model.Customer;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

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
        Map<String,String> mapValidation=new HashMap<>();
        boolean flag=true;
        String name= request.getParameter("name");
        String email= request.getParameter("email");
        String phone= request.getParameter("phone");
        String address= request.getParameter("address");
        String password = request.getParameter("password");
        String repeatPassword=request.getParameter("repeatPassword");
        AccountUser accountUser = new AccountUser(email,password);
        Customer customer = new Customer(name,email,phone,address,accountUser);
        mapValidation=customerService.saveCustomer(customer);
        if(password.equals(repeatPassword)){
            mapValidation.put("re_password","");
        }else {
            mapValidation.put("re_password","Nhập không khớp ");
        }
        Set<String> stringSet= mapValidation.keySet();
        for (String key:stringSet) {
            if(!mapValidation.get(key).equals("")){
                flag=false;
                break;
            }
        }
        if(flag){
            try {
                response.sendRedirect("/employee");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            request.setAttribute("map",mapValidation);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void editFormCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id_customer = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.getCustomer(id_customer);
        request.setAttribute("customer", customer);
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
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        customerService.editCustomer(id, new Customer(name, phone, address));
        try {
            response.sendRedirect("/employee");
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
        Map<String,String> stringMap = new HashMap<>();
        stringMap.put("name","Vui long nhập tên VD : Nguyễn Anh Nhàn");
        stringMap.put("email","Vui long nhập email VD : nhang@gmail.com");
        stringMap.put("phone","Nhập 10 số");
        stringMap.put("password","Nhập có ký tự hoa thường số");
        stringMap.put("address","Nhập vd Da Nang");
        stringMap.put("re_password","Vui lòng nhập mật khẩu khớp ở trên");
        request.setAttribute("map",stringMap);
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
