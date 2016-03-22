package com.joker.dq.service.impl;

import com.joker.dq.dao.ShipCarDao;
import com.joker.dq.model.ShipCar;
import com.joker.dq.service.ShipCarManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("shipCarManager")
@WebService(serviceName = "ShipCarService", endpointInterface = "com.joker.dq.service.ShipCarManager")
public class ShipCarManagerImpl extends GenericManagerImpl<ShipCar, Long> implements ShipCarManager {
    ShipCarDao shipCarDao;

    @Autowired
    public ShipCarManagerImpl(ShipCarDao shipCarDao) {
        super(shipCarDao);
        this.shipCarDao = shipCarDao;
    }
}