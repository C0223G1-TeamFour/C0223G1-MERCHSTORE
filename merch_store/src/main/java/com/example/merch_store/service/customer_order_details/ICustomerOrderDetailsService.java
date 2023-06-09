package com.example.merch_store.service.customer_order_details;

import com.example.merch_store.model.CustomerOrderDetails;

public interface ICustomerOrderDetailsService {
    void addNewOrderDetails(int orderId, CustomerOrderDetails customerOrderDetails);
}
