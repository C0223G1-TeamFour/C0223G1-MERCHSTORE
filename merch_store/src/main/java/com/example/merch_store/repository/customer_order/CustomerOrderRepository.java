package com.example.merch_store.repository.customer_order;

import com.example.merch_store.base.BaseConnection;

import com.example.merch_store.model.CustomerOrder;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerOrderRepository implements ICustomerOrderRepository {
    Connection connection = BaseConnection.getConnection();

    @Override
    public void addNewOrder(int customerId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.ADD_ORDER);
            preparedStatement.setInt(1, customerId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getLatestOrderId() {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.GET_LATEST_ORDER_ID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt("order_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public List<CustomerOrder> getAllOrders(int customerId) {
        List<CustomerOrder> orders = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.SELECT_ALL_ORDERS);
            preparedStatement.setInt(1, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String orderTime = String.valueOf(rs.getTimestamp("order_date"));
                String orderStatus = rs.getString("order_status");
                orders.add(new CustomerOrder(orderId, orderTime, orderStatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public boolean deleteOrder(int orderId, int customerId) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.DELETE_ORDER_FROM_CUSTOMER);
            preparedStatement.setInt(1, orderId);
            preparedStatement.setInt(2, customerId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean checkOrderId(int orderId, int customerId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.CHECK_ORDER_ID);
            preparedStatement.setInt(1, orderId);
            preparedStatement.setInt(2, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<CustomerOrder> getOrderManagement() {
        List<CustomerOrder> orderManagement = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.SELECT_ORDER_MANAGEMENT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String orderDate = String.valueOf(rs.getTimestamp("order_date"));
                String orderStatus = rs.getString("order_status");
                int customerId = rs.getInt("customer_id");
                String customerName = rs.getString("customer_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                orderManagement.add(new CustomerOrder(orderId, orderDate, orderStatus, customerId, customerName, email, phone, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderManagement;
    }
}
