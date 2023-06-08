package com.example.merch_store.controller;

import com.example.merch_store.model.Cart;
import com.example.merch_store.model.Customer;
import com.example.merch_store.service.carts.CartService;
import com.example.merch_store.service.carts.ICartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    ICartService iCartService = new CartService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("accountId") == null) {
            response.sendRedirect("/view/carts/log-in.jsp");
        } else {
            displayAllCarts(request,response);
        }
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("currentCustomer");

        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println("cus" + customerId);
        System.out.println("pro" + productId);
        iCartService.deleteCart(customerId, productId);
        session.setAttribute("cartList", iCartService.getAllCarts(currentCustomer.getId()));
        try {
            response.sendRedirect("/cart");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayAllCarts(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        Customer currentCustomer = (Customer) session.getAttribute("currentCustomer");
        request.setAttribute("carts", iCartService.getAllCarts(currentCustomer.getId()));
        try {
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // in case users click on add-to-cart button but do not log in yet
        HttpSession session = request.getSession();
        if (session.getAttribute("accountId") == null) {
            response.sendRedirect("/view/carts/log-in.jsp");

        } else {
            String action = request.getParameter("action");
            if (action == null) action = "";

            switch (action) {
                case "delete":
                    deleteCart(request, response);
                    break;
                case "create":
                    createNewCart(request, response);
                    break;
                default:
                    displayAllCarts(request, response);
                    break;
            }


        }
    }

    private void createNewCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        int productTypeId = Integer.parseInt(request.getParameter("productTypeId"));
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Customer currentCustomer = (Customer) session.getAttribute("currentCustomer");


        if (iCartService.checkCartExistence(currentCustomer.getId(), productId)) {
            // if the product is already in cart then update the quantity
            iCartService.updateCart(currentCustomer.getId(), productId, quantity);
        } else {
            iCartService.addCart(new Cart(currentCustomer.getId(), productId, productName, productTypeId, price, image, quantity));
        }

        request.setAttribute("carts", iCartService.getAllCarts(currentCustomer.getId()));
        session.setAttribute("cartList", iCartService.getAllCarts(currentCustomer.getId()));
        try {
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
