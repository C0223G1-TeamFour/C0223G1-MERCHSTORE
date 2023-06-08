package com.example.team4.DAO.customers;

import com.example.team4.base.BaseConnection;
import com.example.team4.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    public static Connection connection = BaseConnection.getConnection();


    @Override
    public void addNewCustomerAccount(Customer newCustomer) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.ADD_CUSTOMER_ACCOUNT);
            preparedStatement.setString(1, newCustomer.getFirstName());
            preparedStatement.setString(2, newCustomer.getLastName());
            preparedStatement.setString(3, newCustomer.getEmail());
            preparedStatement.setString(4, newCustomer.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.SELECT_ALL_CUSTOMERS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                int accountId = rs.getInt("account_id");
                String name = rs.getString("customer_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                customers.add(new Customer(customerId, name, email, phone, address, accountId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public Customer findCustomerByAccountId(int accountId) {
        System.out.println("hhihihi acc id" + accountId);
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.FIND_CUSTOMER_BY_ACCOUNT_ID);
            preparedStatement.setInt(1, accountId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String name = rs.getString("customer_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone_number");
                String address = rs.getString("address");
                int accountId1 = rs.getInt("account_id");
                customer = new Customer(customerId, name, email, phone, address, accountId1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }

    @Override
    public boolean checkAccountExistence(String email) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.CHECK_ACCOUNT_EXISTENCE);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editAccount(int customerId, Customer newCustomer) {
        boolean rowEdited = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.UPDATE_ACCOUNT_INFO);
            preparedStatement.setString(1, newCustomer.getFullName());
            preparedStatement.setString(2, newCustomer.getPhone());
            preparedStatement.setString(3, newCustomer.getAddress());
            preparedStatement.setInt(4, customerId);
            rowEdited = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowEdited;
    }

    @Override
    public boolean deleteAccount(int accountId) {
        boolean rowDeleted = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.DELETE_ACCOUNT);
            preparedStatement.setInt(1, accountId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateShippingInfo(int customerId, String phoneNumber, String address) {
        boolean rowEdited = false;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BaseConnection.UPDATE_SHIPPING_INFO);
            preparedStatement.setString(1, phoneNumber);
            preparedStatement.setString(2, address);
            preparedStatement.setInt(3, customerId);
            rowEdited = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowEdited;
    }
}
