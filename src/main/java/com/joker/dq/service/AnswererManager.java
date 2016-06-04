package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.Answerer;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface AnswererManager extends GenericManager<Answerer, Long> {
    
}