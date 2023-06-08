package com.example.merch_store.service.customer;


import com.example.merch_store.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    void deleteCustomer(int id);

    void editCustomer(int id, Customer customer);

    Customer getCustomer(int id_customer);

    void saveCustomer(Customer customer);

    List<Customer> searchCustomer(String name, String address);

    Customer findCustomerByAccountId(int accountId);

    boolean checkAccountExistence(String email);
    void addNewCustomerAccount(Customer newCustomer);
}
