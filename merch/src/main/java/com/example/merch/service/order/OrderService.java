package com.example.merch_store.service;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.example.merch_store.repository.OrderRepository;

import java.util.List;
import java.util.Map;

public class OrderService implements IOrderService {
    private OrderRepository orderRepository = new OrderRepository();

    @Override
    public List<Order> getAll() {
        return orderRepository.getAll();
    }

    @Override
    public Map<Integer, Integer> getTotalPrice() {
        return orderRepository.getTotalPrice();
    }

    @Override
    public List<OrderDetail> getDetails(int id) {
        return orderRepository.getDetails(id);
    }

    @Override
    public void deleteOrder(int id) {
        orderRepository.deleteOrder(id);
    }
}
