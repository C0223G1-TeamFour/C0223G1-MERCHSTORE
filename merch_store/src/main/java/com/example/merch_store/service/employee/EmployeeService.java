package com.example.manage_merch.service;

import com.example.manage_merch.model.Employee;
import com.example.manage_merch.repository.EmployeeRepository;
import com.example.manage_merch.repository.IEmployeeRepository;

public class EmployeeService implements IEmployeeService{
    private IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public Employee getEmployee(int account_id) {
        return employeeRepository.getEmployee(account_id);
    }
}
