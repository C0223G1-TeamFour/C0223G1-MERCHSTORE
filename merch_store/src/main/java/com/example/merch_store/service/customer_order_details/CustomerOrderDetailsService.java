package com.example.merch_store.service.customer_order_details;


import com.example.merch_store.model.CustomerOrderDetails;
import com.example.merch_store.repository.customer_order_details.CustomerOrderDetailsRepository;
import com.example.merch_store.repository.customer_order_details.ICustomerOrderDetailsRepository;

public class CustomerOrderDetailsService implements ICustomerOrderDetailsService {
    private final ICustomerOrderDetailsRepository iCustomerOrderDetailsRepository = new CustomerOrderDetailsRepository();

    @Override
    public void addNewOrderDetails(int orderId, CustomerOrderDetails customerOrderDetails) {
        iCustomerOrderDetailsRepository.addNewOrderDetails(orderId, customerOrderDetails);
    }
}
