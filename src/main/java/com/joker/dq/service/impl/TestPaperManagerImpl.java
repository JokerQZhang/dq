package com.joker.dq.service.impl;

import com.joker.dq.dao.TestPaperDao;
import com.joker.dq.model.TestPaper;
import com.joker.dq.service.TestPaperManager;
import com.joker.dq.service.impl.GenericManagerImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.jws.WebService;

@Service("testPaperManager")
@WebService(serviceName = "TestPaperService", endpointInterface = "com.joker.dq.service.TestPaperManager")
public class TestPaperManagerImpl extends GenericManagerImpl<TestPaper, Long> implements TestPaperManager {
    TestPaperDao testPaperDao;

    @Autowired
    public TestPaperManagerImpl(TestPaperDao testPaperDao) {
        super(testPaperDao);
        this.testPaperDao = testPaperDao;
    }
}