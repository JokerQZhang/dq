package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.DqHui;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface DqHuiManager extends GenericManager<DqHui, Long> {
    
}