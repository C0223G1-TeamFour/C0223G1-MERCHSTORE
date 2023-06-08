package com.example.merch_store.model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private String image;
    private ProductType productType;

    public Product() {
    }

    public Product(String name) {
        this.name = name;
    }

    public Product(int id, String name, String description, double price, String image, ProductType productType) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public Product(String name, String description, double price, String image, ProductType productType) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public ProductType getProductTypeId() {
        return productType;
    }

    public void setProductTypeId(ProductType productTypeId) {
        this.productType = productTypeId;
    }
}
