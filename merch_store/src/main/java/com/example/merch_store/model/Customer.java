package com.example.merch_store.model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private int phoneNumber;
    private String address;
    private AccountUser accountUser;

    public Customer(String name) {
        this.name = name;
    }

    public Customer(String name, String email, int phoneNumber, String address, AccountUser accountUser) {
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.accountUser = accountUser;
    }

    public Customer(int id, String name, String email, int phoneNumber, String address, AccountUser accountId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.accountUser = accountId;
    }

    public Customer() {
    }

    public AccountUser getAccountUser() {
        return accountUser;
    }

    public void setAccountUser(AccountUser accountUser) {
        this.accountUser = accountUser;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
