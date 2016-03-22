package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.UomConversion;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface UomConversionManager extends GenericManager<UomConversion, Long> {
    
}