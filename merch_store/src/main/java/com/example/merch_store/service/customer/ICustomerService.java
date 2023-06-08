package com.example.manage_merch.service;

import com.example.manage_merch.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void deleteCustomer(int id);
    void editCustomer(int id,Customer customer);
    Customer getCustomer(int id_customer);
    void saveCustomer(Customer customer);
    List<Customer> searchCustomer(String name,String address);
}
