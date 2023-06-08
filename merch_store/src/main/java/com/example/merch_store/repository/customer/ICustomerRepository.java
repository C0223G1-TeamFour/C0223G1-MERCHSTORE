package com.example.manage_merch.repository;

import com.example.manage_merch.model.AccountUser;
import com.example.manage_merch.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getListCustomer();
    void deleteCustomer(int id);
    void createCustomer(Customer customer);
    void editCustomer(int id,Customer customer);
    Customer getCustomer(int id);
    void save(Customer customer);
    List<Customer> viewListCustomer(String name,String address);
}
