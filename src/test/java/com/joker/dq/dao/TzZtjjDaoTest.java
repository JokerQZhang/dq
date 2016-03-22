package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzZtjj;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzZtjjDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzZtjjDao tzZtjjDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzZtjj() {
        TzZtjj tzZtjj = new TzZtjj();

        // enter all required fields

        log.debug("adding tzZtjj...");
        tzZtjj = tzZtjjDao.save(tzZtjj);

        tzZtjj = tzZtjjDao.get(tzZtjj.getZtjjId());

        assertNotNull(tzZtjj.getZtjjId());

        log.debug("removing tzZtjj...");

        tzZtjjDao.remove(tzZtjj.getZtjjId());

        // should throw DataAccessException 
        tzZtjjDao.get(tzZtjj.getZtjjId());
    }
}