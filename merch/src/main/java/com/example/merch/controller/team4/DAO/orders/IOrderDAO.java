package com.example.team4.DAO.orders;

import com.example.team4.model.Order;

import java.util.List;

public interface IOrderDAO {
    void addNewOrder(int customerId);

    int getLatestOrderId();
    List<Order> getAllOrders(int customerId);

    boolean deleteOrder(int orderId, int customerId);

    boolean checkOrderId(int orderId, int customerId);

    List<Order> getOrderManagement();

}
