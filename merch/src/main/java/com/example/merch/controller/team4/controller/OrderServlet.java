package com.example.team4.controller;

import com.example.team4.DAO.customers.CustomerDAO;
import com.example.team4.DAO.customers.ICustomerDAO;
import com.example.team4.DAO.order_details.IOrderDetailsDAO;
import com.example.team4.DAO.order_details.OrderDetailsDAO;
import com.example.team4.DAO.orders.IOrderDAO;
import com.example.team4.DAO.orders.OrderDAO;
import com.example.team4.model.Cart;
import com.example.team4.model.Customer;
import com.example.team4.model.Order;
import com.example.team4.model.OrderDetails;
import com.example.team4.service.carts.CartService;
import com.example.team4.service.carts.ICartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/orders")
public class OrderServlet extends HttpServlet {
    IOrderDAO iOrderDAO = new OrderDAO();
    IOrderDetailsDAO iOrderDetailsDAO = new OrderDetailsDAO();
    ICustomerDAO iCustomerDAO = new CustomerDAO();
    ICartService iCartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) request.getSession().getAttribute("currentCustomer");


        if (session.getAttribute("accountId") == null) {
            // in case a user does not log in but click on cart button
            request.getRequestDispatcher("/view/account.jsp").forward(request, response);
        } else {
            request.setAttribute("carts", iCartService.getAllCarts(currentCustomer.getId()));
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                createOrder(request, response);
                break;
            case "delete":
                deleteOrder(request, response);
                break;
            case "update-info":
                updateShippingInfo(request, response);
                break;
        }
    }

    private void updateShippingInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) request.getSession().getAttribute("currentCustomer");

        session.removeAttribute("alertMessage");

        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        iCustomerDAO.updateShippingInfo(currentCustomer.getId(), phoneNumber, address);
        // remove old currentCustomer after update
        session.removeAttribute("currentCustomer");
        // get the updated currentCustomer
        Customer updatedCustomer = iCustomerDAO.findCustomerByAccountId((Integer) session.getAttribute("accountId"));
        session.setAttribute("currentCustomer", updatedCustomer);

        createOrder(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) request.getSession().getAttribute("currentCustomer");

        int orderId = Integer.parseInt(request.getParameter("orderId"));
        System.out.println("orderId" + orderId);


        if (!iOrderDAO.checkOrderId(orderId, currentCustomer.getId())) {
            request.setAttribute("message", "Order ID is not correct. Please try again!");
            try {
                request.getRequestDispatcher("/view/account.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            iOrderDAO.deleteOrder(orderId, currentCustomer.getId());
            List<Order> orders = iOrderDAO.getAllOrders(currentCustomer.getId());
            session.setAttribute("orders", orders);
            session.setAttribute("success", "An order has been deleted!");
            try {
                response.sendRedirect("/account");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        Customer currentCustomer = (Customer) request.getSession().getAttribute("currentCustomer");
        if (currentCustomer.getAddress() == null || currentCustomer.getPhone() == null) {
            session.setAttribute("alertMessage", "Please fill in this form to complete your shipping details:");
        } else {
            // create new order
            iOrderDAO.addNewOrder(currentCustomer.getId());

            // get order_id to create order_details
            int orderId = iOrderDAO.getLatestOrderId();
            List<Cart> carts = iCartService.getAllCarts(currentCustomer.getId());
            System.out.println(carts);
            // add order_details with order_id which is just created
            for (int i = 0; i < carts.size(); i++) {
                iOrderDetailsDAO.addNewOrderDetails(orderId, new OrderDetails(carts.get(i).getProductId(), carts.get(i).getProductTypeId(), carts.get(i).getQuantity(), carts.get(i).getPrice()));
            }
            // clear cart after order
            iCartService.deleteAllCartsAfterOrder(currentCustomer.getId());

            // update orders
            session.removeAttribute("orders");
            session.setAttribute("orders", iOrderDAO.getAllOrders(currentCustomer.getId()));
            session.setAttribute("success", "Successfully placed an order :)");
            session.removeAttribute("cartList");
        }
        // after all :)
        try {
            response.sendRedirect("/orders");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
