package com.example.team4.DAO.customers;

import com.example.team4.model.Customer;

import java.util.List;

public interface ICustomerDAO {
    void addNewCustomerAccount(Customer newCustomer);

    List<Customer> getAllCustomers();

    Customer findCustomerByAccountId(int accountId);

    boolean checkAccountExistence(String email);

    boolean editAccount(int customerId, Customer newCustomer);

    boolean deleteAccount(int accountId);

    boolean updateShippingInfo(int customerId, String phoneNumber, String address);
}
