package com.example.merch_store.service.customer_order;

import com.example.merch_store.model.Customer;
import com.example.merch_store.model.CustomerOrder;
import com.example.merch_store.model.Order;
import com.example.merch_store.repository.customer.ICustomerRepository;
import com.example.merch_store.repository.customer_order.CustomerOrderRepository;
import com.example.merch_store.repository.customer_order.ICustomerOrderRepository;

import java.util.List;

public class CustomerOrderService implements ICustomerOrderService {
    private ICustomerOrderRepository iCustomerOrderRepository = new CustomerOrderRepository();
    @Override
    public void addNewOrder(int customerId) {
        iCustomerOrderRepository.addNewOrder(customerId);
    }

    @Override
    public int getLatestOrderId() {
        return iCustomerOrderRepository.getLatestOrderId();
    }

    @Override
    public List<CustomerOrder> getAllOrders(int customerId) {
        return iCustomerOrderRepository.getAllOrders(customerId);
    }

    @Override
    public boolean deleteOrder(int orderId, int customerId) {
        return iCustomerOrderRepository.deleteOrder(orderId,customerId);
    }

    @Override
    public boolean checkOrderId(int orderId, int customerId) {
        return iCustomerOrderRepository.checkOrderId(orderId,customerId);
    }

    @Override
    public List<CustomerOrder> getOrderManagement() {
        return iCustomerOrderRepository.getOrderManagement();
    }
}
