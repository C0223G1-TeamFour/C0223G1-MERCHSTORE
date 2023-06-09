package com.example.merch_store.repository.customer_order;

import com.example.merch_store.model.CustomerOrder;
import com.example.merch_store.model.Order;

import java.util.List;

public interface ICustomerOrderRepository {
    void addNewOrder(int customerId);

    int getLatestOrderId();

    List<CustomerOrder> getAllOrders(int customerId);

    boolean deleteOrder(int orderId, int customerId);

    boolean checkOrderId(int orderId, int customerId);

    List<CustomerOrder> getOrderManagement();
}
