package com.example.merch_store.repository;

import com.example.merch_store.model.*;

import java.sql.*;
import java.util.*;

public class OrderRepository implements IOrderRepository {
    private static final String SP_ORDER_MANAGEMENT = "call show_order_management()";
    private static final String SP_DELETE_ORDER = "call delete_order(?)";
    private static final String SP_TOTAL_PRICE = "call get_total_price()";
    private static final String SP_GET_DETAILS = "call get_details(?)";

    @Override
    public List<Order> getAll() {
        Connection connection = BaseRepository.getConnection();
        List<Order> list = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_ORDER_MANAGEMENT);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("order_id");
                String nameEmployee = resultSet.getString("employee_name");
                String nameCustomer = resultSet.getString("customer_name");
                String date = resultSet.getString("order_date");
                String status = resultSet.getString("order_status");
                Customer customer = new Customer(nameCustomer);
                Employee employee = new Employee(nameEmployee);
                Order order = new Order(id, date, customer, employee, status);
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Map<Integer, Integer> getTotalPrice() {
        Map<Integer, Integer> integerMap = new LinkedHashMap<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SP_TOTAL_PRICE);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                int totalPrice = resultSet.getInt("total_price");
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
        Connection connection = BaseRepository.getConnection();
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
//                Order order = new Order(detailsId);
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
        Connection connection = BaseRepository.getConnection();
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
}
