package com.example.merch_store.service.products;


import com.example.merch_store.model.ProductType;
import com.example.merch_store.repository.products.IProductTypeRepository;
import com.example.merch_store.repository.products.ProductTypeRepository;

import java.util.List;


public class ProductTypeService implements IProductTypeService {
    private IProductTypeRepository productTypeRepository = new ProductTypeRepository();

    @Override
    public List<ProductType> getAll() {
        return productTypeRepository.getAll();
    }
}
