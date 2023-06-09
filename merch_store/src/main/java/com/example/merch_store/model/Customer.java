package com.example.merch_store.model;

public class Customer {
    private int id;
    private String name;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String address;
    private int accountId;
    private AccountUser accountUser;
    private String passWord;

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Customer(int customerId, String name, String email, String phone, String address, int accountId1) {
        this.id = customerId;
        this.name = name;
        this.email = email;
        this.phoneNumber = phone;
        this.address = address;
        this.accountId = accountId1;
    }

    public Customer(String name, String email, String phoneNumber, String address, AccountUser accountUser) {
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.accountUser = accountUser;
    }

    public Customer(int id, String name, String email, String phoneNumber, String address, AccountUser accountUser) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.accountUser = accountUser;
    }

//    public Customer(int id_customer, String name_customer, String email, String phone, String nameCustomer) {
//        this.id = id_customer;
//        this.name = name_customer;
//        this.email = email;
//        this.phoneNumber = phone;
//    }
    public Customer(int id_customer, String name_customer, String email, String phone, String address) {
        this.id = id_customer;
        this.name = name_customer;
        this.email = email;
        this.phoneNumber = phone;
        this.address = address;
    }

    public Customer(String name, String phone, String address) {
        this.name = name;
        this.phoneNumber = phone;
        this.address = address;
    }

    public Customer(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.passWord = password;
    }

    public Customer(String nameCustomer) {
        this.name = nameCustomer;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
