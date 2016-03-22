package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TzHjmd;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TzHjmdDaoTest extends BaseDaoTestCase {
    @Autowired
    private TzHjmdDao tzHjmdDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTzHjmd() {
        TzHjmd tzHjmd = new TzHjmd();

        // enter all required fields

        log.debug("adding tzHjmd...");
        tzHjmd = tzHjmdDao.save(tzHjmd);

        tzHjmd = tzHjmdDao.get(tzHjmd.getHjmdId());

        assertNotNull(tzHjmd.getHjmdId());

        log.debug("removing tzHjmd...");

        tzHjmdDao.remove(tzHjmd.getHjmdId());

        // should throw DataAccessException 
        tzHjmdDao.get(tzHjmd.getHjmdId());
    }
}