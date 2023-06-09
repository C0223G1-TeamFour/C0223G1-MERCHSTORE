package com.example.merch_store.repository.customer_order_details;

import com.example.merch_store.base.BaseConnection;
import com.example.merch_store.model.CustomerOrderDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerOrderDetailsRepository implements ICustomerOrderDetailsRepository {
    @Override
    public void addNewOrderDetails(int orderId, CustomerOrderDetails orderDetails) {
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.ADD_ORDER_DETAILS);
            preparedStatement.setInt(1, orderId);
            preparedStatement.setInt(2, orderDetails.getProductId());
            preparedStatement.setInt(3, orderDetails.getProductTypeId());
            preparedStatement.setInt(4, orderDetails.getQuantity());
            preparedStatement.setDouble(5, orderDetails.getPrice());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
