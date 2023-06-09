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

    public Product(String productName, String productDescription, double price, String image, ProductType productType) {
        this.name = productName;
        this.description = productDescription;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public Product(int productId, String productName, String productDescription, double price, String image,
                   ProductType productType) {
        this.id = productId;
        this.name = productName;
        this.description = productDescription;
        this.price = price;
        this.image = image;
        this.productType = productType;
    }

    public Product(String name) {
        this.name = name;
    }


    public int getId() {
        return id;
    }

    public void setId(int productId) {
        this.id = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String productName) {
        this.name = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String productDescription) {
        this.description = productDescription;
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

    public ProductType getProductTypeId() {
        return productType;
    }

    public void setProductTypeId(ProductType productTypeId) {
        this.productType = productTypeId;
    }
}
