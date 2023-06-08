package com.example.merch.repository.products;


import com.example.merch.base.BaseConnection;
import com.example.merch.model.ProductType;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductTypeRepository implements IProductTypeRepository {
    @Override
    public List<ProductType> getAll() {
        List<ProductType> productTypeList = new ArrayList<>();
        Connection connection = BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select  * from product_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id= resultSet.getInt("product_type_id");
                String name = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(id, name);
                productTypeList.add(productType);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productTypeList;
    }
}
