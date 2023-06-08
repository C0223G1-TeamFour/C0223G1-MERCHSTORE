package com.example.merch_store.repository;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;

import java.util.List;
import java.util.Map;

public interface IOrderRepository {
    List<Order> getAll();

    Map<Integer, Integer> getTotalPrice();

    List<OrderDetail> getDetails(int id);

    void deleteOrder(int id);

}
