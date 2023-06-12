package com.example.merch_store.model;

public class OrderDetail {
    private int id;
    private Order order;
    private Product product;
    private String productType;
    private int quantity;
    private double price;

    public OrderDetail(int id, Order order, Product product, String productType, int quantity, double price) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.productType = productType;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(Order order, Product product, String productType, int quantity, double price) {
        this.order = order;
        this.product = product;
        this.productType = productType;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail() {
    }

    public OrderDetail(int id, Product product, int quantity, double price) {
        this.id = id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(Order order, Product product, int quantity, double price) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(int detailsId, Product product, String type, int quantity, double price) {
        this.id = detailsId;
        this.product = product;
        this.productType = type;
        this.quantity = quantity;
        this.price = price;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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
