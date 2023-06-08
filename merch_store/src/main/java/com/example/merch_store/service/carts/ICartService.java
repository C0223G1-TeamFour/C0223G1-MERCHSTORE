package com.example.merch_store.service.carts;

import com.example.merch_store.model.Cart;


import java.util.List;

public interface ICartService {
    void addCart(Cart cart);

    boolean checkCartExistence(int customerId, int productId);

    boolean updateCart(int customerId, int productId, int newQuantity);

    boolean deleteCart(int customerId, int productId);

    boolean deleteAllCartsAfterOrder(int customerId);

    List<Cart> getAllCarts(int customerId);
}
