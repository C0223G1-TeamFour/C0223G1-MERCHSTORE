package com.example.merch_store.service.products;

import com.example.merch_store.model.Product;
import com.example.merch_store.repository.products.IProductRepository;
import com.example.merch_store.repository.products.ProductRepository;


import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> showAll() {
        return iProductRepository.showAll();
    }

    @Override
    public void createNewProduct(Product product) {
        iProductRepository.createNewProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRepository.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);
    }

    @Override
    public Product selectProductById(int id) {
        return iProductRepository.selectProductById(id);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public List<Product> showAllMerch() {
        return iProductRepository.showAllMerch();
    }

    @Override
    public List<Product> showAllMusic() {
        return iProductRepository.showAllMusic();
    }

    @Override
    public List<Product> searchProduct(String name, double price) {
        return iProductRepository.searchProduct(name, price);
    }
}
