package com.example.merch_store.repository.order;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.util.List;
import java.util.Map;

public interface IOrderRepository {
    List<Order> getAll();

    Map<Integer, Double> getTotalPrice();

    List<OrderDetail> getDetails(int id);

    void deleteOrder(int id);

    List<Order> getAllFromACustomer(int customerId);

    List<Order> getOrderByNameCustomer(String name_customer,String status);

}
