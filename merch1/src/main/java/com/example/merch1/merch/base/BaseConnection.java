package com.example.merch1.merch.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseConnection {
    static String jdbcURL = "jdbc:mysql://localhost:3306/team4";
    static String jdbcUsername = "root";
    static String jdbcPassword = "bigbang23";

    public static final String CHECK_ACCOUNT = "call check_account(?, ?);";
    public static final String CHECK_ROLE = "call check_role(?); ";
    public static final String SELECT_ALL_PRODUCTS = "select * from products;";
    public static final String FIND_PRODUCT = "select * from products where product_id = ?;";
    public static final String DELETE_PRODUCT = "delete from products where product_id = ?;";
    public static final String ADD_PRODUCT = "call add_product(?,?,?,?,?);";
    public static final String UPDATE_PRODUCT = "call update_product(?,?,?,?,?,?);";
    public static final String SELECT_MERCH = "call select_merch();";
    public static final String SELECT_MUSIC = "call select_music();";
    public static final String ADD_CUSTOMER_ACCOUNT = "call create_customer_account(?,?,?,?);";

    public static final String FIND_CUSTOMER_BY_ACCOUNT_ID = "select * from customers where account_id = ?;";
    public static final String CHECK_ACCOUNT_EXISTENCE = "select * from account_users where user_email = ?;";

    public static final String ADD_CART = "insert into cart_details(customer_id, product_id, product_name, product_type_id, price, image, quantity) values (?,?,?,?,?,?,?);";
    public static final String CHECK_CART_EXISTENCE = "select * from cart_details where customer_id = ? and product_id = ?;";
    public static final String UPDATE_CART = "call update_cart(?,?,?);";
    public static final String SELECT_ALL_CARTS = "call view_cart(?);";

    public static final String DELETE_CART = "delete from cart_details where customer_id = ? and product_id = ?;";

    public static final String ADD_ORDER = "insert into orders(customer_id) values (?);";
    public static final String GET_LATEST_ORDER_ID = "call get_latest_order_id();";
    public static final String ADD_ORDER_DETAILS = "insert into order_details(order_id, product_id, product_type_id, quantity, price) values (?,?,?,?,?);";

    public static final String DELETE_ALL_CARTS_AFTER_ORDER = "delete from cart_details where customer_id = ? ;";

    public static final String SELECT_ALL_CUSTOMERS = "select * from customers;";
    public static final String UPDATE_ACCOUNT_INFO = "update customers set customer_name = ?, phone_number = ?, address = ? where customer_id = ?;";
    public static final String DELETE_ACCOUNT = "call delete_account_user(?);";

    public static final String SELECT_ALL_ORDERS = "select * from orders where customer_id = ?;";
    public static final String DELETE_ORDER = "call delete_order(?,?);";
    public static final String CHECK_ORDER_ID = "select * from orders where order_id = ? and customer_id = ?;";

    public static final String SELECT_ORDER_MANAGEMENT = "call show_order_management();";

    public static final String UPDATE_SHIPPING_INFO = "update customers set phone_number = ?, address = ? where customer_id = ? ;";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
