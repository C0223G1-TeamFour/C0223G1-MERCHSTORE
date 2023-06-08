package com.example.merch1.merch.model;

public class Cart {
    private int id;
    private int customerId;
    private int productId;
    private String productName;
    private int productTypeId;
    private String image;
    private double price;

    private int quantity;
    private double total;


    public Cart() {

    }

    public Cart(int customerId, int productId, String productName, int productTypeId, double price, String image, int quantity) {
        this.customerId = customerId;
        this.productId = productId;
        this.productName = productName;
        this.productTypeId = productTypeId;
        this.price = price;
        this.image = image;
        this.quantity = quantity;

    }

    public Cart(int customerId, int productId, String productName,int productTypeId, double price, String image, int quantity, double total) {
        this.customerId = customerId;
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.total = total;
        this.productTypeId = productTypeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productTypeId=" + productTypeId +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", total=" + total +
                '}';
    }
}
