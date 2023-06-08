package com.example.merch1.merch.repository.products;



import com.example.merch.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showAll();
    void createNewProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
    Product selectProductById(int id);
    Product findById(int id);

    List<Product> showAllMerch();
    List<Product> showAllMusic();
}
