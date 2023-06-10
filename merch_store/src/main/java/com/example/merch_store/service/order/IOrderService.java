package com.example.merch_store.service.order;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<Order> getAll();

    Map<Integer, Double> getTotalPrice();

    List<OrderDetail> getDetails(int id);

    void deleteOrder(int id);

    List<Order> getAllFromACustomer(int customerId);

    List<Order> getOrderByNameCustomer(String name_customer,String status);
}
