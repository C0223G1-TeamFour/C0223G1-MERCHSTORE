package com.example.merch_store.model;

public class CustomerOrderDetails {
    private int id;
    private int orderId;
    private int productId;
    private int productTypeId;
    private int quantity;
    private double price;

    //    public CustomerOrderDetails(){
//
//    }
    public CustomerOrderDetails(int id, int orderId, int productId, int productTypeId, int quantity, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.productTypeId = productTypeId;
        this.quantity = quantity;
        this.price = price;
    }

    public CustomerOrderDetails(int productId, int productTypeId, int quantity, double price) {
        this.productId = productId;
        this.productTypeId = productTypeId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
