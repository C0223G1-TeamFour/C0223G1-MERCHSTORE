package com.example.merch_store.repository.employee;


import com.example.merch_store.base.BaseConnection;
import com.example.merch_store.model.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeRepository implements IEmployeeRepository {

    private static final String SELECT_EMPLOYEE = "SELECT *from employee where account_id=?";

    @Override
    public Employee getEmployee(int employee_id) {
        Connection connection = BaseConnection.getConnection();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE);
            preparedStatement.setInt(1, employee_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("employee_name");
                String number_phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                employee = new Employee(name, email, number_phone, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}
