package com.joker.dq.service.impl;

import com.joker.dq.dao.ProductDao;
import com.joker.dq.model.Product;
import com.joker.dq.service.ProductManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("productManager")
@WebService(serviceName = "ProductService", endpointInterface = "com.joker.dq.service.ProductManager")
public class ProductManagerImpl extends GenericManagerImpl<Product, Long> implements ProductManager {
    ProductDao productDao;

    @Autowired
    public ProductManagerImpl(ProductDao productDao) {
        super(productDao);
        this.productDao = productDao;
    }
}