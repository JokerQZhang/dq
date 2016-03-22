package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.DqHui;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class DqHuiDaoTest extends BaseDaoTestCase {
    @Autowired
    private DqHuiDao dqHuiDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveDqHui() {
        DqHui dqHui = new DqHui();

        // enter all required fields

        log.debug("adding dqHui...");
        dqHui = dqHuiDao.save(dqHui);

        dqHui = dqHuiDao.get(dqHui.getHuiId());

        assertNotNull(dqHui.getHuiId());

        log.debug("removing dqHui...");

        dqHuiDao.remove(dqHui.getHuiId());

        // should throw DataAccessException 
        dqHuiDao.get(dqHui.getHuiId());
    }
}