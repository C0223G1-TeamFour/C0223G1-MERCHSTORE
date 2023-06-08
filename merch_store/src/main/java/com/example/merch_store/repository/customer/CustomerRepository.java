package com.example.manage_merch.repository;

import com.example.manage_merch.model.AccountUser;
import com.example.manage_merch.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_EMPLOYEE = "SELECT customers.customer_id,customers.customer_name,customers.email,customers.phone_number,customers.address FROM customers \n" +
            "join account_users on account_users.account_id = customers.account_id\n" +
            "join users_role on users_role.account_id =account_users.account_id\n" +
            "join roles on roles.role_id = users_role.role_id\n" +
            "where roles.role_name like \"nhân viên\"";
    private static final String SELECT_CUSTOMER = "select *from customers c join account_users a on c.account_id = a.account_id where c.is_delete=0";
    private static final String SELECT_CUSTOMER_BY_NAME = "select *from customers where customer_name like ?";
    private static final String SELECT_CUSTOMER_BY_ADDRESS = "select *from customers where address like ?";
    private static final String SELECT_CUSTOMER_BY_ADDRESS_NAME = "select *from customers where address like ? and customer_name like ?";
    private static final String DELETE_CUSTOMER_BY_ID = "update customers set is_delete=1 where customer_id=?";
    private static final String Edit_Customer = "update customers set customer_name=?,phone_number=?,address=? where customer_id=? and is_delete=0";
    private static final String CREATE_CUSTOMER = "insert into customers(customer_name,email,phone_number,address,account_id) " +
            "values (?,?,?,?,?)";
    private static final String SELECT_CUSTOMER_BY_ID ="select * from customers join account_users on account_users.account_id=customers.account_id where is_delete=0 and customers.customer_id=?";
    private  static final  String INSERT_ACCOUNT_USER="insert into account_users(user_email, user_password) value (?,?)";
    private static final  String INSERT_CUSTOMER="call addCustomer(?,?,?,?,?)";
    private  static  final String FIND_CUSTOMER="call findCustomer(?,?)";

    @Override
    public List<Customer> getListCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_customer = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String password = resultSet.getString("user_password");
                AccountUser accountUser = new AccountUser(email,password);
                Customer customer = new Customer(id_customer, name,email, phone,address,accountUser);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerList;
    }


    @Override
    public void deleteCustomer(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
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
    public void createCustomer(Customer customer) {

    }

    //    private static final String Edit_Customer = "update customers set customer_name=?,email=?,phone_number=?,address=? where customer_id=?";
    @Override
    public void editCustomer(int id, Customer customer) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(Edit_Customer);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setInt(4, id);
            int resultSet = preparedStatement.executeUpdate();
            System.out.println(resultSet);
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
    public Customer getCustomer(int id) {
        Customer customer = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone_number");
                String address = resultSet.getString("address");
                String user_password = resultSet.getString("user_password");
                AccountUser accountID = new AccountUser(email, user_password);
                customer = new Customer(id,name,email,phone,address,accountID);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_CUSTOMER);
            callableStatement.setString(1, customer.getName());
            callableStatement.setString(2, customer.getPhone());
            callableStatement.setString(3,customer.getEmail());
            callableStatement.setString(4,customer.getAddress());
            callableStatement.setString(5,customer.getAccountUser().getPassWord());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Customer> viewListCustomer(String name, String address) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_CUSTOMER);
            callableStatement.setString(1,name);
            callableStatement.setString(2,address);
            ResultSet resultSet= callableStatement.executeQuery();
            while (resultSet.next()){
                int id_customer = resultSet.getInt("customer_id");
                String name_customer= resultSet.getString("customer_name");
                String email= resultSet.getString("email");
                String phone= resultSet.getString("phone_number");
                String address_customer= resultSet.getString("address");
                Customer customer =new  Customer(id_customer,name_customer,email,phone,address_customer);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

}
