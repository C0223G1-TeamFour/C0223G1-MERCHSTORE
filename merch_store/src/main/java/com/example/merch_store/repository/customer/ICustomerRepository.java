package com.example.merch_store.repository.customer;

import com.example.merch_store.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getListCustomer();

    void deleteCustomer(int id);

    void createCustomer(Customer customer);

    void editCustomer(Customer customer);

    Customer getCustomer(int id);

    void save(Customer customer);

    List<Customer> viewListCustomer(String name, String address);

    Customer findCustomerByAccountId(int accountId);

    boolean checkAccountExistence(String email);

    void addNewCustomerAccount(Customer newCustomer);

    boolean updateShippingInfo(int customerId, String phoneNumber, String address);

    List<String> getUserName();

    boolean editAccount(int customerId, Customer newCustomer);

    boolean deleteAccount(int accountId);
}
