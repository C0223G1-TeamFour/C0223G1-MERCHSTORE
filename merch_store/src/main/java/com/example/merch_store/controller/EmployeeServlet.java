package com.example.merch_store.controller;



import com.example.merch_store.model.Customer;
import com.example.merch_store.model.Employee;
import com.example.merch_store.service.customer.CustomerService;
import com.example.merch_store.service.customer.ICustomerService;
import com.example.merch_store.service.employee.EmployeeService;
import com.example.merch_store.service.employee.IEmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                search(request,response);
                break;
            default:
                manageCustomer(request,response);
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
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                System.out.println("create");
                create(request,response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            case "search":
                search(request,response);
                break;
            default:
                manageCustomer(request,response);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("id");
        System.out.println(name);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {

        String name=request.getParameter("name").trim();
        String address= request.getParameter("address").trim();
        if(name==null){
            name="";
        }
        if(address==null){
            address="";
        }
        List<Customer> customerList =customerService.searchCustomer(name,address);
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
//        int account_id= Integer.parseInt(request.getParameter("account_id"));
        int account_id=3;
        Employee employee = employeeService.getEmployee(account_id);
        String name = employee.getName();
        request.setAttribute("employee",employee);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/view/employee/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void manageCustomer(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        int id=6;
        Employee employee = employeeService.getEmployee(id);
        List<Customer> customerList = new ArrayList<>();
        customerList= customerService.findAll();
        request.setAttribute("employee",employee);
        request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
