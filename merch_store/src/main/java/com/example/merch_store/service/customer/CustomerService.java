package com.example.merch_store.service.customer;


import com.example.merch_store.model.Customer;
import com.example.merch_store.repository.customer.CustomerRepository;
import com.example.merch_store.repository.customer.ICustomerRepository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private List<Customer> customerList;
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.getListCustomer();
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void editCustomer(int id, Customer customer) {
        customerRepository.editCustomer(id, customer);
    }

    @Override
    public Customer getCustomer(int id) {
        return customerRepository.getCustomer(id);
    }

    @Override
    public Map<String, String> saveCustomer(Customer customer) {
        List<String> stringUserName = customerRepository.getUserName();
        boolean flag = true;

        String x = "";
        Map<String, String> mapValidation = new HashMap<>();
        if (customer.getName().equals("")) {
            mapValidation.put("name", "Vui lòng không để trống");
        } else if (customer.getName().matches("^([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$")) {
            mapValidation.put("name", x);
        } else {
            mapValidation.put("name", "Bạn nhập  sai cú pháp");
            flag = false;
        }
        if (customer.getEmail().equals("")) {
            mapValidation.put("email", "Vui lòng không để trống");
        } else if (customer.getEmail().matches("[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$")) {
            boolean flagEmail = true;
            for (String userEmail : stringUserName) {
                if (userEmail.equals(customer.getEmail())) {
                    mapValidation.put("email", "Tài khoản đã tồn tại");
                    flagEmail = false;
                    break;
                }
            }
            if (flagEmail) {
                mapValidation.put("email", x);
            }
        } else {
            mapValidation.put("email", "Bạn nhập địa chỉ email sai cú pháp");
            flag = false;
        }
        if (customer.getAddress().equals("")) {
            mapValidation.put("address", "Vui lòng không để trống");
        } else if (customer.getAddress().matches("^[A-Za-z -]*$")) {
            mapValidation.put("address", x);
        } else {
            mapValidation.put("address", "Bạn nhập địa chỉ  sai cú pháp");
            flag = false;
        }
        if (customer.getPhoneNumber().equals("")) {
            mapValidation.put("phone", "Vui lòng không để trống");
        } else if (customer.getPhoneNumber().matches("^[0][0-9]{9}$")) {
            mapValidation.put("phone", x);
        } else {
            mapValidation.put("phone", "Bạn nhập số điện thoại  sai cú pháp");
            flag = false;
        }
        if (customer.getAccountUser().getUserPassword().equals("")) {
            mapValidation.put("password", "Vui lòng không để trống");
        } else if (customer.getAccountUser().getUserPassword().matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}")) {
            mapValidation.put("password", x);
        } else {
            mapValidation.put("password", "Bạn nhập mật khẩu  sai cú pháp");
            flag = false;
        }
        if (flag) {
            customerRepository.save(customer);

        }
        return mapValidation;
    }

    @Override
    public List<Customer> searchCustomer(String name, String address) {
        return customerRepository.viewListCustomer(name, address);
    }

    @Override
    public Customer findCustomerByAccountId(int accountId) {
        return customerRepository.findCustomerByAccountId(accountId);
    }

    @Override
    public boolean checkAccountExistence(String email) {
        return customerRepository.checkAccountExistence(email);
    }

    @Override
    public void addNewCustomerAccount(Customer newCustomer) {
        customerRepository.addNewCustomerAccount(newCustomer);
    }

    @Override
    public boolean updateShippingInfo(int customerId, String phoneNumber, String address) {
        return customerRepository.updateShippingInfo(customerId, phoneNumber, address);
    }

    @Override
    public boolean editAccount(int customerId, Customer newCustomer) {
        return customerRepository.editAccount(customerId, newCustomer);
    }

    @Override
    public boolean deleteAccount(int accountId) {
        return customerRepository.deleteAccount(accountId);
    }
}
