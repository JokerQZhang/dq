package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.ShipCar;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface ShipCarManager extends GenericManager<ShipCar, Long> {
    
}