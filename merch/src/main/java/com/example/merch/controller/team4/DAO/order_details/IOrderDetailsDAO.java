package com.example.team4.DAO.order_details;

import com.example.team4.model.OrderDetails;

public interface IOrderDetailsDAO {
    void addNewOrderDetails(int orderId, OrderDetails orderDetails);
}
