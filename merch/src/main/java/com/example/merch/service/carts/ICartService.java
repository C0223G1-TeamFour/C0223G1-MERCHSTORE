package com.example.team4.service.carts;

import com.example.team4.model.Cart;

import java.util.List;

public interface ICartService {
    void addCart(Cart cart);

    boolean checkCartExistence(int customerId, int productId);

    boolean updateCart(int customerId, int productId, int newQuantity);

    boolean deleteCart(int customerId, int productId);

    boolean deleteAllCartsAfterOrder(int customerId);

    List<Cart> getAllCarts(int customerId);
}
