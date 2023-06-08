package com.example.team4.service.products;
import com.example.team4.model.ProductType;
import com.example.team4.repository.products.IProductTypeRepository;
import com.example.team4.repository.products.ProductTypeRepository;

import java.util.List;

public class ProductTypeService implements IProductTypeService {
    private IProductTypeRepository productTypeRepository = new ProductTypeRepository();
    @Override
    public List<ProductType> getAll() {
        return productTypeRepository.getAll();
    }
}
