package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.Uom;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface UomManager extends GenericManager<Uom, Long> {
    
}