package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.TbProvide;

import java.math.BigDecimal;
import java.util.List;

import javax.jws.WebService;

@WebService
public interface TbProvideManager extends GenericManager<TbProvide, Long> {
    public boolean getProvideNameExists(String provideName);
    public boolean saveProvideDtl(TbProvide tbProvide, String yfTypeId);
    public BigDecimal getMoneySum(Long privideId);
    public boolean removeDtl(Long privideId);
    public boolean sendMoneyDtl(TbProvide tbProvide);
}