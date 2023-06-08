package com.example.merch_store.model;

public class Order {
    private int id;
    private String date;
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

    public Order() {
    }

    public Order(int id) {
        this.id = id;
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

