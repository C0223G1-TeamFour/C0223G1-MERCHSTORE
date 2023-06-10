package com.example.merch_store.service.order;

import com.example.merch_store.model.Order;
import com.example.merch_store.model.OrderDetail;
import com.example.merch_store.repository.order.OrderRepository;

import java.util.List;
import java.util.Map;

public class OrderService implements IOrderService {
    private OrderRepository orderRepository = new OrderRepository();

    @Override
    public List<Order> getAll() {
        return orderRepository.getAll();
    }

    @Override
    public Map<Integer, Double> getTotalPrice() {
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

    @Override
    public List<Order> getAllFromACustomer(int customerId) {
        return orderRepository.getAllFromACustomer(customerId);
    }

    @Override
    public List<Order> getOrderByNameCustomer(String name_customer,String status) {
        return orderRepository.getOrderByNameCustomer(name_customer,status);
    }
}
