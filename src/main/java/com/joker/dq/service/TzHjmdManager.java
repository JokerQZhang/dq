package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.TzHjmd;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface TzHjmdManager extends GenericManager<TzHjmd, Long> {
    
}