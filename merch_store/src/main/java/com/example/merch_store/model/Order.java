package com.example.merch_store.model;

public class Order {
    private int id;
    private String date;
    private int customerId;
    private String customerName;
    private String email;
    private String phone;
    private String address;
    private Customer customer;
    private Employee employee;
    private String status;

    public Order(String date, Customer customer, Employee employee, String status) {
        this.date = date;
        this.customer = customer;
        this.employee = employee;
        this.status = status;
    }

    public Order(int id, String date, Customer customer, Employee employee, String status) {
        this.id = id;
        this.date = date;
        this.customer = customer;
        this.employee = employee;
        this.status = status;
    }

    public Order(int orderId, String orderTime, String orderStatus) {
        this.id = orderId;
        this.date = orderTime;
        this.status = orderStatus;
    }

    public Order(int id) {
        this.id = id;
    }

    public Order(int orderId, String orderDate, String orderStatus, int customerId, String customerName, String email, String phone, String address) {
        this.id = orderId;
        this.date = orderDate;
        this.status = orderStatus;
        this.customerId = customerId;
        this.customerName = customerName;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

