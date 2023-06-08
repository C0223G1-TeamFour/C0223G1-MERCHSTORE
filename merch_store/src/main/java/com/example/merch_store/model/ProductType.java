package com.example.merch_store.model;

public class ProductType {
    private int productTypeId;
    private String productTypeName;

    public ProductType(int productTypeId) {
    }

    public ProductType(int id, String name) {
        this.productTypeId = id;
        this.productTypeName = name;
    }

    public ProductType(String name) {
        this.productTypeName = name;
    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }
}
