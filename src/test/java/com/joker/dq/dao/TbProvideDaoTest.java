package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TbProvide;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TbProvideDaoTest extends BaseDaoTestCase {
    @Autowired
    private TbProvideDao tbProvideDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTbProvide() {
        TbProvide tbProvide = new TbProvide();

        // enter all required fields

        log.debug("adding tbProvide...");
        tbProvide = tbProvideDao.save(tbProvide);

        tbProvide = tbProvideDao.get(tbProvide.getProvideId());

        assertNotNull(tbProvide.getProvideId());

        log.debug("removing tbProvide...");

        tbProvideDao.remove(tbProvide.getProvideId());

        // should throw DataAccessException 
        tbProvideDao.get(tbProvide.getProvideId());
    }
}