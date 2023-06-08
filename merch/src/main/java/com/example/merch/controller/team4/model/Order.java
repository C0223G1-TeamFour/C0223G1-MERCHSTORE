package com.example.team4.model;


public class Order {
    private int id;

    private String orderTime;
    private int customerId;

    private String status;
    private String customerName;
    private String email;
    private String phone;
    private String address;

    public Order(){

    }
    public Order(int customerId){
        this.customerId = customerId;
    }
    public Order(int id, String orderTime, int customerId) {
        this.id = id;
        this.orderTime = orderTime;
        this.customerId = customerId;
    }

    public Order(int id, String orderTime, String status) {
        this.id = id;
        this.orderTime = orderTime;
        this.status = status;
    }


    public Order(int id, String orderTime, String status, int customerId, String customerName, String email, String phone, String address) {
        this.id = id;
        this.orderTime = orderTime;
        this.status = status;
        this.customerId = customerId;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
