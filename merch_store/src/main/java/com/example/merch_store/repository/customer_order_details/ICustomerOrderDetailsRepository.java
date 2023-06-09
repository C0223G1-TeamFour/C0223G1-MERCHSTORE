package com.example.merch_store.repository.customer_order_details;

import com.example.merch_store.model.CustomerOrderDetails;

public interface ICustomerOrderDetailsRepository {
    void addNewOrderDetails(int orderId, CustomerOrderDetails customerOrderDetails);
}
