package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.TestPaper;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface TestPaperManager extends GenericManager<TestPaper, Long> {
    
}