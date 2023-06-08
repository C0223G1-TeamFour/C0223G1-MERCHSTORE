package com.example.team4.service.carts;

import com.example.team4.model.Cart;
import com.example.team4.repository.carts.CartRepository;
import com.example.team4.repository.carts.ICartRepository;

import java.util.List;

public class CartService implements ICartService{
    ICartRepository iCartRepository = new CartRepository();
    @Override
    public void addCart(Cart cart) {
        iCartRepository.addCart(cart);
    }

    @Override
    public boolean checkCartExistence(int customerId, int productId) {
        return iCartRepository.checkCartExistence(customerId, productId);
    }

    @Override
    public boolean updateCart(int customerId, int productId, int newQuantity) {
        return iCartRepository.updateCart(customerId, productId, newQuantity);
    }

    @Override
    public boolean deleteCart(int customerId, int productId) {
        return iCartRepository.deleteCart(customerId, productId);
    }

    @Override
    public boolean deleteAllCartsAfterOrder(int customerId) {
        return iCartRepository.deleteAllCartsAfterOrder(customerId);
    }

    @Override
    public List<Cart> getAllCarts(int customerId) {
        return iCartRepository.getAllCarts(customerId);
    }
}
