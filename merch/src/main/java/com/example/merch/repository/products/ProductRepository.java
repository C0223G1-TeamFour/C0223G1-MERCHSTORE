package com.example.merch.repository.products;

import com.example.merch.base.BaseConnection;
import com.example.merch.model.Product;
import com.example.merch.model.ProductType;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String INSERT = "insert into products(product_name, product_description, price, image, product_type_id) values(?, ?, ?, ?, ?);";
    private static final String SELECT = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id;";
    private static final String DELETE = "delete from products where product_id = ?;";
    private static final String UPDATE = "update products set product_name = ?, product_description = ?, price = ?, image = ?, product_type_id = ? where product_id = ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id where product_id = ?;";

    private static final String SELECT_MERCH = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id where p.product_type_id = '1';";
    private static final String SELECT_MUSIC = "select p.*, pt.product_type_name from products p join product_type pt on pt.product_type_id = p.product_type_id where p.product_type_id = '2';";
    @Override
    public List<Product> showAll() {
        Connection connection = BaseConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                productList.add(new Product(id, productName, productDescription, price, image, productType));
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
        return productList;
    }

    @Override
    public void createNewProduct(Product product) {
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getProductTypeId().getProductTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    @Override
    public void updateProduct(Product product) {
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(6, product.getId());
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getImage());
            preparedStatement.setInt(5, product.getProductTypeId().getProductTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public Product selectProductById(int id) {
        Product product = null;
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                product = new Product(id, productName, productDescription, price, image, productType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        try {
            PreparedStatement preparedStatement = BaseConnection.getConnection().prepareStatement(BaseConnection.FIND_PRODUCT);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int productId = rs.getInt("product_id");
                String name = rs.getString("product_name");
                String description = rs.getString("product_description");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int productTypeId = rs.getInt("product_type_id");
                ProductType productType = new ProductType(productTypeId);
                product = new Product(productId,name,description,price,image,productType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    @Override
    public List<Product> showAllMerch() {
        Connection connection = BaseConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_MERCH);
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                productList.add(new Product(id, productName, productDescription, price, image, productType));
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
        return productList;
    }


    @Override
    public List<Product> showAllMusic() {
        Connection connection = BaseConnection.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_MUSIC);
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String productName = resultSet.getString("product_name");
                String productDescription = resultSet.getString("product_description");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("image");
                int productTypeId = resultSet.getInt("product_type_id");
                String productTypeName = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(productTypeId, productTypeName);
                productList.add(new Product(id, productName, productDescription, price, image, productType));
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
        return productList;
    }
}

