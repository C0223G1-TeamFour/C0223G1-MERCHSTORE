package com.example.team4.service.products;



import com.example.team4.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showAll();
    void createNewProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
    Product selectProductById(int id);
    Product findById(int id);
    List<Product> showAllMerch();
    List<Product> showAllMusic();
}
