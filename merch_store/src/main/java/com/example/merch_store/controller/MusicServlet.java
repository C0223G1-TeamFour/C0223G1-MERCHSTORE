package com.example.merch_store.controller;


import com.example.merch_store.service.products.IProductService;
import com.example.merch_store.service.products.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MusicServlet", value = "/music")
public class MusicServlet extends HttpServlet {
    public static IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", iProductService.showAllMusic());
        try {
            request.getRequestDispatcher("/view/carts/home.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
