package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.Price;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface PriceManager extends GenericManager<Price, Long> {
    public List getProductPriceList(String groupId, String lastdate);
    public List getDateList(String lastdate);
    public Price getDayPrice(String productId, String priceDate, String groupId);
}