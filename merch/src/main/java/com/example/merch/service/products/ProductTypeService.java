package com.example.merch.service.products;
import com.example.merch.model.ProductType;
import com.example.merch.repository.products.IProductTypeRepository;
import com.example.merch.repository.products.ProductTypeRepository;


import java.util.List;

public class ProductTypeService implements IProductTypeService {
    private IProductTypeRepository productTypeRepository = new ProductTypeRepository();
    @Override
    public List<ProductType> getAll() {
        return productTypeRepository.getAll();
    }
}
