package com.example.merch_store.controller;

import com.example.merch_store.model.Customer;
import com.example.merch_store.model.Product;
import com.example.merch_store.model.ProductType;
import com.example.merch_store.service.products.IProductService;
import com.example.merch_store.service.products.IProductTypeService;
import com.example.merch_store.service.products.ProductService;
import com.example.merch_store.service.products.ProductTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private IProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "details":
                showDetails(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showlist(request, response);
                break;
        }
    }

    private void showDetails(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/carts/product-details.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<ProductType> productTypeList = productTypeService.getAll();
        request.setAttribute("productTypeList", productTypeList);
        Product productById = productService.selectProductById(id);
        request.setAttribute("productById", productById);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductType> productTypeList = productTypeService.getAll();
        request.setAttribute("productTypeList", productTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.showAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        requestDispatcher.forward(request, response);
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
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "details":
                showDetails(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showlist(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("name").trim();
        double price= Double.parseDouble(request.getParameter("price").trim());
        if(name == null){
            name = "";
        }

        List<Product> productList =productService.searchProduct(name,price);
        request.setAttribute("productList",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        System.out.println(id);
        productService.deleteProduct(id);
        request.setAttribute("message", "Delete success");
        request.setAttribute("productList", productService.showAll());
        request.getRequestDispatcher("/view/product/list.jsp").forward(request,response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int productTypeId = Integer.parseInt(request.getParameter("productType"));
        ProductType productType = new ProductType(productTypeId);
        Product product = new Product(id, name, description, price, image, productType);
        productService.updateProduct(product);
        if (product == null) {
            request.setAttribute("message", "Update failure");
            request.getRequestDispatcher("/view/product/edit.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Update success");
            request.setAttribute("productList", productService.showAll());
            request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int productTypeId = Integer.parseInt(request.getParameter("productType"));
        ProductType productType = new ProductType(productTypeId);
        Product product = new Product(name, description, price, image, productType);
        productService.createNewProduct(product);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            request.setAttribute("message", "Add new failure");
            requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        } else {
            request.setAttribute("message", "Add new success");
            request.setAttribute("productList", productService.showAll());
            request.getRequestDispatcher("/view/product/list.jsp").forward(request, response);
        }
    }
}
