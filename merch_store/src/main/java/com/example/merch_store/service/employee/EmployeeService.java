package com.example.merch_store.service.employee;


import com.example.merch_store.model.Employee;
import com.example.merch_store.repository.employee.EmployeeRepository;
import com.example.merch_store.repository.employee.IEmployeeRepository;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public Employee getEmployee(int account_id) {
        return employeeRepository.getEmployee(account_id);
    }
}
