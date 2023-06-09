package com.example.merch_store.repository.products;

import com.example.merch_store.model.ProductType;


import java.util.List;

public interface IProductTypeRepository {
    List<ProductType> getAll();
}
