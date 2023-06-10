package com.example.merch_store.repository.order;

import com.example.merch_store.base.BaseConnection;
import com.example.merch_store.model.*;

import java.sql.*;
import java.util.*;

public class OrderRepository implements IOrderRepository {
    private static final String SP_ORDER_MANAGEMENT = "call show_order_management()";
    private static final String SP_DELETE_ORDER = "call delete_order(?)";
    private static final String SP_TOTAL_PRICE = "call get_total_price()";
    private static final String SP_GET_DETAILS = "call get_details(?)";
    private static final String SP_FIND_ORDER_BY_NAME = "call find_order_by_name_customer(?,?)";

    @Override
    public List<Order> getAll() {
        Connection connection = BaseConnection.getConnection();
        List<Order> list = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_ORDER_MANAGEMENT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("order_id");
                String nameCustomer = resultSet.getString("customer_name");
                String date = resultSet.getString("order_date");
                String status = resultSet.getString("order_status");
                Customer customer = new Customer(nameCustomer);
                Order order = new Order(id, date, customer, status);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Map<Integer, Double> getTotalPrice() {
        Map<Integer, Double> integerMap = new LinkedHashMap<>();
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_TOTAL_PRICE);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                double totalPrice = resultSet.getDouble("total_price");
                integerMap.put(orderId, totalPrice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return integerMap;
    }

    @Override
    public List<OrderDetail> getDetails(int id) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_GET_DETAILS);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int detailsId = resultSet.getInt("order_details_id");
                String name = resultSet.getString("product_name");
                int quantity = resultSet.getInt("quantity");
                double price = resultSet.getDouble("price");
                Product product = new Product(name);
                OrderDetail orderDetail = new OrderDetail(detailsId, product, quantity, price);
                orderDetailList.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetailList;
    }


    @Override
    public void deleteOrder(int id) {
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_DELETE_ORDER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Order> getAllFromACustomer(int customerId) {
        List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(BaseConnection.SELECT_ALL_ORDERS);
            preparedStatement.setInt(1, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                String orderTime = String.valueOf(rs.getTimestamp("order_date"));
                String orderStatus = rs.getString("order_status");
                orders.add(new Order(orderId, orderTime, orderStatus));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;

    }

    @Override
    public List<Order> getOrderByNameCustomer(String name_customer,String status) {
        List<Order> list = new ArrayList<>();
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_FIND_ORDER_BY_NAME);
            callableStatement.setString(1, name_customer);
            callableStatement.setString(2, status);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("order_id");
                String date = resultSet.getString("order_date");
                String nameCustomer = resultSet.getString("customer_name");
                String order_status = resultSet.getString("order_status");
                Customer customer = new Customer(nameCustomer);
                Order order = new Order(id, date, customer, order_status);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
