package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.TbProvideDtl;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TbProvideDtlDaoTest extends BaseDaoTestCase {
    @Autowired
    private TbProvideDtlDao tbProvideDtlDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveTbProvideDtl() {
        TbProvideDtl tbProvideDtl = new TbProvideDtl();

        // enter all required fields

        log.debug("adding tbProvideDtl...");
        tbProvideDtl = tbProvideDtlDao.save(tbProvideDtl);

        tbProvideDtl = tbProvideDtlDao.get(tbProvideDtl.getProvideDtlId());

        assertNotNull(tbProvideDtl.getProvideDtlId());

        log.debug("removing tbProvideDtl...");

        tbProvideDtlDao.remove(tbProvideDtl.getProvideDtlId());

        // should throw DataAccessException 
        tbProvideDtlDao.get(tbProvideDtl.getProvideDtlId());
    }
}