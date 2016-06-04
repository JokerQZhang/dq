package com.joker.dq.service.impl;

import com.joker.dq.dao.AnswererDao;
import com.joker.dq.model.Answerer;
import com.joker.dq.service.AnswererManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("answererManager")
@WebService(serviceName = "AnswererService", endpointInterface = "com.joker.dq.service.AnswererManager")
public class AnswererManagerImpl extends GenericManagerImpl<Answerer, Long> implements AnswererManager {
    AnswererDao answererDao;

    @Autowired
    public AnswererManagerImpl(AnswererDao answererDao) {
        super(answererDao);
        this.answererDao = answererDao;
    }
}