package com.example.team4.repository.carts;

import com.example.team4.base.BaseConnection;
import com.example.team4.model.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartRepository implements ICartRepository{
    Connection connection = BaseConnection.getConnection();

    @Override
    public void addCart(Cart cart) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.ADD_CART);
            preparedStatement.setInt(1, cart.getCustomerId());
            preparedStatement.setInt(2, cart.getProductId());
            preparedStatement.setString(3, cart.getProductName());
            preparedStatement.setInt(4, cart.getProductTypeId());
            preparedStatement.setDouble(5, cart.getPrice());
            preparedStatement.setString(6, cart.getImage());
            preparedStatement.setInt(7, cart.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean checkCartExistence(int customerId, int productId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.CHECK_CART_EXISTENCE);
            preparedStatement.setInt(1, customerId);
            preparedStatement.setInt(2, productId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCart(int customerId, int productId, int newQuantity) {
        boolean rowUpdated = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.UPDATE_CART);
            preparedStatement.setInt(1, customerId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, newQuantity);
            rowUpdated = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteCart(int customerId, int productId) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.DELETE_CART);
            preparedStatement.setInt(1, customerId);
            preparedStatement.setInt(2, productId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean deleteAllCartsAfterOrder(int customerId) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.DELETE_ALL_CARTS_AFTER_ORDER);
            preparedStatement.setInt(1, customerId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public List<Cart> getAllCarts(int customerId) {
        List<Cart> carts = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.SELECT_ALL_CARTS);
            preparedStatement.setInt(1, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int customerId1 = rs.getInt("customer_id");
                int productId1 = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                int productTypeId = rs.getInt("product_type_id");
                String name = rs.getString("product_name");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                double total = rs.getDouble("total");
                carts.add(new Cart(customerId1, productId1, name, productTypeId, price, image, quantity, total));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carts;
    }
}
