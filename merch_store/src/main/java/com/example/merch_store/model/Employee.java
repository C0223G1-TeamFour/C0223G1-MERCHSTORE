package com.example.merch_store.model;

public class Employee {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String adress;
    private AccountUser accountUser;

    public Employee(int id, String name, String email, String phone, String adress, AccountUser accountUser) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.adress = adress;
        this.accountUser = accountUser;
    }

    public Employee(String name, String email, String number_phone, String address) {
        this.name = name;
        this.email = email;
        this.phone = number_phone;
        this.adress = address;
    }

    public Employee(String name) {
        this.name = name;
    }

    public Employee(String name, String email, String address) {
        this.name = name;
        this.email = email;
        this.adress = address;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public AccountUser getAccountUser() {
        return accountUser;
    }

    public void setAccountUser(AccountUser accountUser) {
        this.accountUser = accountUser;
    }
}
