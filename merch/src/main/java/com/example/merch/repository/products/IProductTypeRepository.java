package com.example.merch.repository.products;



import com.example.merch.model.ProductType;


import java.util.List;

public interface IProductTypeRepository {
    List<ProductType> getAll();
}
