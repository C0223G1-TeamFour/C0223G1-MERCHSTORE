package com.example.manage_merch.service;

import com.example.manage_merch.model.Customer;
import com.example.manage_merch.repository.CustomerRepository;
import com.example.manage_merch.repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    private List<Customer> customerList;
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.getListCustomer();
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void editCustomer(int id, Customer customer) {
        customerRepository.editCustomer(id,customer);
    }

    @Override
    public Customer getCustomer(int id) {
        return customerRepository.getCustomer(id);
    }

    @Override
    public void saveCustomer(Customer customer) {
       customerRepository.save(customer);
    }

    @Override
    public List<Customer> searchCustomer(String name, String address) {
        return customerRepository.viewListCustomer(name,address);
    }
}
